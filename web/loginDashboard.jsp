<%@ page import="Model1.User"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Guide</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>

<style>
/* style.css */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

body {
    font-family: 'Poppins', sans-serif;
    background-color: #fff; /* White background for the body */
    margin: 0;
}

.logo {
    height: 100%;
    width: 10%;
}

.container-fluid {
    margin: 40px 100px 100px 100px;
}

.login-button {
    padding: 10px 30px;
    background-color: #28a745; /* Green background */
    color: #fff;
    border-radius: 12px;
    text-decoration: none;
}

.offcanvas-body {
    color: #28a745; /* Green text */
}

.body_containnn_1 {
    margin: 0px 100px;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #fff; /* White background for this section */
}

.body_containnn_1 .left_contain {
    width: 50%;
}

.body_containnn_1 .left_contain h1 {
    font-size: 50px;
    font-weight: 900;
    color: #28a745; /* Green color */
    padding-bottom: 10px;
}

.body_containnn_1 .left_contain p {
    padding-bottom: 10px;
}

.solution {
    color: #28a745; /* Green */
}

.body_containnn_1 .right_contain {
    width: 50%;
    align-items: center;
    justify-content: right;
    text-align: right;
}

.body_containnn_1 .right_contain img {
    height: 100%;
    width: 80%;
}

.book-button {
    padding: 10px 30px;
    background-color: #28a745; /* Green background */
    color: #fff;
    border-radius: 12px;
    text-decoration: none;
}

.package_contain_1 {
    text-align: center;
    justify-content: center;
    align-items: center;
    margin: 200px 100px;
    background-color: #fff; /* White background */
}

.package_contain_1 h1 {
    font-size: 50px;
    font-weight: 900;
    color: #28a745; /* Green color */
    margin-bottom: 20px;
}

.package_contain_1 p {
    font-size: 18px;
    color: #555;
    margin-bottom: 40px;
}

.package_contain_1 .image_container_flex {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 30px; /* Increased gap */
    flex-wrap: wrap;
}

.package_contain_1 .image_container_flex img {
    width: 350px; /* Increased width */
    height: 250px; /* Increased height */
    object-fit: cover;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
}

.package_contain_1 .image_container_flex img:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

/* Responsive adjustments */
@media (max-width: 1400px) {
    .package_contain_1 .image_container_flex img {
        width: 300px;
        height: 220px;
    }
}

@media (max-width: 1200px) {
    .package_contain_1 .image_container_flex img {
        width: 280px;
        height: 200px;
    }
}

@media (max-width: 992px) {
    .package_contain_1 .image_container_flex {
        gap: 20px;
    }
    .package_contain_1 .image_container_flex img {
        width: 45%; /* Two per row */
        height: 220px;
    }
}

@media (max-width: 768px) {
    .package_contain_1 {
        margin: 100px 20px;
    }

    .package_contain_1 h1 {
        font-size: 36px;
    }

    .package_contain_1 .image_container_flex img {
        width: 100%;
        max-width: 400px;
        height: 280px;
        margin-bottom: 20px;
    }
}

@media (max-width: 576px) {
    .package_contain_1 .image_container_flex img {
        height: 220px;
    }

}

.how_it_works {
    align-items: center;
    justify-content: center;
    text-align: center;
    margin: 100px 100px;
    background-color: #fff; /* White background */
}

.how_it_works .row_1 {
    display: flex;
    padding: auto;
    align-items: center;
    justify-content: center;
    text-align: center;
}

.how_it_works h1 {
    font-size: 50px;
    font-weight: 900;
    color: #28a745; /* Green color */
}

.how_it_works .rec- {
    margin: auto;
    margin-top: 40px;
    height: 170px;
    width: 600px;
    background-color: #fff;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: left;
    box-shadow: 2px 2px 10px 0px #28a745; /* Green shadow */
}

.how_it_works .rec- .rec-logo {
    width: 20%;
    padding: 20px;
}

.how_it_works .rec- .rec-para {
    width: 80%;
    padding: 20px;
}

.how_it_works .rec- img {
    width: 80px;
}

.slim_para {
    font-weight: 800;
}

.why_choose {
    text-align: center;
    align-items: center;
    justify-content: center;
    margin: 100px;
    background-color: #fff; /* White background */
}

.why_choose h1 {
    font-size: 50px;
    font-weight: 900;
    color: #28a745; /* Green color */
}

.why_choose .same_line {
    display: flex;
}

.why_choose .rec_2 {
    margin: auto;
    margin-top: 20px;
    padding-top: 20px;
    height: 250px;
    width: 350px;
    background-color: #fff;
    border-radius: 12px;
    align-items: center;
    justify-content: center;
    text-align: center;
    box-shadow: 2px 2px 10px 0px #28a745; /* Green shadow */
}

.why_choose .rec_2 p {
    padding: 0 10px;
}

.why_choose .rec_2 img {
    width: 80px;
    padding-bottom: 20px;
}

.small_para {
    font-size: 12px;
}

