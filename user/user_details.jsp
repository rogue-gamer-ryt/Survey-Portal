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
        <meta name="description" content="" />
        <meta name="keywords" content="Monitoring System" />
        <meta name="author" content="Codrops" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <link href="css/style3.css" rel="stylesheet">
                <link rel="stylesheet" type="text/css" href="css3/component.css" />
        <!--Flat UI-->


        <link href="dist/css/flat-ui.css" rel="stylesheet">
        <title>User Details</title>
    </head>



    <body background="../images/bg2.jpg">
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>

        <%
            session = request.getSession(false);
            long uid = 0L;
            try {
                uid = (Long) session.getAttribute("userid");
            } catch (Exception e) {
            }
            if (uid == 0L) {
                String site = "../../surveyhik/index.jsp";
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
					<h5 style="font-family:Tahoma ;color:white"><%=resultSet.getString("name") %></h5> 
					
					
							

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
									</div>
									
									
                                <div class="row">
								
								
                                    <div class="col-md-6 col-md-offset-3">

										<center><h5> USER DETAILS </h5> </center>
										
                    <div class="sucemessage" style="width: 50%; margin: 0px auto;">            
                    <%
                    String err = "";
                try{
                err = session.getAttribute("manUserError").toString();
                }
                catch(Exception e){
                }
                out.println(""+err);

                session.setAttribute("manUserError","");
                    %></div>

                                        <div id="block">
                                            <!-- /#page-content-wrapper -->
                                            
												<%@ page import="java.io.*,java.util.*" %>
                                            <%@ page import="javax.servlet.*,java.text.*" %>

                                            <%

                                                try {
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM user_details WHERE client_id=" + uid;
                                                    resultSet = statement.executeQuery(sql);
                                                    if(resultSet.next()) {
                                            %>

                                            <div id="block">
                                                <form id="userdetails" method="POST" action="edit_details_back.jsp">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
														<%	if(resultSet.getString("Full_Name").equals("1")) {  %>
                                                                <input type ="checkbox"  name ="FN" id=1 style width="initial;" checked >
                                                                <label for="exampleInputEmail1">Full Name</label>
															
														 <%} 
														 else {   %>
															<input type ="checkbox"  name ="FN" id=1 style width="initial;">
                                                                <label for="exampleInputEmail1">Full Name</label>
															
														<% } %>
														
														
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
															<%	if(resultSet.getString("Email_ID").equals("1")) { %>
                                                                <input type ="checkbox" name ="EID" id=2 style width="initial;" checked >
                                                                <label for="exampleInputEmail1">Email ID</label>
																
																
															<%}
															else {   %>
															<input type ="checkbox"  name ="EID" id=1 style width="initial;">
                                                                <label for="exampleInputEmail1">Email ID</label>
															
														<% } %>

                                                            </div>
                                                        </div>
                                                    </div>
													
													
													
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
															<%	if(resultSet.getString("Phone").equals("1")) {  %>
                                                                <input type ="checkbox" name ="Phone" id=3 style width="initial;" checked >
                                                                <label for="exampleInputEmail1">Phone </label>
																
																
																<%}
															else {   %>
															<input type ="checkbox"  name ="Phone" id=3 style width="initial;">
                                                                <label for="exampleInputEmail1">Phone</label>
															
														<% } %>
                                                            </div>
															</div>
															
															
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
															<%	if(resultSet.getString("DOB").equals("1")) {  %>
                                                                <input type ="checkbox"  name ="DOB" id=4 style width="initial;" checked>
                                                                <label for="exampleInputEmail1">DOB</label>
																
																<%}
															else {   %>
															<input type ="checkbox"  name ="DOB" id=4 style width="initial;">
                                                                <label for="exampleInputEmail1">DOB</label>
															
														<% } %>

                                                            </div>
                                                        </div>
                                                    </div>
													
													

                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
															<%	if(resultSet.getString("CF1").isEmpty()) {  %>
                                                                <input type ="checkbox" name ="CF1" id=5 style width="initial;"  >
                                                                <label for="exampleInputEmail1"> Custom Field 1</label>
                                                                <input name="cus1" type="text" class="form-control" value="">
																
																<%}
															else {   %>
															<input type ="checkbox"  name ="CF1" id=5 style width="initial; " checked>
                                                                <label for="exampleInputEmail1">Custom Field 1</label>
																<input name="cus1" type="text" class="form-control" value="<%=resultSet.getString("CF1")%>">
														<% } %>
																
																
																
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
															<%	if(resultSet.getString("CF2").isEmpty()) {  %>
                                                                <input type ="checkbox" name ="CF2" id=6 style width="initial;">
                                                                <label for="exampleInputEmail1">Custom Field 2</label>
                                                                <input name="cus2" type="text" class="form-control" id="exampleInputEmail1" value="">
																
																<%}
																
															else {   %>
															<input type ="checkbox"  name ="CF2" id=6 style width="initial; " checked>
                                                                <label for="exampleInputEmail1">Custom Field 2</label>
																<input name="cus2" type="text" class="form-control" value="<%=resultSet.getString("CF2")%>" >
														<% } %>
																
																
																
                                                            </div>
                                                        </div>
                                                    </div>
													
													
													

                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
															<%	if(resultSet.getString("CF3").trim().isEmpty()) {  %>
                                                                <input type ="checkbox" name ="CF3" id=7 style width="initial;">
                                                                <label for="exampleInputEmail1">Custom Field 3</label>
                                                                <input name="cus3" type="text" class="form-control" id="exampleInputEmail1" value="">
																
																<%}
																
															else {   %>
															<input type ="checkbox"  name ="CF3" id=7 style width="initial; " checked>
                                                                <label for="exampleInputEmail1">Custom Field 3</label>
																<input name="cus3" type="text" class="form-control" value="<%=resultSet.getString("CF3")%>" >
														<% } %>
																
																
																
																
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
															<%	if(resultSet.getString("CF4").trim().isEmpty()) {  %>
                                                                <input type ="checkbox" name ="CF4" id=8  style width="initial;">
                                                                <label for="exampleInputEmail1">Custom Field 4</label>
                                                                <input name="cus4" type="text" class="form-control" id="exampleInputEmail1" value="">
																
																<%}
																
															else {   %>
															<input type ="checkbox"  name ="CF4" id=8 style width="initial; " checked>
                                                                <label for="exampleInputEmail1">Custom Field 4</label>
																<input name="cus4" type="text" class="form-control" value="<%=resultSet.getString("CF4")%>" >
														<% } %>
																
																
																
																
                                                            </div>
                                                        </div>
                                                    </div>
													
													

                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <a href="user_index.jsp">
                                                                <button type="button"  class="btn btn-primary-delete">Cancel</button>
                                                            </a>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <button type="submit"  class="btn btn-primary" >Submit</button>
                                                        </div>
                                                    </div>
                                                </form>															
																																
																							
                                            </div>
                                            
											  <%
													}											
												
												else
												{ 
											
												
													%>  

													<div id="block">
                                                <form id="userdetails" method="POST" action="user_details_back.jsp">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <input type ="checkbox"  name ="FN" id=1 style width="initial;" >
                                                                <label for="exampleInputEmail1">Full Name</label>

                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <input type ="checkbox" name ="EID" id=2 style width="initial;">
                                                                <label for="exampleInputEmail1">Email ID</label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <input type ="checkbox" name ="Phone" id=3 style width="initial;">
                                                                <label for="exampleInputEmail1">Phone </label>

                                                            </div></div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <input type ="checkbox"  name ="DOB" id=4 style width="initial;">
                                                                <label for="exampleInputEmail1">DOB</label>

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <input type ="checkbox" name ="CF1" id=5 style width="initial;">
                                                                <label for="exampleInputEmail1"> Custom Field 1</label>
                                                                <input name="cus1" type="text" class="form-control" value=" ">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <input type ="checkbox" name ="CF2" id=6 style width="initial;">
                                                                <label for="exampleInputEmail1">Custom Field 2</label>
                                                                <input name="cus2" type="text" class="form-control" id="exampleInputEmail1" value="">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <input type ="checkbox" name ="CF3" id=7 style width="initial;">
                                                                <label for="exampleInputEmail1">Custom Field 3</label>
                                                                <input name="cus3" type="text" class="form-control" id="exampleInputEmail1" value="">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <input type ="checkbox" name ="CF4" id=8  style width="initial;">
                                                                <label for="exampleInputEmail1">Custom Field 4</label>
                                                                <input name="cus4" type="text" class="form-control" id="exampleInputEmail1" value="">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <a href="user_index.jsp">
                                                                <button type="button"  class="btn btn-primary-delete">Cancel</button>
                                                            </a>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <button type="submit"  class="btn btn-primary" >Submit</button>
                                                        </div>
                                                    </div>
                                                </form>															
																																
																							
                                            </div>
													
													
												<% }
                                                connection.close();
                                            }
											catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
											
                                            <br>

                                            <br>


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
