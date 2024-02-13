function deleteItem(event, itemId) {
    event.preventDefault();

    var token = document.querySelector('meta[name="_csrf"]').getAttribute('content');
    var header = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');

    fetch(`/admin/${itemId}`, {
        method: 'DELETE',
        headers: {
            [header]: token
        }
    })
        // .then(data => console.log(data))
        .then(response => {
            if (response.ok) {
                // Remove the parent row of the clicked button from the table
                var row = event.target.closest('tr');

                // Add a class to the row to change its background color to red
                row.classList.add('delete-row');

                // Delay the removal of the row for 2 seconds
                setTimeout(function () {
                    row.remove();
                }, 2000);
            } else {
                console.error('Error:', response.statusText);
            }
        })
        .catch((error) => console.error('Error:', error));
}