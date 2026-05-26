package com.tasks.servlet;
 
import java.io.IOException;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.tasks.dao.TasksDao;
import com.tasks.dao.UserDao;
import com.tasks.dto.Task;
import com.tasks.dto.User;
 
@WebServlet("/app/admin/dashboard")
public class AdminDashboard extends HttpServlet {
 
    private final TasksDao tasksDao = new TasksDao();
    private final UserDao  userDao  = new UserDao();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        List<Task> tasks = tasksDao.fetchAllTask();
        List<User> users = userDao.fetchAllUser();
 
        req.setAttribute("tasks", tasks);
        req.setAttribute("users", users);
        req.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp")
           .forward(req, resp);
    }
}