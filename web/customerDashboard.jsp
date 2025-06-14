<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model1.User"%>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tourist Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Apply the theme colors and background as in the manager dashboard */
        :root {
            --primary-color: #28a745; /* Green from manager dashboard */
            --background-color: #f4f4f9;
            --text-dark: #333;
            --secondary-color: #1e90ff;
        }

        body {
            font-family: 'Montserrat', sans-serif; /* Same font as in manager dashboard */
            background-color: var(--background-color);
            margin: 0;
            padding: 0;
        }

        /* Sidebar with theme */
        .sidebar {
            background-color: var(--primary-color);
            min-height: 100vh;
            color: white;
            padding-top: 20px;
            box-shadow: 2px 0 12px rgba(0, 0, 0, 0.1);
        }

        .sidebar .nav-link {
            color: #fff;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 8px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
        }

        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background-color: rgba(255, 255, 255, 0.15);
            color: #fff;
        }

        /* Main content */
        .main-content {
            padding: 40px;
            background-color: var(--background-color);
            min-height: 100vh;
        }

        /* Welcome section with green background */
        .welcome-section {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(8px);
            border-radius: 16px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .welcome-section h2 {
            font-weight: bold;
            font-size: 26px;
        }

        .user-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* Card and button styles */
        .card-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .btn-light {
            border-radius: 30px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-light:hover {
            background-color: var(--primary-color);
            color: white;
        }

        .dashboard-card {
            border: none;
            border-radius: 16px;
            background: white;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.12);
        }

        /* Slideshow adjustments for the theme */
        .slideshow-container {
            margin-top: 40px;
            position: relative;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        .hero-carousel {
            height: 500px;
        }

        .hero-carousel .carousel-item {
            height: 100%;
            transition: transform 1s ease, opacity 0.5s ease-out;
        }

        .hero-carousel .carousel-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            object-position: center;
        }

        .hero-carousel .carousel-caption {
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
            border-radius: 15px;
            padding: 20px;
            bottom: 50px;
            left: 50%;
            transform: translateX(-50%);
            width: 80%;
            max-width: 800px;
        }

        .hero-carousel .carousel-caption h5 {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .hero-carousel .carousel-caption p {
            font-size: 1.2rem;
        }

        .hero-carousel .carousel-indicators {
            bottom: 20px;
        }

        .hero-carousel .carousel-indicators button {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin: 0 8px;
            border: 2px solid white;
            background: transparent;
        }

        .hero-carousel .carousel-indicators button.active {
            background-color: white;
        }

        .hero-carousel .carousel-control-prev,
        .hero-carousel .carousel-control-next {
            width: 50px;
            height: 50px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            top: 50%;
            transform: translateY(-50%);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .hero-carousel:hover .carousel-control-prev,
        .hero-carousel:hover .carousel-control-next {
            opacity: 1;
        }

        /* Responsive adjustments */
        @media (max-width: 992px) {
            .hero-carousel {
                height: 400px;
            }
            
            .hero-carousel .carousel-caption {
                bottom: 30px;
                width: 90%;
            }
        }

        @media (max-width: 768px) {
            .hero-carousel {
                height: 300px;
            }
            
            .hero-carousel .carousel-caption {
                padding: 10px;
                bottom: 20px;
            }
        }

        @media (max-width: 576px) {
            .hero-carousel {
                height: 250px;
            }
            
            .hero-carousel .carousel-caption {
                display: none;
            }
        }
    </style>
</head>

<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 col-lg-2 sidebar">
            <div class="text-center mb-4">
                <h4>Visit Terengganu</h4>
            </div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="customerDashboard"><i class="fas fa-map-marked-alt"></i> Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AttractionController?action=publicList"><i class="fas fa-binoculars"></i> Tourist Attraction</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AccommodationController?action=publicList"><i class="fas fa-hotel"></i> See Accommodations</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="weather.jsp"><i class="fas fa-cloud-sun"></i> Weather</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="unsplash.jsp"><i class="fas fa-image"></i> Image Place</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </div>

        <!-- Main content -->
        <div class="col-md-9 col-lg-10 main-content">
            <div class="welcome-section">
                <div>
                    <h2>Welcome, <span class="text-primary"><%= user.getUsername() %></span>!</h2>
                    <p class="text-muted">Explore top destinations and plan your next journey 🌐</p>
                </div>
                <img src="https://ui-avatars.com/api/?name=<%= user.getUsername() %>&background=1e90ff&color=fff" class="user-avatar" alt="User Avatar">
            </div>

            <div class="row g-4">
                <!-- Tourist Attractions Section -->
                <div class="col-md-6">
                    <div class="card dashboard-card text-center">
                        <div class="card-body">
                            <i class="fas fa-binoculars card-icon"></i>
                            <h5 class="card-title">Tourist Attractions</h5>
                            <p class="card-text">Discover beautiful places to explore and enjoy!</p>
                            <a href="AttractionController?action=publicList" class="btn btn-light">Explore</a>
                        </div>
                    </div>
                </div>

                <!-- Accommodations Section -->
                <div class="col-md-6">
                    <div class="card dashboard-card text-center">
                        <div class="card-body">
                            <i class="fas fa-hotel card-icon"></i>
                            <h5 class="card-title">Accommodations</h5>
                            <p class="card-text">Find and plan cozy places to stay on your trip.</p>
                            <a href="AccommodationController?action=publicList" class="btn btn-light">Explore</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Enhanced Slideshow Section -->
            <div class="slideshow-container">
                <div id="heroCarousel" class="carousel slide hero-carousel" data-bs-ride="carousel">
                    <!-- Indicators -->
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
                    </div>
                    
                    <!-- Slides -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="image/1.jpg" class="d-block w-100" alt="Beautiful Beach">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Discover Paradise Beaches</h5>
                                <p>Explore the most beautiful coastal destinations with crystal clear waters</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="image/2.jpg" class="d-block w-100" alt="Luxury Hotel">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Luxury Accommodations</h5>
                                <p>Find the perfect place to stay during your travels</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="image/3.jpg" class="d-block w-100" alt="Mountain View">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Breathtaking Mountain Views</h5>
                                <p>Experience nature at its finest with our mountain destinations</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="image/4.jpg" class="d-block w-100" alt="Cozy Cabin">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Cozy Getaways</h5>
                                <p>Perfect retreats for romantic or family vacations</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Controls -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Initialize carousel with autoplay
    document.addEventListener('DOMContentLoaded', function() {
        const myCarousel = document.getElementById('heroCarousel');
        const carousel = new bootstrap.Carousel(myCarousel, {
            interval: 5000, // Change slide every 5 seconds
            pause: 'hover', // Pause on hover
            wrap: true // Infinite looping
        });

        // Add smooth transition effect
        const carouselItems = document.querySelectorAll('.carousel-item');
        carouselItems.forEach(item => {
            item.style.transition = 'opacity 1.5s ease';
        });

        // Add parallax effect on scroll
        window.addEventListener('scroll', function() {
            const scrollPosition = window.pageYOffset;
            const carousel = document.querySelector('.hero-carousel');
            if (carousel) {
                carousel.style.transform = `translateY(${scrollPosition * 0.3}px)`;
            }
        });

        // Add keyboard navigation
        document.addEventListener('keydown', function(e) {
            if (e.key === 'ArrowLeft') {
                carousel.prev();
            } else if (e.key === 'ArrowRight') {
                carousel.next();
            }
        });

        // Add touch swipe support for mobile
        let touchStartX = 0;
        let touchEndX = 0;
        
        myCarousel.addEventListener('touchstart', function(e) {
            touchStartX = e.changedTouches[0].screenX;
        }, false);

        myCarousel.addEventListener('touchend', function(e) {
            touchEndX = e.changedTouches[0].screenX;
            handleSwipe();
        }, false);

        function handleSwipe() {
            if (touchEndX < touchStartX - 50) {
                carousel.next();
            }
            if (touchEndX > touchStartX + 50) {
                carousel.prev();
            }
        }
    });
</script>
</body>
</html>
