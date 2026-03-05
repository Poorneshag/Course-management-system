<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background: url('https://as2.ftcdn.net/jpg/07/05/41/21/1000_F_705412111_zcTF5QE5CnV00qwpJPSVPNSAO41mPnGa.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
        }

        .card-login {
            background-color: rgba(0, 0, 0, 0.75); /* Dark semi-transparent */
            color: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.5);
        }

        .form-control {
            background-color: #f8f9fa;
        }

        .register-link {
            color: #ffc107;
            text-decoration: none;
        }

        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
        <div class="col-md-6 card-login">

            <h2 class="text-center mb-4">User Login</h2>

            <% 
                String msg = request.getParameter("message");
                if ("logout".equals(msg)) {
            %>
                <div class="alert alert-success text-center" role="alert">
                    You have been logged out successfully.
                </div>
            <% 
                } 
            %>

            <form action="Login" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" name="email" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" name="password" required>
                </div>

                <button type="submit" class="btn btn-warning w-100">Login</button>
            </form>

            <div class="text-center mt-3">
                <a href="register.jsp" class="register-link">New user? Register here</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (optional for components) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
