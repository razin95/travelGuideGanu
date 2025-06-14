<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Hall Booking System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #28a745, #74ebd5); /* Green gradient background */
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-container {
            background: white;
            padding: 2.5rem;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            border: 2px solid #007bff; /* Blue border for login container */
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #333;
            font-weight: 600;
            font-size: 1.8rem;
        }

        p.welcome-message {
            text-align: center;
            margin-bottom: 2rem;
            color: #666;
            font-size: 1rem;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        .input-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: 500;
            font-size: 0.95rem;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff; /* Blue border on focus */
            outline: none;
            box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.2); /* Blue shadow on focus */
        }

        .remember-me {
            display: flex;
            align-items: center;
            margin: 1rem 0;
        }

        .remember-me input {
            margin-right: 8px;
            cursor: pointer;
        }

        button {
            padding: 0.8rem;
            background-color: #007bff; /* Blue for Login button */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 500;
            margin-top: 0.5rem;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #0056b3; /* Dark blue on hover */
            transform: translateY(-2px);
        }

        button:active {
            transform: translateY(0);
        }

        .error-message {
            color: #d32f2f;
            margin: 1rem 0;
            text-align: center;
            font-size: 0.9rem;
            opacity: 0;
            height: 0;
            transition: opacity 0.3s ease, height 0.3s ease;
        }

        .error-message.show {
            opacity: 1;
            height: auto;
        }

        .links {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.9rem;
        }

        .links a {
            color: #007bff;
            text-decoration: none;
            display: block;
            margin: 0.5rem 0;
            transition: color 0.3s ease;
        }

        .links a:hover {
            color: #0056b3; /* Dark blue on hover */
            text-decoration: underline;
        }

        .password-toggle {
            position: absolute;
            right: 10px;
            top: 55%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #666;
            font-size: 0.8rem;
        }

        .password-toggle:hover {
            color: #007bff;
        }

        /* Dark mode toggle */
        .dark-mode-toggle {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #333;
            color: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 100;
        }

        /* Dark mode styles */
        body.dark-mode {
            background-color: #121212;
            color: #e0e0e0;
        }

        body.dark-mode .login-container {
            background-color: #1e1e1e;
            border-color: #444;
            color: #e0e0e0;
        }

        body.dark-mode h2,
        body.dark-mode label,
        body.dark-mode .links a {
            color: #e0e0e0;
        }

        body.dark-mode input[type="text"],
        body.dark-mode input[type="password"] {
            background-color: #2d2d2d;
            border-color: #444;
            color: #e0e0e0;
        }

        body.dark-mode .links a:hover {
            color: #fff;
        }
    </style>
</head>
<body>
    <button class="dark-mode-toggle" title="Toggle Dark Mode">🌓</button>
    
    <div class="login-container">
        <h2>Login</h2>
        <p class="welcome-message">Welcome! Please login to continue.</p>
        <form id="loginForm" action="login" method="post">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
                <span class="password-toggle" id="togglePassword">Show</span>
            </div>

            <div class="remember-me">
                <input type="checkbox" id="remember" name="remember">
                <label for="remember">Remember me</label>
            </div>

            <button type="submit" id="loginBtn">
                <span id="btnText">Login</span>
                <div class="spinner" id="spinner"></div>
            </button>

            <div class="error-message" id="errorMessage">
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <%= request.getAttribute("errorMessage") %>
                <% } %>
            </div>
        </form>

        <div class="links">
            <a href="signup.jsp">Don't have an account? Register here</a>
            <a href="forgot-password.jsp">Forgot Password?</a>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Password visibility toggle
            const togglePassword = document.querySelector('#togglePassword');
            const password = document.querySelector('#password');
            
            togglePassword.addEventListener('click', function() {
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                this.textContent = type === 'password' ? 'Show' : 'Hide';
            });
            
            // Dark mode toggle
            const darkModeToggle = document.querySelector('.dark-mode-toggle');
            darkModeToggle.addEventListener('click', function() {
                document.body.classList.toggle('dark-mode');
                const isDarkMode = document.body.classList.contains('dark-mode');
                localStorage.setItem('darkMode', isDarkMode);
                this.textContent = isDarkMode ? '🌞' : '🌙';
            });
            
            // Check for saved dark mode preference
            if (localStorage.getItem('darkMode') === 'true') {
                document.body.classList.add('dark-mode');
                darkModeToggle.textContent = '🌞';
            }
        });
    </script>
</body>
</html>