.book_trip {
    text-align: center;
    align-items: center;
    justify-content: center;
    margin: 100px;
    background-color: #fff; /* White background */
}

.book_trip h1 {
    font-size: 50px;
    font-weight: 900;
    color: #28a745; /* Green color */
}

.book_trip p {
    width: 35%;
    margin: auto;
    margin-top: 40px;
    margin-bottom: 40px;
}

</style>

<body>
    <%
    if (request.getParameter("s") != null) {
        if (request.getParameter("s").equals("1")) {
    %>

<script>
    alert("Successfully Logged In");
</script>
<%
} else if(request.getParameter("s").equals("2")){
%>
<script>
    alert("Successfully Registered!");
</script>
<%
    }
}
%>
    <div class="nav_contain">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <img src="<%= request.getContextPath()%>/images1/logo.jpg" alt="" class="logo">
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">travelGuide</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                </div>
                <%
                    User user = new User();
                    if (session.getAttribute("user_id") != null) {
                %>
                <a href="logout.jsp" class="login-button">Log Out</a>
                <%
                } else {
                %>
                <a href="login.jsp" class="login-button">Login</a>
                <%
                    }

                %>

                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>
    </div>

    <div class="body_containnn_1">
        <div class="left_contain">
            <h1>
                Your One-Stop Solution for Perfect Tour Guides.
            </h1>
            <p>
                We simplify your travel planning by offering comprehensive tour guide that include hotel suggestions and
                attractions places in Terengganu.
            </p>
            <a href="login.jsp" class="book-button">Start Exploring</a>
        </div>
        <div class="right_contain">
            <img src="<%= request.getContextPath()%>/images1/Group 17.png" alt="">
        </div>
    </div>

    <div class="package_contain_1">
        <h1><span class="solution">Explore</span> Your <span class="solution">Next Adventure</span>.</h1>
        <p>Discover the beauty of Terengganu with our handpicked travel guide. Explore stunning locations, iconic landmarks, and unique experiences that match your interests.</p>
        <div class="image_container_flex">
            <a href="https://www.tripadvisor.com.my/Attraction_Review-g298320-d12641422-Reviews-Penarik_Beach-Kuala_Terengganu_Terengganu.html" target="_blank">
                <img src="<%= request.getContextPath()%>/images/penarik.jpg" alt="Penarik Beach">
            </a>
            <a href="https://www.tti.com.my/crystal-mosque/" target="_blank">
                <img src="<%= request.getContextPath()%>/images/masjidKristal.jpg" alt="Crystal Mosque">
            </a>
            <a href="https://terengganudrawbridge.com.my/" target="_blank">
                <img src="<%= request.getContextPath()%>/images1/OIP.jpg" alt="Jambatan Angkat">
            </a>
            <a href="https://pelancongan.my/pulau-perhentian/" target="_blank">
                <img src="<%= request.getContextPath()%>/images1/OIP2.jpg" alt="Pulau Perhentian">
            </a>
        </div>
    </div>

    <div class="how_it_works">
        <h1>How It <span class="solution">Works</span>?</h1>

        <div class="row_1">
            <div class="rec-">
                <div class="rec-logo">
                    <img src="<%= request.getContextPath()%>/images1/Group 18.png" alt="">
                </div>
                <div class="rec-para">
                    <p class="slim_para">1. Create Your Account</p>
                    <p>Sign up or log in to access more details about travel recommendation.</p>
                </div>
            </div>

            <div class="rec-">
                <div class="rec-logo">
                    <img src="<%= request.getContextPath()%>/images1/Group 19.png" alt=""/>
                </div>
                <div class="rec-para">
                    <p class="slim_para">2. Explore  Accommodations</p>
                    <p>Browse our curated travel guides featuring local attractions, hidden gems, and must-see spots. Filter by interests like culture, adventure, or relaxation.</p>
                </div>
            </div>
        </div>

        <div class="row_1">
            <div class="rec-">
                <div class="rec-logo">
                    <img src="<%= request.getContextPath()%>/images1/Group 20.png" alt=""/>
                </div>
                <div class="rec-para">
                    <p class="slim_para">3. Explore Attraction At Terengganu</p>
                    <p>Select activities and attractions to build your perfect trip. Our system automatically suggests optimal routes and time allocations between locations.</p>
                </div>
            </div>

            <div class="rec-">
                <div class="rec-logo">
                    <img src="<%= request.getContextPath()%>/images1/Group 21.png" alt=""/>
                </div>
                <div class="rec-para">
                    <p class="slim_para">4. Travel Smart</p>
                    <p>Access your digital guide anytime, with weather checker and real-time updates about your destinations.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="book_trip">
        <h1>Explore Your <span class="solution">Perfect Destination</span> Today!</h1>
        <p>Discover the best travel spots with TravelEase. Explore our curated travel guides, select your dream destination, and let us help you plan the perfect adventure. Your journey starts here.</p>
        <a href="login.jsp" class="book-button">Start Exploring</a>
    </div>

</body>
</html>
