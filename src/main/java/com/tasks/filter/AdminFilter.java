package com.tasks.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import com.tasks.dto.Role;
import com.tasks.dto.User;
 
@WebFilter("/app/admin/*")
public class AdminFilter implements Filter {
 
    @Override
    public void init(FilterConfig fc) throws ServletException {}
 
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {
 
        HttpServletRequest  req  = (HttpServletRequest)  request;
        HttpServletResponse resp = (HttpServletResponse) response;
 
        HttpSession session = req.getSession(false);
        User user = (session != null)
                    ? (User) session.getAttribute("loggedUser")
                    : null;
 
        if (user != null && user.getRole() == Role.ADMIN) {
            chain.doFilter(request, response);               
        } else {
            resp.sendRedirect(req.getContextPath() + "/app/user/dashboard");
        }
    }
 
    @Override
    public void destroy() {}
}
