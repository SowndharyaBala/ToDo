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
    String id = request.getParameter("id");
    int status = BlogsDao.delete(Integer.parseInt(id));
    if (status > 0) {
        response.sendRedirect("viewlist.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>