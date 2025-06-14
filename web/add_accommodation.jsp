<%@ page import="model.Accommodation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add/Edit Accommodation</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #28a745, #74ebd5);
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-container {
            width: 100%;
            max-width: 1000px;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            margin: 20px 0;
        }

        .form-container:hover {
            box-shadow: 0 12px 45px rgba(0, 0, 0, 0.15);
        }

        h2 {
            font-size: 2rem;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        label {
            font-weight: 600;
            color: #495057;
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        input[type="url"],
        textarea,
        select {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border-radius: 8px;
            border: 2px solid #ddd;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus,
        input[type="url"]:focus,
        textarea:focus,
        select:focus {
            border-color: #28a745;
            outline: none;
            box-shadow: 0 0 0 3px rgba(40, 167, 69, 0.2);
        }

        textarea {
            min-height: 120px;
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 14px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s ease;
            margin-top: 20px;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #28a745;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
            text-align: center;
            width: 100%;
        }

        a:hover {
            color: #218838;
            text-decoration: underline;
        }

        .image-preview {
            margin-top: 15px;
            text-align: center;
        }

        .image-preview img {
            max-width: 100%;
            max-height: 200px;
            border-radius: 8px;
            border: 2px solid #ddd;
            margin-top: 10px;
            transition: transform 0.3s ease;
        }

        .image-preview img:hover {
            transform: scale(1.05);
        }

        .image-link {
            display: block;
            margin-top: 5px;
            font-size: 14px;
            color: #6c757d;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 20px;
                width: 90%;
            }

            h2 {
                font-size: 1.8rem;
            }

            input[type="submit"] {
                padding: 12px 18px;
            }
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 15px;
            }

            h2 {
                font-size: 1.5rem;
            }

            input[type="submit"] {
                padding: 12px 15px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>${empty accommodation.id ? 'Add New' : 'Edit'} Accommodation</h2>

        <form action="AccommodationController" method="post">
            <input type="hidden" name="id" value="${accommodation != null ? accommodation.id : ''}">

            <label for="name">Name:</label>
            <input type="text" name="name" required value="${accommodation != null ? accommodation.name : ''}" placeholder="Enter accommodation name">

            <label for="type">Type:</label>
            <select name="type" required>
                <option value="Homestay" ${accommodation != null && accommodation.type == "Homestay" ? "selected" : ""}>Homestay</option>
                <option value="Chalet" ${accommodation != null && accommodation.type == "Chalet" ? "selected" : ""}>Chalet</option>
                <option value="Villa" ${accommodation != null && accommodation.type == "Villa" ? "selected" : ""}>Villa</option>
            </select>

            <label for="description">Description:</label>
            <textarea name="description" required placeholder="Enter accommodation description">${accommodation != null ? accommodation.description : ''}</textarea>

            <label for="price">Price (RM):</label>
            <input type="number" name="price" step="0.01" required value="${accommodation != null ? accommodation.price : ''}" placeholder="Enter price">

            <label for="available_from">Available From:</label>
            <input type="date" name="available_from" value="${accommodation != null ? accommodation.availableFrom : ''}" required>

            <label for="available_to">Available To:</label>
            <input type="date" name="available_to" value="${accommodation != null ? accommodation.availableTo : ''}" required>

            <label for="image">Image Filename (e.g. villa.jpg):</label>
            <input type="text" name="image" id="imageInput" value="${accommodation != null ? accommodation.image : ''}" placeholder="Enter image filename">
            
            <label for="image_url">Image Source URL:</label>
            <input type="url" name="image_url" id="imageUrlInput" value="${accommodation != null ? accommodation.imageUrl : ''}" placeholder="https://example.com/image-source">
            
            <div class="image-preview" id="imagePreview">
                <c:if test="${not empty accommodation.image}">
                    <a href="${not empty accommodation.imageUrl ? accommodation.imageUrl : '#'}" target="_blank">
                        <img src="images/${accommodation.image}" alt="${accommodation.name}">
                    </a>
                    <c:if test="${not empty accommodation.imageUrl}">
                        <span class="image-link">Image Source: <a href="${accommodation.imageUrl}" target="_blank">View Original</a></span>
                    </c:if>
                </c:if>
            </div>

            <input type="submit" name="action" value="Save">
        </form>

        <a href="AccommodationController?action=list">View All Accommodations List</a>
    </div>

  <script>
    // Image preview functionality
    document.getElementById('imageInput').addEventListener('input', function() {
        updateImagePreview();
    });

    // Update preview when URL changes
    document.getElementById('imageUrlInput').addEventListener('input', function() {
        updateImagePreview();
    });

    function updateImagePreview() {
        const imageName = document.getElementById('imageInput').value;
        const imageUrl = document.getElementById('imageUrlInput').value;
        const previewDiv = document.getElementById('imagePreview');
        
        if (imageName) {
            // Create elements safely without template literals
            const link = document.createElement('a');
            link.href = imageUrl || '#';
            link.target = '_blank';
            
            const img = document.createElement('img');
            img.src = 'images/' + imageName;
            img.alt = 'Preview';
            
            link.appendChild(img);
            
            // Clear previous content
            previewDiv.innerHTML = '';
            previewDiv.appendChild(link);
            
            // Add source link if URL exists
            if (imageUrl) {
                const sourceSpan = document.createElement('span');
                sourceSpan.className = 'image-link';
                sourceSpan.innerHTML = 'Image Source: ';
                
                const sourceLink = document.createElement('a');
                sourceLink.href = imageUrl;
                sourceLink.target = '_blank';
                sourceLink.textContent = 'View Original';
                
                sourceSpan.appendChild(sourceLink);
                previewDiv.appendChild(sourceSpan);
            }
        } else {
            previewDiv.innerHTML = '';
        }
    }
</script>
</body>
</html>