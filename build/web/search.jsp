<%-- 
    Document   : search
    Created on : Jan 21, 2021, 1:41:33 PM
    Author     : User-PC
--%>

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
        <%
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if (user == null) {
                response.sendRedirect("login.html");
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }

        %>
        <h1>Welcome:<%=((UserDTO) session.getAttribute("LOGIN_USER")).getFullname()%></h1>
        <form action="MainController"> 
            <input type="submit" name="action" value="Logout"/>
        </form>
        <form action="MainController">
            Search <input type="text" name="search" value="<%=search%>"/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <% List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (list != null) {
        %>
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
                <% int count = 1;
                    for (UserDTO dto : list) {
                %>
            <form action="MainController">
                <tr>
                    <td><%=count++%></td>
                    <td><%=dto.getUserID()%></td>
                    <td>
                        <input type="text" name="fullName" value="<%=dto.getFullname()%>">
                    </td>
                    <td>                        
                        <input type="text" name="roleID" value="<%=dto.getRole()%>">
                    </td>
                    <td><%=dto.getPassword()%></td>
                    <td>
                        <a href="MainController?search=<%=search%>&action=Delete&userID=<%=dto.getUserID()%>">Delete</a>
                    </td>
                    <td>
                        <input type="hidden" name="userID" value="<%=dto.getUserID()%>">
                        <input type="hidden" name="search" value="<%= search%>">
                        <input type="submit" name="action" value="Update">
                    </td>
                </tr>
            </form>
            <%}%>
        </tbody>
    </table>
    <%}%>
</body>
</html>
