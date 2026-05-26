package com.tasks.servlet;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.tasks.dao.UserDao;
 
@WebServlet("/register")
public class Register extends HttpServlet {
 
    private final UserDao userDao = new UserDao();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/register.jsp")
           .forward(req, resp);
    }
 
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
 
        boolean success = userDao.register(name, username, email, password);
 
        if (success) {
            resp.sendRedirect(req.getContextPath() + "/login?registered=true");
        } else {
            req.setAttribute("error", "Username or email already taken.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp")
               .forward(req, resp);
        }
    }
}
