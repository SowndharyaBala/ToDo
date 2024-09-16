<%@ page import="jsp.bean.Blogs,jsp.dao.BlogsDao" %>

<%
    String id = request.getParameter("id");
    Blogs b = BlogsDao.getRecordById(Integer.parseInt(id));
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit To-do Item</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    
</head>
<body>
    <form action="editlistprocess.jsp" method="post">
        <input type="hidden" name="id" value="<%=b.getId()%>">
        <h1>Edit To-do Item</h1>

        <label for="title">Title:</label>
        <input type="text" name="title" value="<%=b.getTitle()%>" required><br><br>

        <label for="description">Description:</label>
        <textarea name="description" rows="4" cols="50" required><%=b.getDescription()%></textarea><br><br>

        <button type="submit">Update</button>
    </form>
</body>
</html>
