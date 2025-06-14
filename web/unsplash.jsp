<%@ page import="Model1.ImageResult"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unsplash Image Search</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: white; /* White background */
            color: #333; /* Set text color to dark for better readability */
        }

        /* Navigation bar styling */
        nav {
            background-color: #28a745; /* Green navbar */
            padding: 10px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        nav .nav-links {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        nav .nav-links a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
            font-size: 1rem;
            transition: background-color 0.3s;
        }

 
        .container {
            max-width: 1100px;
            margin: 100px auto; /* Margin top to prevent overlap with navbar */
            padding: 2rem;
            background-color: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

        .container h1 {
            font-size: 2rem;
            text-align: center;
            margin-bottom: 2rem;
            color: #28a745; /* Green color for header */
        }

        .search-box {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .search-box input[type="text"] {
            padding: 0.7rem;
            width: 300px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            border: 1px solid #28a745; /* Green border */
        }

        .search-box button {
            background-color: #28a745; /* Green button */
            border: none;
            border-radius: 5px;
            padding: 0.7rem 1.2rem;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            color: white;
            transition: background-color 0.3s ease;
        }

        .search-box button:hover {
            background-color: #006400; /* Darker green on hover */
        }

        #image-results {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 1.5rem;
        }

        .image-item {
            width: 250px;
            height: 250px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0,0,0,0.3);
            transition: transform 0.3s ease;
            text-align: center;
        }

        .image-item:hover {
            transform: scale(1.05); /* Hover effect */
        }

        .image-item img {
            width: 100%;
            height: 100%; /* Set height to 100% to fill the container */
            object-fit: cover; /* Ensure images fill the container proportionally */
            display: block;
            border-bottom: 2px solid #28a745; /* Green border under the image */
        }

        .photographer {
            padding: 0.5rem;
            font-size: 0.9rem;
            color: #f1faee;
            background-color: #006400; /* Dark green background */
            text-align: center;
        }
    </style>
</head>
<body>

  <!-- Navigation Bar -->
  <nav>
    <div class="nav-links">
        <a href="unsplash.jsp" class="<%= request.getRequestURI().contains("unsplash.jsp") ? "active" : ""%>">Image Place</a>
        <a href="weather.jsp" class="<%= request.getRequestURI().contains("weather.jsp") ? "active" : ""%>">Check Weather</a>
        <a href="AccommodationController?action=publicList" class="<%= request.getRequestURI().contains("AccommodationController?action=publicList") ? "active" : ""%>">See Accommodation</a>
        <a href="AttractionController?action=publicList" class="<%= request.getRequestURI().contains("AttractionController?action=publicList") ? "active" : ""%>">Tourist Attraction</a>
        <a href="customerDashboard.jsp" class="<%= request.getRequestURI().contains("customerDashboard.jsp") ? "active" : ""%>">Back</a>
    </div>
  </nav>

<div class="container">
    <h1>📸 Search Photo</h1>
    <form method="get" action="ImageSearchServlet">
        <div class="search-box">
            <input type="text" name="query" placeholder="For example: Dungun" required>
            <button type="submit">Search</button>
        </div>
    </form>

    <div id="image-results">
        <%
            List<ImageResult> results = (List<ImageResult>) request.getAttribute("results");
            if (results != null) {
                for (ImageResult img : results) {
        %>
        <div class="image-item">
            <img src="<%= img.getUrl() %>" alt="Image from Unsplash">
            <div class="photographer">📷 <%= img.getPhotographer() %></div>
        </div>
        <%
                }
            } else {
        %>
        <p style="color:white; text-align: center;">Please make a search to show the photos.</p>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
