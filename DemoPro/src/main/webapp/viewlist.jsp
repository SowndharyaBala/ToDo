
<%@ page import="java.util.List,jsp.bean.Blogs,jsp.dao.BlogsDao" %>

<%
    List<Blogs> list = BlogsDao.getAllRecords();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>To-do List</title>
    
    <link rel="stylesheet" type="text/css" href="styles.css">
    
</head>
<body>
    <h1>To-do List</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Action</th>
        </tr>

        <%
            for (Blogs b : list) {
        %>
        <tr>
            <td><%= b.getId() %></td>
            <td><%= b.getTitle() %></td>
            <td><%= b.getDescription() %></td>
            <td>
                <a href="editlist.jsp?id=<%= b.getId() %>">Edit</a> |
                <a href="deletelist.jsp?id=<%= b.getId() %>">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <a href="addlist.jsp">Add New Item</a>
</body>
</html>