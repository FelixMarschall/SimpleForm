const form = document.getElementById('new-item');
const button = document.getElementById('button-send');

function displaySuccessMessage() {
    // Change the button's color and text
    button.setAttribute('aria-busy', 'false');
    button.style.backgroundColor = 'green';
    button.textContent = 'Success';

    // Revert the changes after 2 seconds
    setTimeout(() => {
        button.style.backgroundColor = '';
        button.textContent = 'Create';
    }, 3000);
}

form.addEventListener('submit', (event) => {
    // Prevent the form from submitting normally
    event.preventDefault();

    // add button attribute aria-busy="true"
    button.setAttribute('aria-busy', 'true');

    console.log(form)
    // Create a FormData object, passing the form as a parameter
    const formData = new FormData(form);

    // Use fetch to send the form data to the server
    fetch('/admin', {
        method: 'POST',
        body: formData
    })
        .then(data => {
            displaySuccessMessage();
            form.reset();
        })
        .catch((error) => console.error('Error:', error));

});