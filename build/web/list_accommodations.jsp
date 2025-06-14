<%@ page import="java.util.*, model.Accommodation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Accommodation List (Admin)</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(135deg, #28a745, #74ebd5);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 20px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .container:hover {
            box-shadow: 0 12px 45px rgba(0, 0, 0, 0.15);
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .top-bar h1 {
            margin: 0;
            color: #2c3e50;
            font-size: 2rem;
            font-weight: 600;
        }

        .button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 10px 20px;
            font-size: 14px;
            text-decoration: none;
            border-radius: 6px;
            color: white;
            background-color: #007bff;
            border: none;
            transition: all 0.3s ease;
            min-width: 135px;
            height: 38px;
            box-sizing: border-box;
            font-weight: 600;
            cursor: pointer;
        }

        .button:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .btn-delete {
            background-color: #e74c3c;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }

        .btn-container {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: 600;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ecf0f1;
            background-color: white;
        }

        tr:hover td {
            background-color: #f8f9fa;
        }

        .action-buttons {
            display: flex;
            gap: 15px;
            margin-top: 30px;
            justify-content: center;
        }

        .back-btn {
            background-color: #28a745;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            min-width: 135px;
            height: 38px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0 20px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        .add-btn {
            background-color: #007bff;
            min-width: 145px;
        }

        .add-btn:hover {
            background-color: #0056b3;
        }

        .image-link {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }

        .image-link:hover {
            text-decoration: underline;
        }

        .image-cell {
            max-width: 150px;
            word-break: break-all;
        }

        .image-preview {
            max-width: 100px;
            max-height: 60px;
            border-radius: 4px;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
                width: 95%;
            }

            .action-buttons {
                flex-direction: column;
                align-items: center;
                gap: 10px;
            }

            .back-btn, .add-btn {
                width: 100%;
            }

            table {
                display: block;
                overflow-x: auto;
            }
        }

        @media (max-width: 480px) {
            .btn-container {
                flex-direction: column;
                gap: 8px;
            }

            .button {
                width: 100%;
            }

            table {
                font-size: 14px;
            }

            th, td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="top-bar">
        <h1>Accommodation List</h1>
    </div>

    <table>
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>Description</th>
            <th>Price (RM)</th>
            <th>Availability</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        <%
            List<Accommodation> list = (List<Accommodation>) request.getAttribute("accommodations");
            if (list != null && !list.isEmpty()) {
                for (Accommodation a : list) {
        %>
        <tr>
            <td><%= a.getName() %></td>
            <td><%= a.getType() %></td>
            <td><%= a.getDescription() %></td>
            <td><%= String.format("%.2f", a.getPrice()) %></td>
            <td>
                <%= a.getAvailableFrom() != null ? a.getAvailableFrom() : "Not Set" %>
                to
                <%= a.getAvailableTo() != null ? a.getAvailableTo() : "Not Set" %>
            </td>
            <td class="image-cell">
                <% if (a.getImage() != null && !a.getImage().isEmpty()) { %>
                    <% if (a.getImageUrl() != null && !a.getImageUrl().isEmpty()) { %>
                        <a href="<%= a.getImageUrl() %>" target="_blank" class="image-link">
                            <img src="images/<%= a.getImage() %>" alt="Preview" class="image-preview">
                        </a>
                    <% } else { %>
                        <img src="images/<%= a.getImage() %>" alt="Preview" class="image-preview">
                    <% } %>
                <% } else { %>
                    No Image
                <% } %>
            </td>
            <td>
                <div class="btn-container">
                    <a class="button" href="AccommodationController?action=edit&id=<%= a.getId() %>">Edit</a>
                    <a class="button btn-delete" href="AccommodationController?action=delete&id=<%= a.getId() %>"
                       onclick="return confirm('Are you sure you want to delete this accommodation?')">Delete</a>
                </div>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7" style="text-align: center;">No accommodations found.</td>
        </tr>
        <% } %>
    </table>

    <div class="action-buttons">
        <a href="managerDashboard.jsp" class="back-btn">← Back to Dashboard</a>
        <a class="button add-btn" href="add_accommodation.jsp">+ Add New Accommodation</a>
    </div>
</div>
</body>
</html>