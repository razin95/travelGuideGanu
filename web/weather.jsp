<%@ page import="org.json.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bgStatus = "default";
    JSONObject weatherObj = (JSONObject) request.getAttribute("weather");
    JSONObject weatherMain = null;
    JSONObject weatherDetails = null;
    JSONObject sys = null;
    JSONObject wind = null;

    if (weatherObj != null) {
        weatherMain = weatherObj.getJSONArray("weather").getJSONObject(0);
        weatherDetails = weatherObj.getJSONObject("main");
        sys = weatherObj.getJSONObject("sys");
        wind = weatherObj.getJSONObject("wind");
        bgStatus = weatherMain.getString("main");
    }

    Map<String, String> bgMap = new HashMap<>();
    bgMap.put("Clouds", "img/clouds.jpg");
    bgMap.put("Rain", "img/rainy.jpg");
    bgMap.put("Clear", "img/clear.jpg");
    bgMap.put("Snow", "img/snow.jpg");
    bgMap.put("Thunderstorm", "img/thunderstorm.jpg");
    bgMap.put("Drizzle", "img/drizzle.jpg");
    bgMap.put("Mist", "img/mist.jpg");
    bgMap.put("Fog", "img/mist.jpg");

    String bgImg = bgMap.getOrDefault(bgStatus, "img/bg.jpg");

    Map<String, String> icons = new HashMap<>();
    icons.put("Clear", "fas fa-cloud-sun");
    icons.put("Clouds", "fas fa-cloud");
    icons.put("Rain", "fas fa-cloud-showers-heavy");
    icons.put("Snow", "fas fa-snowman");
    icons.put("Sunny", "fas fa-sun");
    icons.put("Mist", "fas fa-smog");
    icons.put("Thunderstorm", "fas fa-bolt");
    icons.put("Drizzle", "fas fa-cloud-rain");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Weather App</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Quicksand', sans-serif;
            color: #333;
            background: linear-gradient(135deg, #74ebd5, #acb6e5);
            min-height: 100vh;
            background-image: url('<%= bgImg%>');
            background-size: cover;
            background-position: center;
            transition: background-image 0.5s ease-in-out;
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


        /* Main Content */
        #parent {
            text-align: center;
            padding: 50px 20px;
            margin-top: 100px;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 20px;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.3);
        }

        input[type="text"] {
            padding: 12px 20px;
            font-size: 18px;
            border-radius: 12px;
            border: none;
            outline: none;
            width: 300px;
            max-width: 90%;
            margin-bottom: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        button {
            padding: 12px 24px;
            font-size: 18px;
            border: none;
            border-radius: 12px;
            background-color: #28a745; /* Green button */
            color: white;
            cursor: pointer;
            transition: 0.3s ease;
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }

        button:hover {
            background-color: #218838; /* Darker green on hover */
            transform: scale(1.05);
        }

        /* Weather Info */
        #weather-body {
            margin-top: 30px;
            padding: 30px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            backdrop-filter: blur(12px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
        }

        .temp {
            font-size: 48px;
            font-weight: bold;
            margin: 10px 0;
        }

        .weather {
            font-size: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .weather i {
            margin-left: 10px;
        }

        .min-max, .basic, .city, .date, #updated_on {
            font-size: 16px;
            margin-top: 10px;
        }

        hr {
            margin: 20px auto;
            width: 60%;
            border: 1px solid #fff;
            opacity: 0.4;
        }

        @media screen and (max-width: 600px) {
            nav {
                flex-direction: column;
                align-items: flex-start;
            }
            .nav-links {
                margin-top: 10px;
            }
            input[type="text"], button {
                width: 100%;
                margin-bottom: 10px;
            }
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


    <div id="parent">
        <h1>Check the Weather</h1>
        <form action="WeatherServlet" method="post">
            <input type="text" name="city" placeholder="Enter city name">
            <button type="submit">Search</button>
        </form>

        <% if (weatherObj != null) {%>
        <div id="weather-body">
            <div class="location-details">
                <div class="city"><%= weatherObj.getString("name")%>, <%= sys.getString("country")%></div>
                <div class="date"><%= new java.text.SimpleDateFormat("dd MMMM (EEEE), yyyy").format(new java.util.Date())%></div>
            </div>
            <div class="weather-status">
                <div class="temp"><%= Math.round(weatherDetails.getDouble("temp"))%>&deg;C</div>
                <div class="weather"><%= weatherMain.getString("main")%> <i class="<%= icons.getOrDefault(weatherMain.getString("main"), "fas fa-cloud-sun")%>"></i></div>
                <div class="min-max">
                    <%= Math.floor(weatherDetails.getDouble("temp_min"))%>&deg;C (min) /
                    <%= Math.ceil(weatherDetails.getDouble("temp_max"))%>&deg;C (max)
                </div>
                <div id="updated_on">
                    Updated as of <%= new java.text.SimpleDateFormat("HH:mm").format(new java.util.Date())%>
                </div>
            </div>
            <hr>
            <div class="day-details">
                <div class="basic">
                    Feels like <%= weatherDetails.getDouble("feels_like")%>&deg;C |
                    Humidity <%= weatherDetails.getInt("humidity")%>%<br>
                    Pressure <%= weatherDetails.getInt("pressure")%> mb |
                    Wind <%= wind.getDouble("speed")%> KMPH
                </div>
            </div>
        </div>
        <% } else if (request.getAttribute("error") != null) {%>
        <script>
        swal("Error", "<%= request.getAttribute("error")%>", "error");
        </script>
        <% }%>
    </div>
</body>
</html>
