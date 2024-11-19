package com.freedom.week_8_task_freedom.controller;

import com.freedom.week_8_task_freedom.dao.AdminDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UpdatePriceServlet", value = "/price")

public class UpdatePriceServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("product_name");
        double price = Double.parseDouble(request.getParameter("price"));
        AdminDao dao = new AdminDao();

        boolean check;
        try {
            check = dao.setPriceOfProduct(price, name);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String script;
        String redirectUrl = "AdminHome.jsp";
        if(check){
            script = "<script>alert('Set price successful');window.location='" + redirectUrl + "'</script>";
        }else{
            script = "<script>alert('Set price Unsuccessful');window.location='" + redirectUrl + "'</script>";
        }
        response.setContentType("text/html");
        response.getWriter().println(script);
    }
}
