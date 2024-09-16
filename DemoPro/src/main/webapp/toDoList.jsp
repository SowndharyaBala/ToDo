<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import = "jsp.dao.BlogsDao" %>
    <jsp:useBean id="b" class="jsp.bean.Blogs"></jsp:useBean>  
<jsp:setProperty property="*" name="b"/> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>To do List</title>
<link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>
	<h1>To Do List</h1>
<%
int i=BlogsDao.save(b);  
if(i>0){
	response.sendRedirect("addlist-success.jsp");
}else{  
	response.sendRedirect("adduser-error.jsp");  
	}  
%>
  

</body>
</html>