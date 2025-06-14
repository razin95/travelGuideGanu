<%@ page import="Model1.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

    <!-- Google Fonts (Montserrat) -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;700&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(135deg, #28a745, #74ebd5); /* Updated color theme */
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Montserrat', sans-serif;
        }

        .container {
            background: #ffffff; /* White background for better contrast */
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15); /* Reduced shadow for smooth look */
            color: #333; /* Darker text color for readability */
            animation: fadeIn 1s ease;
            width: 100%;
            max-width: 800px;
            text-align: center;
        }

        /* Updated Welcome Card with Green background */
        .welcome-card {
            background: #28a745; /* Solid green background */
            padding: 30px;
            border-radius: 15px;
            margin-bottom: 40px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .welcome-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }

        .welcome-card h1 {
            font-size: 2.8rem;
            margin-bottom: 10px;
            color: #ffffff; /* White text */
            font-weight: 700;
        }

        .role-info {
            font-size: 1.4rem;
            color: #ffffff; /* White text */
            font-weight: bold;
            opacity: 0.9;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            color: #28a745;
            transition: all 0.3s ease;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .card i {
            font-size: 3rem;
            margin-bottom: 20px;
            color: #28a745;
        }

        .card h5 {
            font-size: 1.3rem;
            font-weight: 600;
            margin-top: 10px;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
            background: rgba(255, 255, 255, 1);
        }

        .logout-btn {
            display: inline-block;
            background-color: #ff4e50;
            padding: 12px 30px;
            color: white;
            text-decoration: none;
            border-radius: 25px;
            font-weight: bold;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            margin-top: 20px;
            border: none;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 600px) {
            .container {
                padding: 30px 20px;
            }

            .welcome-card h1 {
                font-size: 2rem;
            }

            .role-info {
                font-size: 1.1rem;
            }

            .card {
                padding: 20px 15px;
            }

            .card i {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Welcome Card with Green Background -->
        <div class="welcome-card">
            <h1>Welcome!</h1>
            <p class="role-info">Role: <strong>Admin</strong></p>
        </div>

        <!-- Dashboard Grid -->
        <div class="dashboard-grid">
            <a href="add_attraction.jsp" class="card">
                <i class="fas fa-map-marked-alt"></i>
                <h5>Tourist Attractions</h5>
            </a>

            <a href="add_accommodation.jsp" class="card">
                <i class="fas fa-hotel"></i>
                <h5>Accommodations</h5>
            </a>
        </div>

        <!-- Logout Button -->
        <button onclick="window.location.href='logout.jsp'" class="logout-btn">
            <i class="fas fa-sign-out-alt me-1"></i> Logout
        </button>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
