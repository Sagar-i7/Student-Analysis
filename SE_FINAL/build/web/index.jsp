<%-- 
    Document   : index
    Created on : 10 Apr, 2018, 7:38:15 PM
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
        <link href="css/signin.css" rel="stylesheet">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style=" margin-top: -40px; ">
            <nav class="navbar navbar-dark  bg-dark">
            <a class="navbar-brand" href="#"><img src="Images/icon.png" width="30" height="30" alt="SPHP" >Student Marks Analysis</a>
            <ul class="nav nav-tabs">
            <li class="nav-item">
            <a class="nav-link active" href="#">Sign In</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="signup.jsp">Sign Up</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about.html">About</a>
            </li>
            </ul>
            </nav>
       
     
      <form class="form-signin" action="index.jsp" method="post" align="center" >
        <h2 class="form-signin-heading" align="center">Please Sign In </h2>
        <div align="center" >
        <select class="btn btn-info dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="utype" required >
            <option value="#">---Select---</option>
            <option value="Student">Student</option>
            <option value="Professor">Professor</option>
        </select>
        </div>
        <br/>
        <label for="inputusername" class="sr-only">Username</label>
        <input type="text" id="inputusername" class="form-control" placeholder="UserName" name="username" required autofocus>
        <br/>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
          
        <button class="btn btn-lg btn-success btn-block " type="submit">Sign in</button>
        <br/>
        
</form>
        <% 
    try{
        String username = request.getParameter("username");
        String utype = request.getParameter("utype");
        String password= request.getParameter("password");
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
        String q = "select * from logintable where username=? and password=? and utype=?";
        PreparedStatement pst = con.prepareStatement(q);
        pst.setString(1,username);
        pst.setString(2,password);
        pst.setString(3,utype);
        ResultSet rs = pst.executeQuery();      
        if(rs.next()){
            
             Cookie cookie_username = new Cookie("username",username);
        Cookie cookie_password = new Cookie("password",password);
        cookie_username.setMaxAge(60*60);
        cookie_password.setMaxAge(60*60);
        response.addCookie(cookie_username);
        response.addCookie(cookie_password);
        Cookie cookie_utype = new Cookie("utype",utype);
        cookie_utype.setMaxAge(60*60);
        response.addCookie(cookie_utype);
            
                if("Student".equals(utype)){response.sendRedirect("student/home.jsp?user=old&username="+username);}
                if("Professor".equals(utype)){response.sendRedirect("professor/home.jsp?user=old&username="+username);}
               
            }
         else{out.println(" <h3 align='center'  style='color: red'>Please Select User Type....</h3>");}
    }catch(Exception e){out.print(e);}
  %>
                      
  </body>
  <%@include file="footer.jsp" %>   
    
</html>

