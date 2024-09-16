<%@ page import="jsp.bean.Blogs, jsp.dao.BlogsDao" %>
<link rel="stylesheet" type="text/css" href="styles.css">

<%
    String title = request.getParameter("title");
    String description = request.getParameter("description");

    if (title != null && description != null) {
        Blogs newTodo = new Blogs();
        newTodo.setTitle(title);
        newTodo.setDescription(description);

        int status = BlogsDao.save(newTodo);

        if (status > 0) {
            out.println("<h2>To-Do item added successfully!</h2>");
            out.println("<a href='viewTodos.jsp'>View To-Do List</a>");
        } else {
            out.println("<h2>Error adding To-Do item. Please try again.</h2>");
            out.println("<a href='addTodo.jsp'>Go back to Add To-Do</a>");
        }
    }
%>
