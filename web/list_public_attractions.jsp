<%@ page import="java.util.*, model.Attraction" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Explore Terengganu Attractions</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        
        h1 {
            text-align: center;
            font-size: 2.5rem;
            color: #28a745;
            margin-bottom: 30px;
            padding-top: 80px; /* Added padding-top to avoid overlap with navbar */
        }
        
        nav {
            background-color: #28a745;
            padding: 10px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
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
            transition: all 0.3s;
        }
        

        /* Search Bar */
        .search-bar {
            text-align: center;
            margin-top: 80px; /* Added more margin-top to ensure no overlap with navbar */
            margin-bottom: 30px;
        }

        .search-bar input[type="text"] {
            padding: 10px;
            width: 300px;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .search-bar button {
            padding: 10px 20px;
            margin-left: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1rem;
            transition: all 0.3s;
        }

        .search-bar button:hover {
            background-color: #218838;
        }

        .container {
            max-width: 1200px;
            margin: 100px auto 30px;
            padding: 0 20px;
        }

        .cards {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
        }

        .card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 320px;
            overflow: hidden;
            transition: all 0.3s ease;
            position: relative;
            display: none;
        }

        .card.visible {
            display: block;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
        }

        .card-image-container {
            width: 100%;
            height: 220px;
            overflow: hidden;
            position: relative;
        }

        .card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .card:hover img {
            transform: scale(1.05);
        }

        .card-content {
            padding: 20px;
        }

        .card h3 {
            margin: 0 0 10px 0;
            font-size: 1.3rem;
            color: #28a745;
        }

        .card p {
            margin: 8px 0;
            color: #555;
            line-height: 1.5;
        }

        .card .type {
            display: inline-block;
            background: #e9f5ee;
            color: #28a745;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }

        .image-link-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 220px;
            z-index: 2;
            cursor: pointer;
            opacity: 0;
            transition: opacity 0.3s;
            background: rgba(0,0,0,0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }

        .card:hover .image-link-overlay {
            opacity: 1;
        }

        .load-more-container {
            text-align: center;
            margin: 40px 0;
        }

        .load-more-btn {
            display: inline-block;
            width: 200px;
            padding: 12px 0;
            text-align: center;
            background-color: #28a745;
            color: white;
            font-size: 1rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .load-more-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }

        footer {
            text-align: center;
            padding: 20px;
            background: #333;
            color: #fff;
            font-size: 1rem;
            margin-top: 50px;
        }

        @media (max-width: 768px) {
            nav .nav-links {
                flex-direction: column;
                align-items: center;
            }

            .card {
                width: 100%;
                max-width: 350px;
            }

            h1 {
                font-size: 2rem;
            }
        }
        
                nav .nav-links a:hover, nav .nav-links .active {
            background-color: #006400; /* Dark green on hover */
            border-radius: 6px;
        }
    </style>
</head>
<body>
  <nav>
    <div class="nav-links">
        <a href="unsplash.jsp" class="<%= request.getRequestURI().contains("unsplash.jsp") ? "active" : ""%>">Image Place</a>
        <a href="weather.jsp" class="<%= request.getRequestURI().contains("weather.jsp") ? "active" : ""%>">Check Weather</a>
        <a href="AccommodationController?action=publicList" class="<%= request.getRequestURI().contains("AccommodationController?action=publicList") ? "active" : ""%>">See Accommodation</a>
        <a href="AttractionController?action=publicList" class="<%= request.getRequestURI().contains("AttractionController?action=publicList") ? "active" : ""%>">Tourist Attraction</a>
        <a href="customerDashboard.jsp" class="<%= request.getRequestURI().contains("customerDashboard.jsp") ? "active" : ""%>">Back</a>
    </div>
  </nav>

    <!-- Search Bar -->
    <div class="search-bar">
        <input type="text" id="searchInput" placeholder="Search attractions..." onkeyup="filterAttractions()">
        <button onclick="filterAttractions()">Search</button>
    </div>

    <div class="container">
        <h1>Explore Terengganu Attractions</h1>

        <div class="cards" id="attractionCards">
            <c:choose>
                <c:when test="${not empty attractions}">
                    <c:forEach items="${attractions}" var="a" varStatus="loop">
                        <div class="card ${loop.index < 3 ? 'visible' : ''}" data-index="${loop.index}">
                            <div class="card-image-container">
                                <img src="images/${not empty a.image ? a.image : 'default.jpg'}" alt="${a.name}">
                                <a href="${not empty a.imageUrl ? a.imageUrl : '#'}" class="image-link-overlay" target="_blank">
                                    View Full Image
                                </a>
                            </div>
                            <div class="card-content">
                                <span class="type">${a.type}</span>
                                <h3>${a.name}</h3>
                                <p>${not empty a.description ? a.description : 'No description available'}</p>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p style="text-align: center; width: 100%;">No attractions available right now.</p>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="load-more-container">
            <button id="loadMoreBtn" class="load-more-btn">Load More Attractions</button>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Explore Terengganu Attractions. All Rights Reserved.</p>
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.card');
            const loadMoreBtn = document.getElementById('loadMoreBtn');
            let visibleCount = 3;

            if (cards.length <= visibleCount && loadMoreBtn) {
                loadMoreBtn.style.display = 'none';
            }

            if (loadMoreBtn) {
                loadMoreBtn.addEventListener('click', function() {
                    const hiddenCards = document.querySelectorAll('.card:not(.visible)');
                    const cardsToShow = Math.min(3, hiddenCards.length);
                    
                    for (let i = 0; i < cardsToShow; i++) {
                        hiddenCards[i].classList.add('visible');
                    }

                    visibleCount += cardsToShow;
                    
                    if (visibleCount >= cards.length) {
                        loadMoreBtn.style.display = 'none';
                    }
                    
                    if (hiddenCards[0]) {
                        hiddenCards[0].scrollIntoView({ 
                            behavior: 'smooth', 
                            block: 'nearest'
                        });
                    }
                });
            }
        });

        function filterAttractions() {
            const input = document.getElementById("searchInput").value.toLowerCase();
            const cards = document.querySelectorAll('.card');
            cards.forEach(card => {
                const name = card.querySelector("h3").innerText.toLowerCase();
                card.style.display = (name.includes(input)) ? "" : "none";
            });
        }
    </script>
</body>
</html>
