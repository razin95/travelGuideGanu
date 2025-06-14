package Servlet;

import com.google.gson.*;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.*;
import java.util.*;
import Model1.ImageResult;


public class ImageSearchServlet extends HttpServlet {
    private static final String ACCESS_KEY = "wuLA9Ud1Q0eAkUiQtoMbN6TJQX89nEY3m9egmtzt96E";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
        String query = request.getParameter("query");
        List<ImageResult> results = new ArrayList<>();

        if (query != null && !query.trim().isEmpty()) {
            String apiUrl = "https://api.unsplash.com/search/photos?query=" + URLEncoder.encode(query, "UTF-8") + "&client_id=" + ACCESS_KEY + "&per_page=12";

            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            JsonObject json = JsonParser.parseReader(reader).getAsJsonObject();

            JsonArray photos = json.getAsJsonArray("results");
            for (JsonElement photoElem : photos) {
                JsonObject photo = photoElem.getAsJsonObject();
                String imgUrl = photo.getAsJsonObject("urls").get("small").getAsString();
                String photographer = photo.getAsJsonObject("user").get("name").getAsString();
                results.add(new ImageResult(imgUrl, photographer));
            }
        }

        request.setAttribute("results", results);
        request.getRequestDispatcher("unsplash.jsp").forward(request, response);
    }
}
