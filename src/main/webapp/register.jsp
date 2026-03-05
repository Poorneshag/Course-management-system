<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('https://eu-images.contentstack.com/v3/assets/blt07f68461ccd75245/blt9c04c3815fa46f38/6617fa86671f11335b8ca73e/training_3.jpg?width=1280&auto=webp&quality=80&format=jpg&disable=upscale');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: white;
            position: relative;
        }

        /* Dark overlay */
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }

        .form-container {
            margin-top: 80px;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }

        .form-label {
            color: #333;
        }

        .btn-primary {
            background-color: #0069d9;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        a {
            color: #0069d9;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 form-container">
            <h2 class="mb-4 text-center text-dark">Student Registration</h2>
            <form action="RegisterServlet" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>
            </form>

            <div class="mt-3 text-center">
                <p class="text-dark">Already registered? <a href="login.jsp">Login here</a></p>
            </div>
        </div>
    </div>
</div>

</body>
</html>
