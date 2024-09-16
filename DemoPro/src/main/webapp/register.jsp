<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Registration</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    
</head>
<body>
    <h1>Register a New User</h1>
    <form action="registerUser.jsp" method="post">
        <table>
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username" required></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" required></td>
            </tr>
        </table>
        <input type="submit" value="Register">
    </form>
    
    <div>
    <p>Already user?</p>
    <a href="login.jsp">Login</a>
    </div>
    
</body>
</html>
