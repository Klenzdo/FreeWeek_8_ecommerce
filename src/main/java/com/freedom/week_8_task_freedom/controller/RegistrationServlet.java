package com.freedom.week_8_task_freedom.controller;

import com.freedom.week_8_task_freedom.dao.UserDao;
import com.freedom.week_8_task_freedom.model.UserSignup;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegistrationServlet", value = "/register")

public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // this block is getting the parameters from the registration form
        String firstname = request.getParameter("firstname");
        String username = request.getParameter("Username");
        String email = request.getParameter("emailaddress");
        String phone = request.getParameter("phonenumber");
        String password = request.getParameter("password");
        RequestDispatcher dispatcher = null;

        // A new user created and assigned to a DAO execute the register user..
        UserSignup user = new UserSignup(firstname, username, email, phone, password);
        UserDao userDAO = new UserDao();
        boolean check = false;
        try {

            //checking if the user exists
            check = userDAO.registerUser(user);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        //if the user exists, redirect to login....
        if (check) {

            String redirectUrl = "index.jsp";
            String script = "<script>alert('Registration successful.');window.location='" + redirectUrl + "'</script>";
            response.setContentType("text/html");
            response.getWriter().println(script);
            response.sendRedirect("index.jsp");
        }else {
//                response.sendRedirect("register");

            String redirectUrl = "/Registration.jsp";
            String script =  "<script>alert('Registration Not successful, user name exists.');window.location='" + redirectUrl + "'</script>";
            response.setContentType("text/html");
            response.getWriter().println(script);
        }

    }
}
