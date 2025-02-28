document.getElementById('uploadForm').addEventListener('submit', function (e) {
    e.preventDefault();

    let formData = new FormData(this);
    fetch('index.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.foodName) {
            // Show results on the page
            document.getElementById('foodName').textContent = data.foodName;
            document.getElementById('calories').textContent = data.calories;
            document.getElementById('resultsSection').style.display = 'block';

            // Optionally, display the uploaded image
            document.getElementById('previewImg').src = data.imagePath;
            document.getElementById('previewImg').style.display = 'block';
            document.getElementById('noImageText').style.display = 'none';
        } else {
            alert('Error: ' + data.error);
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
});
