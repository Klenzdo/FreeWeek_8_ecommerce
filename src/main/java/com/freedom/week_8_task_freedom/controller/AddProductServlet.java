package com.freedom.week_8_task_freedom.controller;

import com.freedom.week_8_task_freedom.dao.AdminDao;
import com.freedom.week_8_task_freedom.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "addProductsServlet", value = "/addProduct")
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_name = request.getParameter("product_name");
        String product_category = request.getParameter("product_category");
        double product_price = Double.parseDouble(request.getParameter("product_price"));
        int product_quantity = Integer.parseInt(request.getParameter("product_quantity"));
        String imagUrl = request.getParameter("product_image");

        AdminDao dao = new AdminDao();
        Product product = new Product(product_name,  product_price, product_quantity,product_category, imagUrl);
        boolean checks;
        try {
            checks = dao.addProductToStock(product);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String script;
        String redirectUrl = "AdminHome.jsp";
        if(checks){
            script = "<script>alert('product added successfully');window.location='" + redirectUrl + "'</script>";
        }else{
            script = "<script>alert('product already exists increase the unit if you can');window.location='" + redirectUrl + "'</script>";
        }
        response.setContentType("text/html");
        response.getWriter().println(script);
    }

}
