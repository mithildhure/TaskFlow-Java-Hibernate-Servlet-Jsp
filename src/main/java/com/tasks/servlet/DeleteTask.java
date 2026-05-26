package com.tasks.servlet;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.tasks.dao.TasksDao;
 
@WebServlet("/app/admin/tasks/delete")
public class DeleteTask extends HttpServlet {
 
    private final TasksDao tasksDao = new TasksDao();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        int taskId = Integer.parseInt(req.getParameter("id"));
        tasksDao.deleteTask(taskId);
        resp.sendRedirect(req.getContextPath() + "/app/admin/dashboard?deleted=true");
    }
 
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}