<%@ page import="java.util.*, model.Accommodation" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Explore Stays in Terengganu</title>
    
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background: white;
            margin: 0;
        }

        h1 {
            text-align: center;
            color: #28a745;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        /* Navigation bar styling */
        nav {
            background-color: #28a745;
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

        nav .nav-links a:hover, nav .nav-links .active {
            background-color: #006400;
            border-radius: 6px;
        }

        .container {
            max-width: 1200px;
            margin: 100px auto;
            padding: 0 20px;
        }

        /* Search Bar */
        .search-container {
            display: flex;
            justify-content: center;
            margin: 20px 0 30px;
        }

        .search-box {
            position: relative;
            width: 100%;
            max-width: 500px;
        }

        .search-input {
            width: 100%;
            padding: 12px 20px 12px 40px;
            border: 2px solid #ddd;
            border-radius: 30px;
            font-size: 16px;
            outline: none;
            transition: all 0.3s;
        }

        .search-input:focus {
            border-color: #28a745;
            box-shadow: 0 0 5px rgba(40, 167, 69, 0.5);
        }

        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #777;
        }

        /* Cards Layout */
        .cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .card {
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            width: 300px;
            overflow: hidden;
            margin: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: none;
        }

        .card.visible {
            display: block;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-content {
            padding: 15px;
        }

        .card h3 {
            margin-top: 0;
            font-size: 1.25rem;
            color: #28a745;
        }

        .card p {
            margin: 5px 0;
            color: #555;
        }

        /* Price styling */
        .price {
            font-weight: bold;
            color: #d35400;
        }

        /* Availability styling */
        .availability {
            font-style: italic;
        }

        /* Image link styling */
        .image-link a {
            color: #3498db;
            text-decoration: none;
        }

        .image-link a:hover {
            text-decoration: underline;
        }

        /* Load More Button */
        .load-more-container {
            text-align: center;
            margin: 30px 0;
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
        }

        .load-more-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        /* No results message */
        .no-results {
            text-align: center;
            width: 100%;
            padding: 20px;
            font-size: 1.2rem;
            color: #777;
            display: none;
        }

        /* Footer */
        footer {
            text-align: center;
            margin-top: 30px;
            padding: 20px;
            font-size: 1rem;
            color: #555;
            border-top: 1px solid #eee;
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

    <div class="container">
        <h1>Explore Stays in Terengganu</h1>

        <!-- Search Bar -->
        <div class="search-container">
            <div class="search-box">
                <i class="fas fa-search search-icon"></i>
                <input type="text" id="searchInput" class="search-input" placeholder="Search accommodations..." onkeyup="filterAccommodations()">
            </div>
        </div>

        <div class="cards" id="accommodationCards">
            <div class="no-results" id="noResults">No accommodations match your search.</div>
            
            <c:choose>
                <c:when test="${not empty accommodations}">
                    <c:forEach items="${accommodations}" var="a" varStatus="loop">
                        <div class="card ${loop.index < 3 ? 'visible' : ''}" data-index="${loop.index}">
                            <c:choose>
                                <c:when test="${not empty a.imageUrl}">
                                    <a href="${a.imageUrl}" target="_blank">
                                        <img src="images/${not empty a.image ? a.image : 'default.jpg'}" alt="${a.name}">
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <img src="images/${not empty a.image ? a.image : 'default.jpg'}" alt="${a.name}">
                                </c:otherwise>
                            </c:choose>

                            <div class="card-content">
                                <h3>${a.name}</h3>
                                <p><strong>Type:</strong> ${a.type}</p>
                                <p class="description">${a.description}</p>
                                <p><strong>Price:</strong> <span class="price">RM 
                                    <fmt:formatNumber value="${a.price}" pattern="#,##0.00"/>
                                </span></p>
                                <p class="availability"><strong>Available:</strong>
                                    ${not empty a.availableFrom ? a.availableFrom : 'N/A'}
                                    to
                                    ${not empty a.availableTo ? a.availableTo : 'N/A'}
                                </p>
                                <c:if test="${not empty a.imageUrl}">
                                    <p class="image-link">
                                        <a href="${a.imageUrl}" target="_blank">View Original Image</a>
                                    </p>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>No accommodations available right now.</p>
                </c:otherwise>
            </c:choose>
        </div>

        <c:if test="${not empty accommodations and accommodations.size() > 3}">
            <div class="load-more-container">
                <button id="loadMoreBtn" class="load-more-btn">Load More</button>
            </div>
        </c:if>
    </div>

    <footer>
        <p>&copy; 2023 Explore Terengganu. All Rights Reserved.</p>
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.card');
            const loadMoreBtn = document.getElementById('loadMoreBtn');
            let visibleCount = 3;

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
                        hiddenCards[0].scrollIntoView({ behavior: 'smooth', block: 'nearest' });
                    }
                });
            }
        });

        function filterAccommodations() {
            const input = document.getElementById("searchInput").value.toLowerCase();
            const cards = document.querySelectorAll('.card');
            const noResults = document.getElementById("noResults");
            let hasVisibleCards = false;
            
            cards.forEach(card => {
                const name = card.querySelector("h3").innerText.toLowerCase();
                const description = card.querySelector(".description").innerText.toLowerCase();
                const type = card.querySelectorAll("p")[0].innerText.toLowerCase();
                
                const isVisible = name.includes(input) || description.includes(input) || type.includes(input);
                card.style.display = isVisible ? "block" : "none";
                
                if (isVisible) {
                    hasVisibleCards = true;
                }
            });
            
            // Show/hide no results message
            noResults.style.display = hasVisibleCards ? "none" : "block";
            
            // Hide load more button when searching
            const loadMoreBtn = document.getElementById('loadMoreBtn');
            if (loadMoreBtn) {
                loadMoreBtn.style.display = input ? "none" : "block";
            }
        }
    </script>
</body>
</html>