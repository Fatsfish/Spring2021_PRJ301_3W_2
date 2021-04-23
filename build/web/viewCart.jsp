<%-- 
    Document   : viewCart
    Created on : Apr 19, 2021, 12:49:42 PM
    Author     : User-PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.dtos.TeaDTO"%>
<%@page import="sample.dtos.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
    </head>

    <h1>You have selected:</h1>
    <c:if test="${empty sessionScope.CART}">
        <a href="shopping.jsp">Add something!</a>
    </c:if>
    <c:if test="${not empty sessionScope.CART}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Delete</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="rows" items="${sessionScope.CART.cart}" varStatus="counter">
                    <c:set var="total" value="${rows.value.price*rows.value.quantity+total}"></c:set>
                    <form action="MainController">
                        <tr>
                            <td>${counter.count}</td>
                        <td>
                            <input type="text" name="id" value="${rows.value.getID()}">
                        </td>
                        <td>${rows.value.name}</td>
                        <td>
                            <input type="number" name="quantity" value="${rows.value.quantity}">
                        </td>
                        <td>${rows.value.price}</td>
                        <td>${rows.value.price*rows.value.quantity}</td>   
                        <td>
                            <input type="submit" name="action" value="Remove">
                        </td>
                        <td>
                            <input type="submit" name="action" value="Edit">
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </tbody>
    </table>
    <h1> Total: ${total} </h1>
    <a href="shopping.jsp">Shop more</a>
</c:if>
</html>
