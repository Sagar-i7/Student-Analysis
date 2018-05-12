<%-- 
    Document   : edit_mark
    Created on : 16 Apr, 2018, 1:51:05 PM
    Author     : Pratik
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <title>Final Project</title>
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'  crossorigin='anonymous'>
        <script src='https://code.jquery.com/jquery-3.2.1.slim.min.js' crossorigin='anonymous'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js'  crossorigin='anonymous'></script>
        <script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'  crossorigin='anonymous'></script>           
        <link href="../css/signin.css" rel="stylesheet">
        <link href="../css/bootstrap.css" rel="stylesheet">
        <script src="../js/sub.js" type="text/javascript"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="margin-top: -40px;">
           
            <nav class="navbar navbar-dark  bg-dark">
            <a class="navbar-brand" href="#"><img src="../Images/icon.png" width="30" height="30" alt="SPHP" >Student Marks Analysis</a>
            <ul class="nav nav-tabs">
            <li class="nav-item">
            <a class="nav-link active" href="home.jsp?user=old">Home</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="signout.jsp">Sign Out</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about.html">About</a>
            </li>
            </ul>
            </nav>
        <%
            try{
            String sub = request.getParameter("sub");
            String enrollment = request.getParameter("enrollment");
            
             Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
        
        
            %>
            <form class="form-signin" action="edit_mark.jsp?sub=<%= sub %>&enrollment=<%= enrollment %>" method="post" align="center" >
        <h2 class="form-signin-heading" align="center">Update Your Grade...</h2><br/>
        
             <br/>
             <input type="text" id="inputsub" class="form-control" placeholder="Subject" name="subject" value="<%= sub %>" required >
        <br/>
        <input type="text" id="inputgrade" class="form-control" placeholder="New Grade" name="grade" required autofocus>
         <br/>
        <button class="btn btn-lg btn-success btn-block " type="submit">Update</button>
    </form>
             <%
                 String grade = request.getParameter("grade");
               String q = "UPDATE markdata SET grade=? where sub=? and enrollment=?";
        PreparedStatement pst = con.prepareStatement(q);
        pst.setString(1, grade);
        pst.setString(2, sub);
        pst.setString(3, enrollment);
        pst.executeUpdate();  
        response.sendRedirect("home.jsp?user=old");
                }catch(Exception e){}
             %>
    </body>
</html>
