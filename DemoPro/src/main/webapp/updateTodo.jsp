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

<%@ page import="jsp.dao.BlogsDao, jsp.bean.Blogs" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String title = request.getParameter("title");
    String description = request.getParameter("description");

    Blogs updatedTodo = new Blogs();
    updatedTodo.setId(id);
    updatedTodo.setTitle(title);
    updatedTodo.setDescription(description);

    int status = BlogsDao.update(updatedTodo);

    if (status > 0) {
        response.sendRedirect("viewTodos.jsp");
    } else {
        out.println("<h2>Error updating To-Do item. Please try again.</h2>");
        out.println("<a href='editTodo.jsp?id=" + id + "'>Go back to Edit</a>");
    }
%>


</body>
</html>