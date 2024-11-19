<%--
  Created by IntelliJ IDEA.
  User: MyUser
  Date: 11/17/2024
  Time: 2:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Page</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: #f2f2f2;
            font-family: sans-serif;
        }

        .login-box {
            width: 400px;
            height: 600px;
            background: #fff;
            color: #000;
            top: 50%;
            left: 50%;
            position: absolute;
            transform: translate(-50%, -50%);
            box-sizing: border-box;
            padding: 70px 30px;
        }

        h1 {
            margin: 0;
            padding: 0 0 20px;
            text-align: center;
            font-size: 28px;
        }

        form {
            width: 100%;
            margin: 0 auto;
        }

        label {
            font-size: 18px;
            display: block;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: none;
            border-bottom: 1px solid #000;
            outline: none;
            font-size: 16px;
        }

        input[type="submit"] {
            width: 100%;
            background: #000;
            color: #fff;
            border: none;
            padding: 15px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #f2f2f2;
            color: #000;
        }

        .signup-link {
            text-align: center;
            margin-top: 20px;
        }

        .signup-link a {
            color: #000;
            text-decoration: none;
        }

        .password-input {
            position: relative;
        }

        /*.password-input*/

    </style>
</head>
<body>
<div class="login-box">
    <h1>Register</h1>
    <form method="post" action="register">
        <label >First Name</label>
        <input type="text" placeholder="Enter First Name" name="firstname" required>
        <label >UserName</label>
        <input type="text" placeholder="Enter User Name" name="Username" required>
        <label >Email Address</label>
        <input type="email" placeholder="Enter Email Address" name="emailaddress" required>
        <label >Phone Number</label>
        <input type="tel" placeholder="Enter Phone Number" name="phonenumber" required>
        <label for="password">Password</label>
        <input type="password" placeholder="Enter Password" name="password" id="password" required>
        <label >Confirm Password</label>
        <input type="password" placeholder="Confirm Password" name="confirm-password" required>
        <div class="checkbox-container">
            <input type="checkbox" onclick="showPassword()"> Show Password
        </div>

        <input type="submit" value="Register">
    </form>
    <div class="signup-link">
        <p>Already have an account? <a href="index.jsp">Login</a></p>
    </div>
</div>
<script>
    function showPassword() {
        var passwordInput = document.getElementById("password");
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
        } else {
            passwordInput.type = "password";
        }
    }
</script>
</body>
</html>