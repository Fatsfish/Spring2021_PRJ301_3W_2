<%-- 
    Document   : search
    Created on : Jan 21, 2021, 1:41:33 PM
    Author     : User-PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.daos.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="sample.dtos.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <c:if test="${empty sessionScope.LOGIN_USER}">
            <a href="login.html">Please login first</a>
        </c:if>
        <c:if test="${not empty sessionScope.LOGIN_USER}">
            <h1>Welcome:${sessionScope.LOGIN_USER.fullname}</h1>
            <form action="MainController"> 
                <input type="submit" name="action" value="Logout"/>
            </form>
            <form action="MainController">
                Search <input type="text" name="search" value="${param.search}"/>
                <input type="submit" name="action" value="Search"/>
            </form>
            <c:if test="${not empty requestScope.LIST_USER}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>User ID</th>
                            <th>Full Name</th>
                            <th>Role ID</th>
                            <th>Password</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                        <form action="MainController">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${user.userID}</td>
                                <td>
                                    <input type="text" name="fullName" value="${user.fullname}">
                                </td>
                                <td>                        
                                    <input type="text" name="roleID" value="${user.role}">
                                </td>
                                <td>${user.password}</td>
                                <td>
                                    <a href="MainController?search=${param.search}&action=Delete&userID=${user.userID}">Delete</a>
                                </td>
                                <td>
                                    <input type="hidden" name="userID" value="${user.userID}">
                                    <input type="hidden" name="search" value="${param.search}">
                                    <input type="submit" name="action" value="Update">
                                </td>
                            </tr>
                        </c:forEach>
                    </form>
                </c:if>
            </tbody>
        </table>
    </c:if>
</body>
<h1> ${requestScope.DELETE_ERROR}</h1>
</html>
