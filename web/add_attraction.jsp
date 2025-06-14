<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add/Edit Tourist Attraction</title>
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
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            color: #333;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
            font-weight: 700;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"],
        input[type="url"],
        select,
        textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e9ecef;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="url"]:focus,
        select:focus,
        textarea:focus {
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
            padding: 12px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        a {
            display: inline-block;
            margin-top: 25px;
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

        select {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 15px;
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
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${empty attraction.id ? 'Add New' : 'Edit'} Tourist Attraction</h1>

        <form action="AttractionController" method="post">
            <input type="hidden" name="id" value="${attraction.id}">
            
            <div>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required 
                       value="${attraction.name}" placeholder="Enter attraction name">
            </div>
            
            <div>
                <label for="type">Type:</label>
                <select id="type" name="type" required>
                    <option value="" disabled ${empty attraction.type ? 'selected' : ''}>Select type</option>
                    <option value="Beach" ${attraction.type == "Beach" ? "selected" : ""}>Beach</option>
                    <option value="Museum" ${attraction.type == "Museum" ? "selected" : ""}>Museum</option>
                    <option value="Island" ${attraction.type == "Island" ? "selected" : ""}>Island</option>
                    <option value="Cultural Site" ${attraction.type == "Cultural Site" ? "selected" : ""}>Cultural Site</option>
                </select>
            </div>

            <div>
                <label for="description">Description:</label>
                <textarea id="description" name="description" required 
                          placeholder="Enter attraction description">${attraction.description}</textarea>
            </div>

            <div>
                <label for="image">Image Filename (e.g. beach1.jpg):</label>
                <input type="text" id="image" name="image" 
                       value="${attraction.image}" placeholder="Enter image filename">
            </div>

          



            <input type="submit" name="action" value="Save">
        </form>

        <a href="AttractionController?action=list">View All Attractions List</a>
    </div>
</body>
</html>