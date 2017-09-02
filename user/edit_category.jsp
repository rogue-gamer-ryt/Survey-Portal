<%-- 
    Document   : edit_category
    Created on : Feb 20, 2016, 3:02:32 PM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Category</title>
       <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/simple-sidebar.css" rel="stylesheet">
    <link href="css/style3.css" rel="stylesheet">
    <!--Flat UI-->
    <link href="dist/css/flat-ui.css" rel="stylesheet">
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
                    <%
                try{ 
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="SELECT * FROM client where user_id = "+uid;
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

<%
String cid = request.getParameter("catid");
session.setAttribute("catid",cid);
%>
<%

                
                try{ 
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="SELECT * FROM category where cat_id = "+cid;
                    resultSet = statement.executeQuery(sql);
                    resultSet.next();
                    %>
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">

                        <p align="right"> 

                         <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Menu</a>
                         
                         </p>
 
<br/><br/><br/>
<form id="newone" method="POST" action="edit_cat_back.jsp">
 <div class="row">
  <div class="col-md-6 col-md-offset-3"><h5><strong>Category Name:</strong><span style="color:red;">*</span> </h5><input name="catname"  type="text" required="true" class="form-control" placeholder="Text input" value="<%= resultSet.getString("cat_name") %>">
</div>
                            
<div class="row">
  <div class="col-md-6 col-md-offset-3"><h5> <br/><br/><strong>Description </strong><span style="color:red;">*</span></h5><textarea name="catdesc" required="true" class="form-control" rows="3"><%= resultSet.getString("cat_desc") %></textarea>
</div>
      

    <div class="form-group">
	<em><span style="color:red;">*</span>  Indicates Mandatory Field</em></span>
                                        </div>
                       <div class="row">
  
  </div>
  <div class="col-xs-6 col-md-7"><br/><br/>

<p align="center">

<button type="submit"  class="btn btn-primary">Save</button>
                         
                         </p>

  </div>
  <div class="col-xs-5 col-md-1"><br/><br/>

<p align="center">

                         <a href="manage_category.jsp"><button type="button"   class="btn btn-primary-delete">Cancel</button></a>
                         
                         </p>
                         
                        
                    </div>
                </div>
            </div>
          </form>
        </div>
        <!-- /#page-content-wrapper -->
<%
                                connection.close();
                                }
                                catch (Exception e) 
                                {
                                e.printStackTrace();
                                }
                                %>
    </div>
    <!-- /#wrapper -->
     
</div>
</div>
</div>  

    



     </div>


     </div>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
<nav class="navbar navbar-default navbar-fixed-bottom" >
  <div class="container">
   <p align="center"><strong>HIK Technologies   &nbsp |&nbsp All Copyrights Reserved</strong></p>
  </div>
</nav>

    </body>
</html>
