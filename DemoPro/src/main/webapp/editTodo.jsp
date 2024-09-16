<%@ page import="jsp.dao.BlogsDao, jsp.bean.Blogs" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Blogs todo = BlogsDao.getRecordById(id);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit To-Do</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    
</head>
<body>
    <h1>Edit To-Do Item</h1>
    <form action="updateTodo.jsp" method="post">
        <input type="hidden" name="id" value="<%= todo.getId() %>">
        <table>
            <tr>
                <td><label for="title">Title:</label></td>
                <td><input type="text" name="title" id="title" value="<%= todo.getTitle() %>" required></td>
            </tr>
            <tr>
                <td><label for="description">Description:</label></td>
                <td><textarea name="description" id="description" rows="4" cols="30" required><%= todo.getDescription() %></textarea></td>
            </tr>
        </table>
        <input type="submit" value="Update To-Do">
    </form>
</body>
</html>
