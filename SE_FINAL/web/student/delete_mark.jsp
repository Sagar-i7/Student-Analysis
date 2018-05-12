<%-- 
    Document   : delete_mark
    Created on : 16 Apr, 2018, 1:52:08 PM
    Author     : Pratik
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Final Project</title>
    </head>
    <body >
        
        <%
           String sub = request.getParameter("sub");
           String enrollment = request.getParameter("enrollment");
           Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
        String q = "delete from markdata where sub=? and enrollment=?";
        PreparedStatement pst = con.prepareStatement(q);
        pst.setString(1, sub);
        pst.setString(2, enrollment);
        pst.executeUpdate();
        response.sendRedirect("home.jsp?user=old");
        %>
    </body>
</html>
