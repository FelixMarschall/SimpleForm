const form_new_item = document.getElementById('new-item');
const form_update = document.getElementById('update-item');
const button = document.getElementById('button-send');

function displaySuccessMessage() {
    // Change the button's color and text
    button.setAttribute('aria-busy', 'false');
    button.style.backgroundColor = 'green';
    const buttonText = button.textContent;
    button.textContent = 'Success';

    // Revert the changes after 2 seconds
    setTimeout(() => {
        button.style.backgroundColor = '';
        button.textContent = buttonText;
    }, 3000);
}

// send post request
form_new_item.addEventListener('submit', (event) => {
    // Prevent the form from submitting normally
    event.preventDefault();

    const token = document.querySelector('meta[name="_csrf"]').getAttribute('content');
    const header = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');

    // add button attribute aria-busy="true"
    button.setAttribute('aria-busy', 'true');

    console.log(form_new_item)
    // Create a FormData object, passing the form as a parameter
    const formData = new FormData(form_new_item);

    // Use fetch to send the form data to the server
    fetch('/admin', {
        method: 'POST',
        body: formData,
        headers: {
            [header]: token
        }
    })
        .then(data => {
            displaySuccessMessage();
            form_new_item.reset();
        })
        .catch((error) => console.error('Error:', error));

});

form_update.addEventListener('submit', (event) => {
    // Prevent the form from submitting normally
    event.preventDefault();

    const token = document.querySelector('meta[name="_csrf"]').getAttribute('content');
    const header = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');

    // add button attribute aria-busy="true"
    button.setAttribute('aria-busy', 'true');

    let item = {};
    // Create a FormData object, passing the form as a parameter
    const formData = new FormData(form_update);
    formData.forEach((value, key) => {
        // Add the key-value pair to the object
        item[key] = value;
    });
    const item_id = item.id;
    console.log(item);

    // Use fetch to send the form data to the server
    fetch(`/admin/${item_id}`, {
        method: 'PUT',
        body: JSON.stringify(item),
        headers: {
            [header]: token,
            'Content-Type': 'application/json'
        }
    })
        .then(data => {
            displaySuccessMessage();
        })
        .catch((error) => console.error('Error:', error));

});