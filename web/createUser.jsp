<%-- 
    Document   : createUser
    Created on : Apr 16, 2021, 10:49:20 AM
    Author     : User-PC
--%>
<%@page import="sample.dtos.UserErrorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New User</title>
    </head>
    <body>
        <%
            UserErrorDTO userError = (UserErrorDTO) request.getAttribute("ERROR_USER");
            if (userError == null) {
                userError = new UserErrorDTO("", "", "", "", "");
            }
        %>
        <form action="MainController" method="POST"></br>
            User ID<input type="text" name="userID" required=""></br>
            <%=userError.getUserIDError()%></br>
            Full Name<input type="text" name="fullName" required=""></br>
            <%=userError.getFullNameError() %></br>
            Role ID<input type="text" name="roleID" required=""></br>
            <%=userError.getRoleIDError()%></br>
            Password<input type="password" name="password" required=""></br>
            <%=userError.getPasswordError()%></br>
            Confirm<input type="password" name="confirm" required=""></br>
            <%=userError.getConfirmError()%></br>
            <input type="submit" name="action" value="Create"></br>
            <input type="reset" value="Reset"></br>
        </form>
    </body>
</html>
