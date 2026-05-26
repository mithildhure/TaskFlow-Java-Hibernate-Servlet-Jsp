package com.tasks.servlet;
 
import java.io.IOException;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.tasks.dao.TasksDao;
import com.tasks.dto.Task;
import com.tasks.dto.User;
 
@WebServlet("/app/user/dashboard")
public class UserDashboard extends HttpServlet {
 
    private final TasksDao tasksDao = new TasksDao();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        User loggedUser = (User) req.getSession().getAttribute("loggedUser");
        List<Task> tasks = tasksDao.fetchTaskByUser(loggedUser.getUser_id());
 
        req.setAttribute("tasks", tasks);
        req.setAttribute("user", loggedUser);
        req.getRequestDispatcher("/WEB-INF/views/user/dashboard.jsp")
           .forward(req, resp);
    }
}