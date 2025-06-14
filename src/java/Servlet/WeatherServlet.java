package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.net.*;
import org.json.*;

public class WeatherServlet extends HttpServlet {

    private final String API_KEY = "4eb3703790b356562054106543b748b2";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String city = request.getParameter("city");

        if (city == null || city.trim().isEmpty()) {
            request.setAttribute("error", "Please enter a city name.");
            request.getRequestDispatcher("weather.jsp").forward(request, response);
            return;
        }

        String apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=" + 
                        URLEncoder.encode(city, "UTF-8") + 
                        "&appid=" + API_KEY + "&units=metric";

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader reader = new BufferedReader(
                new InputStreamReader(conn.getInputStream())
            );
            StringBuilder result = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                result.append(line);
            }

            JSONObject weatherData = new JSONObject(result.toString());

            request.setAttribute("weather", weatherData);
        } catch (Exception e) {
            request.setAttribute("error", "City not found or API error.");
        }

        request.getRequestDispatcher("weather.jsp").forward(request, response);
    }
}
