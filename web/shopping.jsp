<%-- 
    Document   : shopping
    Created on : Apr 19, 2021, 11:13:41 AM
    Author     : User-PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITea</title>
    </head>
    <body>
        <h1>Select your favorite tea</h1>
        <form action="MainController">
            <select name="cmbTea">
                <option value="T01-Peach Tea-15">Peach Tea</option>
                <option value="T02-Pink Tea-50">Pink Tea</option>
                <option value="T03-Black Pink Tea-30">Black Pink Tea</option>
                <option value="T04-Classic Tea-10">Classic Tea</option>
            </select>
            <input type="submit" name="action" value="Add">
        </form>
    <c:if test="${empty sessionScope.LOGIN_USER}">
        Have an account?<a href="login.html">Login here!</a>
    </c:if>
    <c:if test="${not empty sessionScope.LOGIN_USER}">
        <form action="MainController"> 
            <input type="submit" name="action" value="Logout"/>
        </form>
    </c:if>
    <h1>${requestScope.MESSAGE}</h1>
    <a href="viewCart.jsp">View Cart</a>
</body>
</html>
