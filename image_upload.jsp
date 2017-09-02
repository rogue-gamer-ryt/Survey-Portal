<%-- 
    Document   : user_index
    Created on : Feb 20, 2016, 2:20:10 PM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Welcome</title>
        <!-- Bootstrap Core CSS -->
        <link href="user/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="user/css/style4.css" rel="stylesheet">
        <link href="user/css/simple-sidebar.css" rel="stylesheet">
        <link href="user/css/style3.css" rel="stylesheet">
        <!--Flat UI-->
        <link href="user/dist/css/flat-ui.css" rel="stylesheet">

    </head>
    <body background="images/bg2.jpg">
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
          String password="sjbalaji";;

            try {
                Class.forName(driverName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            int count = 0;

            connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sq11 ="SELECT path FROM client where user_id = "+uid;
                    resultSet = statement.executeQuery(sq11);
                    resultSet.next();
                    String imgsrc=resultSet.getString("path");
                    imgsrc=imgsrc.replace("..",".");

        %>
        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">

                <ul class="sidebar-nav">

                    <li class="sidebar-brand">
                        <a href="user/user_index.jsp">
                            Survey Application
                        </a>
                    </li>
                    <li style="text-indent: -20px;text-align: center;">
                        <img src="<%=imgsrc%>" class="img-circle" style="width: 30%; height: 30%">
                    </li><li>
				<script src="js/log1.js"></script>
                        <button type="button"  class="btn btn-primary-logout" style="width: 75%" onclick="log()"><i class="glyphicon glyphicon-off" style="font-size:18px;color:white"></i>Logout</button>
                    </li>
                    <br>
                    <li>
                        <a href="user/edit_admin.jsp">My Profile</a>
                    </li>
                    <li>
                        <a href="user/manage_category.jsp">Manage Category</a>
                    </li>
                    <li>
                        <a href="user/manage_user.jsp">Manage User</a>
                    </li>
					  <li>
                        <a href="user/user_details.jsp">User Details</a>
                    </li>
                    <li>
                        <a href="user/manage_results.jsp">Manage Results</a>
                    </li>
                </ul>

            </div>
            <!-- /#sidebar-wrapper -->
            <!-- Page Content -->
            <div id="wrap">
                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <p align="right">
                                    <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Menu</a> </p>
                                <div class="row">
                                </div>
                                <div class="col-md-6 col-md-offset-3">
                                    <div class="col-md-6 col-md-offset-3" align="center">
                                        <img src="<%=imgsrc%>" alt="..." height="200px" align="center" class="img-rounded"><br/><br/>
                                        
                                    </div><br/>
                                    <div class="col-md-6 col-md-offset-3" align="center">
                                        <form method="post" action="upload" enctype="multipart/form-data">
			                             Select file to upload: 
			                             <input type="file" name="file" class="btn btn-default" accept="image/JPEG,image/PNG"/> 
			                             <br/><br/> 
			                             <input type="submit" value="upload" class="btn btn-default"/>
		                              </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                 
                    
                    <!-- /#page-content-wrapper -->
                
                <!-- /#wrapper -->
            </div>
            <!-- jQuery -->
            <script src="user/js/jquery.js"></script>
            <!-- Bootstrap Core JavaScript -->
            <script src="user/js/bootstrap.min.js"></script>

            <!-- Menu Toggle Script -->
             <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
</div>
    </body>
</html>
