<%@ page import="jsp.bean.User, jsp.dao.UserDao" %>
<link rel="stylesheet" type="text/css" href="styles.css">

<%
    // Get the username and password from the form
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        
        int status = UserDao.save(newUser); // Save the new user

        if (status > 0) {
            // If insertion is successful, show a success message
            out.println("<h2>User registered successfully!</h2>");
            out.println("<a href='login.jsp'>Go to Login</a>");
        } else {
            // If insertion fails, show an error message
            out.println("<h2>Error registering user. Please try again.</h2>");
            out.println("<a href='register.jsp'>Go back to Register</a>");
        }
    }
%>
