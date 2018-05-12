<%-- 
    Document   : add_sub
    Created on : 13 Apr, 2018, 4:35:55 PM
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
            <a class="nav-link " href="home.jsp?user=old">Home</a>
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
                String ck_enrollment = request.getParameter("enrollment");
                
               String password= request.getParameter("password");
               Cookie cookie = null;
                Cookie[] cookies = null;
                String ck_password;
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         if( cookies != null ) {
                            for (int i = 0; i < cookies.length; i++) {
                                cookie = cookies[i];
                                if("password".equals(cookie.getName( ))){
                                        ck_password = cookie.getValue( );
                                        if(password.equals(ck_password)){
                                                %>
                                                
                                                
        <form class="form-signin" action="../add_sub?enrollment=<%= ck_enrollment %>" method="post" align="center" >
        <h2 class="form-signin-heading" align="center" style="font-family: Arial;">Enter Your Grade...</h2>
        <div align="center" >
        <select id="ddl" onchange="configureDropDownLists(this,document.getElementById('ddl2'))" class="btn btn-light btn-outline-dark dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="dd1" required>
            <option value=""></option>
            <option value="s1">Semester 1</option>
            <option value="s2">Semester 2</option>
            <option value="s3">Semester 3</option>
            <option value="s4">Semester 4</option>
            <option value="s5">Semester 5</option>
            <option value="s6">Semester 6</option>
            <option value="s7">Semester 7</option>
            <option value="s8">Semester 8</option>
        </select>

        <select id="ddl2" class="btn btn-light btn-outline-dark dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="ddl2" required>
        </select>
        </div>
        <br/>
        <label for="inputgrade" class="sr-only">Grade</label>
        <input type="text" id="inputgrade" class="form-control" placeholder="Grade" name="grade" required autofocus>
        <br/>   
        <button class="btn btn-lg btn-info btn-block " type="submit">Save !!</button>
        <br/>
</form>                    
                     <%
                         
                                        }
                                        else{out.println("Wrong Password...");}
                                }
                            }
                            
                            
         }
         else{out.print("Please Log in first...");}
            %>
    </body>
</html>
