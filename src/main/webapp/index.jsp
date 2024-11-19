<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login Page</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      background: #f2f2f2;
      font-family: sans-serif;
    }

    .login-box {
      width: 400px;
      height: 400px;
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
  </style>
</head>
<body>
<div class="login-box">
  <h1>Login</h1>
  <form action ="login" method="post">
    <label for="username">Username</label>
    <input type="text" placeholder="Enter Username" name="username" required>
    <label for="password">Password</label>
    <input type="password" placeholder="Enter Password" name="password" required>
    <input type="submit" value="Login">
  </form>
  <div class="signup-link">
    <p>Don't have an account? <a href="Registration.jsp">Sign Up</a></p>
  </div>
</div>
</body>
</html>