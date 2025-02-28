const container = document.querySelector('.container');
const signupLink = document.getElementById('signup-link');

signupLink.addEventListener('click', (e) => {
    e.preventDefault(); // Prevent default link behavior
    container.classList.add('active'); // Show the signup form
});
const signinLink = document.getElementById('signin-link');

signinLink.addEventListener('click', (e) => {
    e.preventDefault(); // Prevent default link behavior
    container.classList.remove('active'); // Show the login form
});