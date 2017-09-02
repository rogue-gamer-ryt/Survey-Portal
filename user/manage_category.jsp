<%-- 
    Document   : edit_admin
    Created on : Feb 20, 2016, 2:39:35 PM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Manage Category</title>
        <meta name="description" content="" />
        <meta name="keywords" content="Monitoring System" />
        <meta name="author" content="Codrops" />
       <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <link href="css/style3.css" rel="stylesheet">
        <!--Flat UI-->


        <link href="dist/css/flat-ui.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css3/component2.css" />
        <link rel="stylesheet" type="text/css" href="css3/component.css" />
        <!--[if IE]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script>
function confirmDelete(catid, catname) {
    var test = confirm("Are you sure you want to delete "+catname+" category?");
    if(test==true)
        window.location = '/surveyhik/user/delete_cat_back.jsp?catid='+catid;

}
</script>
    </head>

    <body background="../images/bg2.jpg">
                <%@page import="java.sql.DriverManager"%>
                <%@page import="java.sql.ResultSet"%>
                <%@page import="java.sql.Statement"%>
                <%@page import="java.sql.Connection"%>

                <%
                session=request.getSession(false);
                long uid = 0L;
                try{
                uid = (Long) session.getAttribute("userid");
                }
                catch(Exception e){
                }
                 if(uid == 0L){
                String site = "../../surveyhik/index.jsp" ;
                
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site); 
                }
                String driverName = "com.mysql.jdbc.Driver";
                String connectionUrl = "jdbc:mysql://localhost:3306/";
                String dbName = "test2";
                String userId = "root";
                String password = "sjbalaji";

                try {
                Class.forName(driverName);
                } 
                catch (ClassNotFoundException e) {
                e.printStackTrace();
                }

                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;
                ResultSet resultSet2 = null;
                int count=0;
                connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sq11 ="SELECT path FROM client where user_id = "+uid;
                    resultSet = statement.executeQuery(sq11);
                    resultSet.next();
                    String imgsrc=resultSet.getString("path");
                %>
        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">

                <ul class="sidebar-nav">

                    <li class="sidebar-brand">
                        <a href="user_index.jsp">
                            Survey Application
                        </a>
                    </li>
                    <li style="text-indent: -20px;text-align: center;">
                    <%String site2 = "./user_index.jsp" ;
                try{ 
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="SELECT * FROM client where user_id = "+uid;
                    //String sql2="SELECT name FROM client where user_id = "+uid;
                    
                    //resultSet2 = statement.executeQuery(sql2);
                    resultSet = statement.executeQuery(sql);
                    resultSet.next();
                    
                    
                    
                    %>

                        <img src="<%=imgsrc%>" class="img-circle" style="width: 30%; height: 30%">
                        <h5 style="font-family:Tahoma ;color:white;"><%=resultSet.getString("name") %></h5>  


                    </li><li>
                    <script src="js/log.js"></script>
                        <button type="button"  class="btn btn-primary-logout" style="width: 75%" onclick="log()">Logout</button>
                    </li>
                    <br>
                    <li>
                        <a href="edit_admin.jsp">My Profile</a>
                    </li>
                    <li>
                        <a href="manage_category.jsp">Manage Category</a>
                    </li>
                    <li>
                        <a href="manage_user.jsp">Manage User</a>
                    </li>
                      <li>
                        <a href="user_details.jsp">User Details</a>
                    </li>
                    <li>
                        <a href="manage_results.jsp">Manage Results</a>
                    </li>
                </ul>
                                <%
                                connection.close();
                                }
                                catch (Exception e) 
                                {
                                e.printStackTrace();
                                }
                                %>
            </div>
            
            
               


            <!-- Page Content -->
            <div id="wrap">

                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">


                                <p align="right">

                                    <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Menu</a> </p>
 <CENTER><h5> MANAGE CATEGORY</h5></CENTER>
<br><br>
 <div class="col-md-8 col-md-offset-4">
                                <div align="center">
                                    <p align="right">
                                        <a href="create_category.jsp"><button type="button" class="btn btn-primary">Add Category </button></a></div>
                            </div></div>
                <form>
                    <%
                try{ 
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="SELECT * FROM category where user_id = "+uid;
                    resultSet = statement.executeQuery(sql);
                    %>
                                              

                        <table>
                            <thead>
                                <tr>
                                    <th>S.No</th>
                                    <th>Category Name</th>
                                    <th>Edit</th>
                                    <th>Delete</th>


                                </tr>
                            </thead>
                            <tbody>
                                <% while(resultSet.next()){ %>
                                <tr>
                                    
                                    
                                    <td><%= ++count%></td>
                                  <td><a href="./manage_survey.jsp?catid=<%=resultSet.getLong("cat_id") %>"> 
                                      <%= resultSet.getString("cat_name") %>
                                      </a>
                                  </td> 
                                  
                                    <td width="20%"><a href="./edit_category.jsp?catid=<%=resultSet.getLong("cat_id") %>">  <button class="btn1 btn-primary dropdown-toggle" type="button" >Edit  &nbsp;<span class="fui-new"></span></td></a>
                                    
                                    <td><button onclick="confirmDelete('<%=resultSet.getLong("cat_id") %>','<%= resultSet.getString("cat_name") %>')" class="btn1 btn-primary-delete dropdown-toggle" type="button" >Delete <span class="fui-cross"></span></td>

                                </tr>
                                <%} 
                                if(count==0){%>
                                <td colspan="4">NO CATEGORIES YET!</td>
                                <%}%>
                               </tbody>
                            
                        </table>
                                
                                <%
                                connection.close();
                                }
                                catch (Exception e) 
                                {
                                e.printStackTrace();
                                }
                                %>
                                
                </form>
                                
                    </div><!-- /container -->
                    <script src="js/jquery.min.js"></script>
                    <script src="js/jquery.ba-throttle-debounce.min.js"></script>
                    <script src="js/jquery.stickyheader.js"></script>



                    <!--copyrights-->
  <nav class="navbar navbar-default navbar-fixed-bottom" >
  <div class="container">
   <p align="center"><strong>HIK Technologies   &nbsp |&nbsp All Copyrights Reserved</strong></p>
  </div>
</nav>

                    <!-- Menu Toggle Script -->
                    <script>
                        $("#menu-toggle").click(function (e) {
                            e.preventDefault();
                            $("#wrapper").toggleClass("toggled");
                        });
                    </script>
                    </body>
                    </html>