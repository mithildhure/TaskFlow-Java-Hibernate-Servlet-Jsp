package com.tasks.servlet;
 
import java.io.IOException;
import java.time.LocalDate;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.tasks.dao.TasksDao;
import com.tasks.dao.UserDao;
import com.tasks.dto.User;
 
@WebServlet("/app/admin/tasks/add")
public class AddTask extends HttpServlet {
 
    private final TasksDao tasksDao = new TasksDao();
    private final UserDao  userDao  = new UserDao();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("users", userDao.fetchAllUser());
        req.getRequestDispatcher("/WEB-INF/views/admin/addTask.jsp")
           .forward(req, resp);
    }
 
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        String taskName = req.getParameter("task_name");
        String taskDesc = req.getParameter("task_description");
        LocalDate deadline = LocalDate.parse(req.getParameter("deadline"));      
        int userId = Integer.parseInt(req.getParameter("user_id"));
 
        User user = userDao.fetchUserById(userId);
 
        boolean ok = tasksDao.insertTask(taskName, taskDesc, deadline, user);
 
        if (ok) {
            resp.sendRedirect(req.getContextPath() + "/app/admin/dashboard?added=true");
        } else {
            req.setAttribute("error", "Failed to add task. Try again.");
            req.setAttribute("users", userDao.fetchAllUser());
            req.getRequestDispatcher("/WEB-INF/views/admin/addTask.jsp")
               .forward(req, resp);
        }
    }
}