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
import com.tasks.dto.Task;
import com.tasks.dto.User;

@WebServlet("/app/admin/tasks/update")
public class UpdateTask extends HttpServlet {

    private final TasksDao tasksDao = new TasksDao();
    private final UserDao userDao = new UserDao(); 

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int taskId = Integer.parseInt(req.getParameter("id"));
        Task task = tasksDao.fetchTaskById(taskId);

        if (task == null) {
            resp.sendRedirect(req.getContextPath() + "/app/admin/dashboard");
            return;
        }

        req.setAttribute("task", task);
        req.setAttribute("users", userDao.fetchAllUser()); 
        req.getRequestDispatcher("/WEB-INF/views/admin/updateTask.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int taskId = Integer.parseInt(req.getParameter("task_id"));
        String taskName = req.getParameter("task_name");
        String taskDesc = req.getParameter("task_description");
        LocalDate deadline = LocalDate.parse(req.getParameter("deadline"));
        
        int userId = Integer.parseInt(req.getParameter("user_id"));
        User assignedUser = userDao.fetchUserById(userId);

        boolean ok = tasksDao.updateTask(taskId, taskName, taskDesc, deadline, assignedUser);

        if (ok) {
            resp.sendRedirect(req.getContextPath() + "/app/admin/dashboard?updated=true");
        } else {
            req.setAttribute("error", "Update failed.");
            req.setAttribute("task", tasksDao.fetchTaskById(taskId));
            req.setAttribute("users", userDao.fetchAllUser()); 
            req.getRequestDispatcher("/WEB-INF/views/admin/updateTask.jsp").forward(req, resp);
        }
    }
}