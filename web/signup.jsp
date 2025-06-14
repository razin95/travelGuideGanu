<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up - Hall Booking System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #28a745, #74ebd5); /* Green gradient background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .signup-container {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            border: 2px solid #007bff; /* Blue border */
        }

        h2 {
            text-align: center;
            margin-bottom: 1rem;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 0.8rem;
            color: #333;
            font-weight: 500;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            padding: 0.8rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            margin-top: 0.2rem;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #007bff; /* Blue border on focus */
            outline: none;
            box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.2); /* Blue shadow */
        }

        button {
            margin-top: 1.5rem;
            padding: 0.8rem;
            background-color: #007bff; /* Blue background for Sign Up */
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 500;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #0056b3; /* Dark blue on hover */
            transform: translateY(-2px);
        }

        .links {
            text-align: center;
            margin-top: 1rem;
        }

        .links a {
            color: #007bff; /* Blue color for the link */
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .links a:hover {
            color: #0056b3; /* Dark blue on hover */
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h2>Create Account</h2>
        <form action="signup_process.jsp" method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Choose a username" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Create a password" required>

            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>

            <button type="submit">Sign Up</button>
        </form>
        <div class="links">
            <a href="login.jsp">Already have an account? Log in</a>
        </div>
    </div>
</body>
</html>
