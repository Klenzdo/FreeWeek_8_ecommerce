<%@ page import="com.freedom.week_8_task_freedom.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.freedom.week_8_task_freedom.dao.AdminDao" %><%--
  Created by IntelliJ IDEA.
  User: MyUser
  Date: 11/17/2024
  Time: 2:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AdminDao dao = new AdminDao();

    List<Product> products = dao.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <style>
        /* Style the product cards */
        nav {
            background-color: #f2f2f2;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav h1 {
            font-size: 1.5rem;
        }

        nav ul {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            margin-left: 1rem;
        }

        nav ul li a {
            text-decoration: none;
            color: #333;
            font-size: 1.2rem;
            padding: 0.5rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        nav ul li a:hover {
            background-color: #ddd;
        }

        footer {
            margin-top: 2rem;
            padding: 1rem;
            text-align: center;
            color: #999;
        }

        .product-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            padding: 1rem;
            margin: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }

        .product-card img {
            width: 70%;
            max-height: 10rem;
            object-fit: cover;
            margin-bottom: 1rem;
            border-radius: 5px;
        }

        .product-card h2 {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
        }

        .product-card p {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 1rem;
        }

        .button-group button {
            margin: 0.5rem;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            font-size: 1.2rem;
            cursor: pointer;
        }

        /* Style the main content area */
        main {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
            gap: 2rem;
            padding: 2rem;
        }
    </style>
</head>
<body>
<nav>
    <h1>Welcome, ${sessionScope.username}!</h1>
    <ul>
        <li><a href="#">View Cart</a></li>
        <li><a href="#">View Likes</a></li>
        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
    </ul>
</nav>
<main>
    <%
        if(!products.isEmpty()){
            for(Product p : products){

    %>
    <div class="product-card">
        <img src="img/<%=p.getProduct_image()%>" alt="Product 1">
        <h2><%=p.getProductName()%></h2>
        <p>$<%=p.getPrice()%></p>
        <div class="button-group">
            <button class="add-to-cart" id="cartButton">Add to Cart</button>
            <button class="like" id="likeButton">Like</button>
            <button class="unlike" id="unLikeButton">Unlike</button>
        </div>
    </div>
    <%
            }
        }
    %>
</main>
<footer>
    <p>&copy; 2024 Freedoklenz. All rights reserved.</p>
    <p>Contact us at <a href="mailto:info@freedoklenz.com">info@freedoklenz.com</a></p>
</footer>
<script>
    const myButton = document.getElementById("cartButton");
    myButton.addEventListener("click", function() {
        window.location.href = "/my-servlet-url";
    });
    const myButton = document.getElementById("LikeButton");
    myButton.addEventListener("click", function() {
        window.location.href = "/my-servlet-url";
    });
    const myButton = document.getElementById("UnlikeButton");
    myButton.addEventListener("click", function() {
        window.location.href = "/my-servlet-url";
    });
</script>
</body>
</html>
