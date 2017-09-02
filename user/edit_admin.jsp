<%-- 
    Document   : edit_admin
    Created on : Feb 20, 2016, 2:39:35 PM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <link href="css/style3.css" rel="stylesheet">
        <!--Flat UI-->


        <link href="dist/css/flat-ui.css" rel="stylesheet">
        <title>Edit Profile</title>
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
							
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">

												<CENTER> <h5> EDIT ADMIN DETAILS </h5> </CENTER
                                        <div id="block">
                                            <!-- /#page-content-wrapper -->
                                            <%@ page import="java.io.*,java.util.*" %>
                                            <%@ page import="javax.servlet.*,java.text.*" %>

                                            <%

                                                try {
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM client WHERE user_id=" + uid;
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                                            %>

                                            <div id="block">
                                                <form id="editadmin" method="POST" action="edit_admin_back.jsp">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Company Name</label>
                                                                <input name="compname" type="text" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("company_name")%>">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Website <span style="color:red;">*</span></label>
                                                                <input name="website" type="url" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("website")%>" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Full Name <span style="color:red;">*</span></label>
                                                                <input name="name" type="text" class="form-control" id="exampleInputEmail1"  value="<%=resultSet.getString("name")%>" required>
                                                            </div></div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Contact Number(Along with ISD Code)<span style="color:red;">*</span></label>
																
                                                                <input name="phone" type="number" min="1000000000" max="999999999999999" oninvalid="setCustomValidity('Invalid Phone Number')" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("phone")%>" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Address</label>
                                                                <!--input name="address" type="text" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("address")%>" required-->
                                                                <textarea name="address" type="text" class="form-control" id="exampleInputEmail1" style="height: 150px;"><%=resultSet.getString("address")%></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">  <br>
                                                                <a href="../image_upload.jsp"><img src="<%=imgsrc%>" alt="..." class="img-rounded" height="150px"></a>
                                                                <label for="exampleInputEmail">Click on image to edit </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">E-Mail</label>
                                                                <input name="email" type="email" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("email")%>" readonly style="color: #34495e;">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Password</label>
                                                                <input name="password" type="password" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("password")%>" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                            <div class="row">
                                                        <div class="col-sm-6">
														<label for="exampleInputEmail1"><span style="color:red;">*</span></label>
                                            <input type="checkbox" required> I agree to the<a href="./tos.html" target="_blank"> Terms and Conditions</a></input>
                                            <br>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="col-sm-6">
                                            <a href="user_index.jsp">
                                                <button type="button"  class="btn btn-primary-delete">Cancel</button>
                                            </a>
                                        </div>
                                        <div class="col-sm-6">
                                            <button type="submit"  class="btn btn-primary">Submit</button>
											</div></div>
                                            </form>
                                        </div>
										<div class="row">
                                                        <div class="col-sm-6">
										<div class="form-group">
											<em><span style="color:red;">*</span>  Indicates Mandatory Field</em></span>
                                        </div>
										</div>
										</div>
                                        <%
                                                }
                                                connection.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                        <br/>
                                        <br/>
                                        <br/>
                                    </div>



                                </div>
                            </div>   
                        </div>
                    </div>
                </div>
            </div>

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
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>
<nav class="navbar navbar-default navbar-fixed-bottom">
  <div class="container">
   <p align="center"><strong>HIK Technologies   &nbsp |&nbsp All Copyrights Reserved</strong></p>
  </div>
</nav>
</body>
</html>
