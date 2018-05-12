<%-- 
    Document   : home
    Created on : 11 Apr, 2018, 11:33:51 PM
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
        <link href="../css/hr_tag.css" rel="stylesheet">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="margin-top: -40px;">
            <nav class="navbar navbar-dark  bg-dark">
                <a class="navbar-brand" href="#"><img src="../Images/icon.png" width="30" height="30" alt="SPHP" >Student Marks Analysis</a>
            <ul class="nav nav-tabs">
            <li class="nav-item">
            <a class="nav-link active" href="#">Home</a>
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
            Cookie cookie = null;
            Cookie[] cookies = null;
            // Get an array of Cookies associated with the this domain
            cookies = request.getCookies();
            String username = null;
            String user = request.getParameter("user");
            if( cookies != null ) 
            {
                String ck_password;
                for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if("password".equals(cookie.getName( )))
                {
                    ck_password = cookie.getValue( );}
                    if("username".equals(cookie.getName()))
                    {
                        username = cookie.getValue();
                    }
                }
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
                String q = "select * from studentdata where username=?";
                PreparedStatement pst = con.prepareStatement(q);
                pst.setString(1,username);
                ResultSet rs = pst.executeQuery();
                while(rs.next())
                {
                    String name=rs.getString("name");
                    String enrollment = rs.getString("enrollment");
                    if("old".equals(user))
                    {
        %>
        <div class="alert alert-info" role="alert" >
        <h3 style="font-family: Comic Sans MS">Welcome Back , <%= name%></h3>
        </div>
        
        <div class="list-group">
            
        <div class="row">
            <div class="col-4">
                <div class="list-group" id="list-tab" role="tablist">
                    <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Display Grade history</a>
                    <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Add Marks</a>
                    <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Your Details</a>
                </div>
            </div>
            <div class="col-8">
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
                        <%
                            Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
                            for (int i=1;i<9;i++){
                            try
                            {
                                String q2="select * from markdata where enrollment="+enrollment +" and sem="+i;
                                PreparedStatement pst2 = con2.prepareStatement(q2);
                                ResultSet rs2 = pst2.executeQuery();
                        %>
                                           
                        <table class="table">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">Semester_<%= i %></th>
                                    <th scope="col">Subject</th>
                                    <th scope="col">Grade</th>
                                    <th scope="col" colspan="2">Operation</th>
                                </tr>
                            </thead>
                        <tbody>
                        <%
                            int j=1;
                            while(rs2.next())
                            {
                        %>
                        <tr>
                            <th scope="row"><%= j %></th>
                            <td><%= rs2.getString("sub")%></td>
                            <td><%= rs2.getString("grade")%></td>
                            <td><a href="edit_mark.jsp?sub=<%= rs2.getString("sub") %>&enrollment=<%= enrollment %>">Edit</a></td>
                            <td><a href="delete_mark.jsp?sub=<%= rs2.getString("sub") %>&enrollment=<%= enrollment %>">Delete</a></td>
                        </tr>
                        <%
                                j++;
                            }
                        %>
                        <hr class="style18">
                        </tbody>
                        </table>
                        <%
                            out.print("<br>");
                            }catch(Exception e){out.print(e);}}
                        %>
                        </div>
                        <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
                        <%
                            out.println("<h3>Enrollment No. : "+enrollment+"</h3>");
                        %>
                        <form class="form-signin" action="add_sub.jsp?enrollment=<%= enrollment %>" method="post" align="center" >
                            <br/>
                            <h2 class="form-signin-heading" align="center">Please Enter Password </h2>
                            <br/>
                            <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
                            <br/>
                            <button class="btn btn-lg btn-info btn-block " type="submit">Go !!</button>
                        </form>
                        </div>
                            <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
                                <%
                                    Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
                                    String q3 = "select * from studentdata where username=?";
                                    PreparedStatement pst3 = con3.prepareStatement(q3);
                                    pst3.setString(1,username);
                                    ResultSet rs3 = pst3.executeQuery();
                                    while(rs3.next())
                                    {
                                %>
                                        <div class="alert alert-warning" role="alert" ><br>
                                            <h3 style="font-family: Comic Sans MS"><br>
                                                Enrollment No. : <%= rs3.getString("enrollment") %><br>
                                                Name : <%= rs3.getString("name") %><br>
                                                UserName : <%= rs3.getString("username") %><br>
                                                Semester : <%= rs3.getString("sem") %><br>
                                                Branch : <%= rs3.getString("branch") %><br>
                                                Year of Graduation : <%= rs3.getString("gyear") %><br>
                                            </h3>
                                        </div>
                                            *Contact <b>Administrator</b> to change your Details....
                                        <%
                                    }
                                %>
                            </div>
                </div>
            </div>
        </div>
        </div>
        <%
            
                }

                   }
                   if("new".equals(user)){
                out.print("<div class='alert alert-info' role='alert' >");
                out.print("<h3>You are a new user...<a href='new_data_entry.jsp?username="+username+"'>Click me </a> to enter Your Basic Data...</h3>");
                out.print("</div>");
                }

            }catch(Exception e){out.print(e);}  
         } else {
            out.println("<h2>No cookies founds</h2>");
         }
       %> 
    </body>
</html>
