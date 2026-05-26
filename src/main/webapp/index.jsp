<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Immediately redirect the user to the login servlet
    response.sendRedirect(request.getContextPath() + "/login");
%>