<%@ page import="jsp.dao.BlogsDao, jsp.bean.Blogs" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View To-Do List</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    
</head>
<body>
    <h1>To-Do List</h1>

    <%
        List<Blogs> list = BlogsDao.getAllRecords();
        request.setAttribute("list", list);
    %>

    <table border="1" width="90%">
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${list}" var="todo">
            <tr>
                <td>${todo.getTitle()}</td>
                <td>${todo.getDescription()}</td>
                <td><a href="editTodo.jsp?id=${todo.getId()}">Edit</a></td>
                <td><a href="deletelist.jsp?id=${todo.getId()}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <a href="addTodo.jsp">Add New To-Do Item</a>
</body>
</html>
