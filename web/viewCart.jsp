<%-- 
    Document   : viewCart
    Created on : Apr 19, 2021, 12:49:42 PM
    Author     : User-PC
--%>

<%@page import="sample.dtos.TeaDTO"%>
<%@page import="sample.dtos.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
    </head>
    <body>
        <h1>You have selected:</h1>
        <%
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if (cart != null) {
        %>
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
                <%
                    int count = 1;
                    double total = 0;
                    for (TeaDTO tea : cart.getCart().values()) {
                        total += tea.getQuantity() * tea.getPrice();
                %>
            <form action="MainController">

                <tr>
                    <td><%=count++%></td>
                    <td><%=tea.getID()%>
                        <input type="hidden" name="id" value="<%=tea.getID()%>">
                    </td>
                    <td><%=tea.getName()%></td>
                    <td><%=tea.getQuantity()%>
                        <input type="number" name="quantity" value="<%=tea.getQuantity()%>">
                    </td>
                    <td><%=tea.getPrice()%></td>
                    <td><%=tea.getQuantity() * tea.getPrice()%></td>   
                    <td>
                        <input type="submit" name="action" value="Remove">
                    </td>
                    <td>
                        <input type="submit" name="action" value="Edit">
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <h1> Total: <%= total%> </h1>
    <a href="shopping.jsp">Shop more</a>
    <%
        }
    %>
</body>
</html>
