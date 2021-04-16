<%-- 
    Document   : createUser
    Created on : Apr 16, 2021, 10:49:20 AM
    Author     : User-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New User</title>
    </head>
    <body>
        <form action="MainController" method="POST"></br>
            User ID<input type="text" name="userID" required=""></br>
            Full Name<input type="text" name="fullName" required=""></br>
            Role ID<input type="text" name="roleID" required=""></br>
            Password<input type="password" name="password" required=""></br>
            Confirm<input type="password" name="confirm" required=""></br>
            <input type="submit" name="action" value="Create"></br>
            <input type="reset" value="Reset"></br>
        </form>
    </body>
</html>
