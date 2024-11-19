package com.freedom.week_8_task_freedom.controller;

import com.freedom.week_8_task_freedom.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String passwd = request.getParameter("password");
        UserDao userDAO = new UserDao();
        HttpSession session = request.getSession();;


        // initializing the userLogin method from the DAO
        boolean userLogIn;
        try {
            //Assigning the method to a boolean variable
            userLogIn = userDAO.checkUser(username, passwd);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        //To check if the user is an admin
        boolean adminLogIn = userDAO.forAdmin(username);

        if(userLogIn){
            session.setAttribute("username", username);
            if(adminLogIn){

                //if it's an admin then send to the admin home page
                String redirectUrl = "AdminHome.jsp";
                String script = "<script>alert('Admin login successful.');window.location='" + redirectUrl + "'</script>";
                response.setContentType("text/html");
                response.getWriter().println(script);
//                response.sendRedirect("AdminHome.jsp");
            }else{

                //if not then redirect to the homepage
                String redirectUrl = "HomePage.jsp";
                String script = "<script>alert('UserLogin successful.');window.location='" + redirectUrl + "'</script>";
                response.setContentType("text/html");
                response.getWriter().println(script);
//                response.sendRedirect("HomePage.jsp");
            }
        }else{
            String redirectUrl = "index.jsp";
            String script = "<script>alert('username or password incorrect');window.location='" + redirectUrl + "'</script>";
            response.setContentType("text/html");
            response.getWriter().println(script);
        }
    }
}
