<%@ page import="java.util.*, model.Attraction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Attractions List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body {
      background: linear-gradient(135deg, #28a745, #74ebd5);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Montserrat', sans-serif;
      margin: 0;
      padding: 0;
    }

    .container {
      background-color: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 1200px;
      color: #333;
    }

    h1 {
      font-size: 2.5rem;
      color: #333;
      text-align: center;
      margin-bottom: 20px;
      font-weight: 700;
    }

    .btn-container {
      display: flex;
      justify-content: space-between;
      gap: 15px;
      margin-top: 20px;
    }

    .back-btn, .add-btn {
      display: inline-block;
      padding: 10px 20px;
      border-radius: 6px;
      font-size: 1rem;
      text-decoration: none;
      text-align: center;
      width: 45%;
      transition: background-color 0.3s ease;
    }

    .back-btn {
      background-color: #28a745;
      color: white;
    }

    .back-btn:hover {
      background-color: #218838;
    }

    .add-btn {
      background-color: #007bff;
      color: white;
    }

    .add-btn:hover {
      background-color: #0056b3;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
      word-wrap: break-word;
    }

    th {
      background-color: #007bff;
      color: white;
      font-weight: 600;
    }

    tr:hover {
      background-color: #f1f1f1;
    }

    .image-preview {
      max-width: 100px;
      max-height: 60px;
      border-radius: 4px;
      cursor: pointer;
      transition: transform 0.3s ease;
    }

    .image-preview:hover {
      transform: scale(1.05);
    }

    .btn-container {
      display: flex;
      gap: 15px;
      justify-content: center;
    }

    .edit-btn, .delete-btn {
      padding: 8px 15px;
      border-radius: 5px;
      font-size: 1rem;
    }

    .edit-btn {
      background-color: #007bff;
      color: white;
    }

    .edit-btn:hover {
      background-color: #0056b3;
    }

    .delete-btn {
      background-color: #dc3545;
      color: white;
    }

    .delete-btn:hover {
      background-color: #b02a37;
    }

    .image-link {
      color: #007bff;
      text-decoration: none;
      font-size: 0.9rem;
    }

    .image-link:hover {
      text-decoration: underline;
    }

    @media (max-width: 768px) {
      table {
        width: 100%;
        overflow-x: auto;
        display: block;
      }

      th, td {
        padding: 10px;
        font-size: 14px;
      }

      .container {
        padding: 20px;
      }

      h1 {
        font-size: 2rem;
      }
      
      .btn-container {
        flex-direction: column;
      }
      
      .back-btn, .add-btn {
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Attractions List</h1>

    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Type</th>
          <th>Description</th>
          <th>Image</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${empty attractions}">
            <tr>
              <td colspan="5" style="text-align: center;">No attractions found</td>
            </tr>
          </c:when>
          <c:otherwise>
            <c:forEach items="${attractions}" var="a">
              <tr>
                <td>${a.name}</td>
                <td>${a.type}</td>
                <td>${a.description}</td>
                <td>
                  <c:if test="${not empty a.image}">
                    <c:choose>
                      <c:when test="${not empty a.imageUrl}">
                        <a href="${a.imageUrl}" target="_blank">
                          <img src="images/${a.image}" alt="${a.name}" class="image-preview">
                        </a>
                        <div>
                          <a href="${a.imageUrl}" target="_blank" class="image-link">View Source</a>
                        </div>
                      </c:when>
                      <c:otherwise>
                        <img src="images/${a.image}" alt="${a.name}" class="image-preview">
                      </c:otherwise>
                    </c:choose>
                  </c:if>
                  <c:if test="${empty a.image}">
                    No Image
                  </c:if>
                </td>
                <td>
                  <div class="btn-container">
                    <a href="AttractionController?action=edit&id=${a.id}" class="edit-btn">Edit</a>
                    <a href="AttractionController?action=delete&id=${a.id}" class="delete-btn" 
                       onclick="return confirm('Delete this attraction?')">Delete</a>
                  </div>
                </td>
              </tr>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>

    <div class="btn-container">
      <a href="managerDashboard.jsp" class="back-btn">← Back to Manager Dashboard</a>
      <a href="add_attraction.jsp" class="add-btn">+ Add New Attraction</a>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>