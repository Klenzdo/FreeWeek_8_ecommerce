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
    AdminDao pd = new AdminDao();
    List<Product> products = pd.getAllProducts();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce Store Admin Dashboard</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* Set default font family and color */
        body {
            font-family: Arial, sans-serif;
            color: #333;
        }

        /* Set header style */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem;
            background-color: #f2f2f2;
        }

        /* Style logout link */
        header a {
            text-decoration: none;
            color: #666;
            border: 1px solid #666;
            padding: 0.5rem;
            border-radius: 5px;
        }

        /* Style search form */
        nav form {
            margin: 1rem 0;
        }

        nav label {
            margin-right: 0.5rem;
        }

        nav input[type="text"] {
            padding: 0.5rem;
            border-radius: 5px;
            border: none;
            box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
        }

        nav button[type="submit"] {
            padding: 0.5rem;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Style navigation links */
        nav ul {
            display: flex;
            justify-content: flex-end;
        }

        nav li {
            margin-left: 1rem;
        }

        nav a {
            text-decoration: none;
            color: #333;
        }

        nav a:hover {
            text-decoration: underline;
        }

        /* Style products table */
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 0.5rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Style remove button */
        .remove-btn {
            padding: 0.5rem;
            background-color: #ff6961;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .remove-btn:hover {
            background-color: #ff4136;
        }

        /* Style form for updating price and quantity */
        form {
            display: inline-block;
        }

        form label {
            display: inline-block;
            margin-right: 10px;
        }

        form input[type="number"] {
            width: 80px;
            padding: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            margin-right: 10px;
        }

        form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        form button[type="submit"]:hover {
            background-color: #3e8e41;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            z-index: 1;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            border-radius: 4px;
            padding: 10px;
        }

        .dropdown-content label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .dropdown-content input,
        .dropdown-content select {
            display: block;
            margin-bottom: 10px;
            padding: 5px;
            width: 100%;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .dropdown-content input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            padding: 10px;
        }

        .dropdown-content input[type="submit"]:hover {
            background-color: #3e8e41;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .add-product {
            display: inline-block;
            padding: 10px;
            background-color: #ddd;
            color: #333;
            font-weight: bold;
            text-decoration: none;
            border-radius: 4px;
        }

        .add-product:hover {
            background-color: #bbb;
        }

    </style>
</head>
<body>
<header>
    <h1>Welcome Admin</h1>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
    <div class="dropdown">
        <a href="#" class="add-product">Add Product</a>
        <div class="dropdown-content">
            <form action="addProduct" method="post">
                <label for="product_name">Product Name:</label>
                <input type="text" id="product_name" name="product_name" required>

                <label for="product_category">Product Category:</label>
                <select id="product_category" name="product_category" required>
                    <option value="">Please select a category</option>
                    <option value="electronics">Electronics</option>
                    <option value="clothing">Clothing</option>
                    <option value="home_goods">Home Goods</option>
                    <option value="food">Food</option>
                </select>

                <label for="product_price">Product Price:</label>
                <input type="number" id="product_price" name="product_price" required>

                <label for="product_quantity">Product Quantity:</label>
                <input type="number" id="product_quantity" name="product_quantity" required>

                <label for="product_image">Product_Image:</label>
                <input type="text" id="product_image" name="product_image" required>

                <input type="submit" value="Add Product">
            </form>
        </div>
    </div>
</header>
<nav>
    <form action="remove" method="post">
        <label for="search">Search Products:</label>
        <input type="text" id="search" name="product">
        <input type="submit" value="remove product">
    </form>
    <ul>
        <li><a href="#">View Orders</a></li>
        <%--        <li>--%>
        <%--        </li>--%>
    </ul>
</nav>
<main>
    <h2>Products List</h2>
    <table>
        <thead>
        <tr>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (!products.isEmpty()) {
                for (Product p : products) {
        %>
        <tr name="<%=p.getProductName()%>">
            <td><%=p.getProductName()%></td>
            <td>$<%=p.getPrice()%></td>
            <td><%=p.getQuantity()%></td>
            <td>
                <form method="post" action="price">
                    <label for="price">Set Price:</label>
                    <input type="hidden" name="product_name" value="<%= p.getProductName() %>">
                    <input type="number" id="price" name="price">
                    <button type="submit">Update</button>
                </form>
                <form method="post" action="quantity">
                    <label for="quantity">Set Quantity:</label>
                    <input type="hidden" name="product_name" value="<%= p.getProductName() %>">
                    <input type="number" id="quantity" name="quantity">
                    <button type="submit">Update</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</main>
</body>
</html>