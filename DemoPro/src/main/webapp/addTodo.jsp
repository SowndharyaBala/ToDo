<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add New To-Do Item</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Add New To-Do</h1>
    <form action="saveTodo.jsp" method="post">
        <table>
            <tr>
                <td><label for="title">Title:</label></td>
                <td><input type="text" name="title" id="title" required></td>
            </tr>
            <tr>
                <td><label for="description">Description:</label></td>
                <td><textarea name="description" id="description" rows="4" cols="30" required></textarea></td>
            </tr>
        </table>
        <input type="submit" value="Add To-Do">
    </form>
</body>
</html>
