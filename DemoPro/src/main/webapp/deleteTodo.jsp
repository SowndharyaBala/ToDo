<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>


<%@ page import="jsp.dao.BlogsDao" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int status = BlogsDao.delete(id);

    if (status > 0) {
        response.sendRedirect("viewTodos.jsp");
    } else {
        out.println("<h2>Error deleting To-Do item. Please try again.</h2>");
        out.println("<a href='viewTodos.jsp'>Go back to To-Do List</a>");
    }
%>

</body>
</html>