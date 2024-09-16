<%@ page import="jsp.bean.Blogs,jsp.dao.BlogsDao" %>
<link rel="stylesheet" type="text/css" href="styles.css">

<jsp:useBean id="b" class="jsp.bean.Blogs"></jsp:useBean>
<jsp:setProperty property="*" name="b" />

<%
    int id = Integer.parseInt(request.getParameter("id"));
    b.setId(id);

    int status = BlogsDao.update(b);
    if (status > 0) {
        response.sendRedirect("viewlist.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
