package controller;

import dao.AttractionDAO;
import model.Attraction;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AttractionController")
public class AttractionController extends HttpServlet {
    private AttractionDAO dao;

    @Override
    public void init() {
        dao = new AttractionDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("list".equals(action)) {
                listAttractions(request, response);
            } else if ("edit".equals(action)) {
                showEditForm(request, response);
            } else if ("delete".equals(action)) {
                deleteAttraction(request, response);
            } else if ("publicList".equals(action)) {
                listPublicAttractions(request, response);
            } else if ("Save".equals(request.getParameter("action"))) {
                saveAttraction(request, response);
            } else {
                response.sendRedirect("add_attraction.jsp");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listAttractions(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Attraction> list = dao.listAll();
        request.setAttribute("attractions", list);
        request.getRequestDispatcher("list_attractions.jsp").forward(request, response);
    }

    private void listPublicAttractions(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Attraction> list = dao.listAll();
        request.setAttribute("attractions", list);
        request.getRequestDispatcher("list_public_attractions.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Attraction attraction = dao.get(id);
        request.setAttribute("attraction", attraction);
        request.getRequestDispatcher("add_attraction.jsp").forward(request, response);
    }

    private void saveAttraction(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = request.getParameter("id").isEmpty() ? 0 : Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        String imageUrl = request.getParameter("image_url"); // Get image URL from request

        Attraction attraction = new Attraction();
        attraction.setId(id);
        attraction.setName(name);
        attraction.setType(type);
        attraction.setDescription(description);
        attraction.setImage(image);
        attraction.setImageUrl(imageUrl); // Set image URL

        dao.save(attraction);
        response.sendRedirect("AttractionController?action=list");
    }

    private void deleteAttraction(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.delete(id);
        response.sendRedirect("AttractionController?action=list");
    }
}