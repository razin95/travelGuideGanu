/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package controller;

import dao.AccommodationDAO;
import model.Accommodation;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/AccommodationController")
public class AccommodationController extends HttpServlet {
    private AccommodationDAO dao;

    @Override
    public void init() {
        dao = new AccommodationDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // redirect POST to GET
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("list".equals(action)) {
                listAdmin(request, response);
            } else if ("edit".equals(action)) {
                showEditForm(request, response);
            } else if ("delete".equals(action)) {
                delete(request, response);
            } else if ("publicList".equals(action)) {
                listUser(request, response);
            } else if ("Save".equals(request.getParameter("action"))) {
                save(request, response);
            } else {
                response.sendRedirect("add_accommodation.jsp");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Accommodation> list = dao.listAll();
        request.setAttribute("accommodations", list);
        request.getRequestDispatcher("list_accommodations.jsp").forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Accommodation> list = dao.listAll();
        request.setAttribute("accommodations", list);
        request.getRequestDispatcher("list_public_accommodations.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Accommodation a = dao.get(id);
        request.setAttribute("accommodation", a);
        request.getRequestDispatcher("add_accommodation.jsp").forward(request, response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = request.getParameter("id").isEmpty() ? 0 : Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        String imageUrl = request.getParameter("image_url"); // Get the image URL from request

        String fromStr = request.getParameter("available_from");
        String toStr = request.getParameter("available_to");

        LocalDate availableFrom = LocalDate.parse(fromStr);
        LocalDate availableTo = LocalDate.parse(toStr);

        Accommodation a = new Accommodation();
        a.setId(id);
        a.setName(name);
        a.setType(type);
        a.setDescription(description);
        a.setPrice(price);
        a.setImage(image);
        a.setImageUrl(imageUrl); // Set the image URL
        a.setAvailableFrom(availableFrom);
        a.setAvailableTo(availableTo);

        dao.save(a);
        response.sendRedirect("AccommodationController?action=list");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.delete(id);
        response.sendRedirect("AccommodationController?action=list");
    }
}