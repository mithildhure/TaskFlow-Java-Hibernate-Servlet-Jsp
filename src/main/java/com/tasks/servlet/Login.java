package com.tasks.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tasks.dao.UserDao;
import com.tasks.dto.Role;
import com.tasks.dto.User;

@WebServlet("/login")
public class Login extends HttpServlet {

    private final UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/login.jsp")
           .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userDao.login(username, password);

        if (user == null) {
            req.setAttribute("error", "Invalid username or password.");
            req.getRequestDispatcher("/WEB-INF/views/login.jsp")
               .forward(req, resp);
            return;
        }

        HttpSession session = req.getSession(true);
        session.setAttribute("loggedUser", user);
        session.setMaxInactiveInterval(30 * 60);   

        if (user.getRole() == Role.ADMIN) {
            resp.sendRedirect(req.getContextPath() + "/app/admin/dashboard");
        } else {
            resp.sendRedirect(req.getContextPath() + "/app/user/dashboard");
        }
    }
}