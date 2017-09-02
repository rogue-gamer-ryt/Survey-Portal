<%-- 
    Document   : testtable
    Created on : Mar 1, 2016, 10:49:12 AM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Manage User</title>
		<meta name="description" content="" />
		<meta name="keywords" content="Monitoring System" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="../css/normalize.css" />
                <link href="css/simple-sidebar.css" rel="stylesheet">
                <link href="css/style3.css" rel="stylesheet">
                <link rel="stylesheet" type="text/css" href="../css/demo.css" />
   		<link rel="stylesheet" type="text/css" href="css3/component.css" />
		<link rel="stylesheet" type="text/css" href="css3/normalize2.css" />
		<link rel="stylesheet" type="text/css" href="css3/demo2.css" />
		<link rel="stylesheet" type="text/css" href="css3/component2.css" />


		<link href="../css/simple-sidebar.css" rel="stylesheet">
    	<link href="../css/style3.css" rel="stylesheet">
     	<!--Flat UI-->
    	<link href="dist/css/flat-ui.css" rel="stylesheet">

		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
    </head>
    <body background="../images/bg2.jpg" style="padding-bottom:0px">
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
                String site = "../../surveyhik" ;
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
				//ResultSet resultSet3 = null;
                int count=0;
                %>
                <%
                try{ 
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sqllll ="SELECT srusername,sr_email,survey_id FROM users where client_id = "+uid;
                    resultSet2 = statement.executeQuery(sqllll);
                    %>
                    <% if(!resultSet2.next()){  
                                out.println("loop testing");
                                 request.setAttribute("errorMessage", "Please Fill the User Details");
        RequestDispatcher rd = request.getRequestDispatcher("user_details.jsp");
            rd.forward(request, response);}else{ %>
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

                        <img src="images/logo1.png" class="img-circle" style="width: 30%; height: 30%">
                        <h5 style="font-family:Tahoma ;color:white;"><%=resultSet.getString("name") %></h5>  


                    </li><li>
					<script src="js/log.js"></script>
                        <button type="button"  class="btn btn-primary-logout" style="width: 75%" onclick="log()">Logout</button>
                    </li>
                    <br>
                    <li style="text-align:-webkit-auto;">
                        <a href="edit_admin.jsp">My Profile</a>
                    </li>
                    <li>
                        <a href="manage_category.jsp">Manage Category</a>
                    </li>
                    <li style="text-align:-webkit-auto;">
                        <a href="manage_user.jsp">Manage User</a>
                    </li>
					  <li style="text-align:-webkit-auto;">
                        <a href="user_details.jsp">User Details</a>
                    </li>
                    <li style="text-align:-webkit-auto;">
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
        <!-- /#sidebar-wrapper -->




		<div class="container">
			<div class="component">
			<div class="col-lg-12">

                    <p align="right">

                         <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Menu</a> </p>
                         
						 
						  <h5> MANAGE USER</h5>
						  
                         <div class="col-md-5">
                             
                         <p align="left">
                          
                         
                         </div>
                         <div class="row">
                         <div class="col-md-5 ">
                             <p align="right">
                              
                                <a href="create_user.jsp"><button type="button" class="btn btn-primary">Add User</button></a>
                         
                            </p>
                         </div>
                         <div class="col-md-10">
                            
                             <p align="center">
                         
                        </div>
                         </div>
        
				
				<!--input type="submit" value="Operators" onclick="location.href='addEmployee.html'">
				<input type="submit" value="Operations" onclick="location.href='addOperations.html'">
				<input type="submit" value="Terminals" onclick="location.href='addTerminal.html'">
				<input type="submit" value="Lines" onclick="location.href='addLine.html'"-->

					
                <form>
				  <%
                try{ 
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="SELECT srusername,sr_email,survey_id FROM users where client_id = "+uid;
                    resultSet = statement.executeQuery(sql);
                    %>
                        <table>
                            <thead>
                                <tr>
                                    <th>S.No</th>
                                    <th>User Name</th>
                                    <th>Survey Id's</th>
                                    <th>Delete </th>
                                </tr>
                            </thead>
                            <tbody>
											
								
                                
								<% while(resultSet.next()){ %>
                                <tr>
                                    
                                    
                                    <td><%=++count%></td>
                                  <td>
                                      <%--= resultSet.getString("srusername") --%>
                                      <a href="edit_user.jsp?username=<%= resultSet.getString("srusername") %>"><%= resultSet.getString("srusername") %></a>
                                  </td>  
                                  <td>
                                      <%= resultSet.getString("survey_id") %>
                                  </td> 
                                  <td><button onclick="confirmDelete('<%=resultSet.getString("srusername") %>')" class="btn1 btn-primary-delete dropdown-toggle" type="button" >Delete <span class="fui-cross"></span></td>
                                </tr><%}%>
								
                               </tbody>
								
                        </table>
                                
                                <%
				
                                connection.close();
                                }
                                catch (Exception e) 
                                {
                                e.printStackTrace();
								out.println("error"+e);
                                }
                                %>
                                
                </form>		</div></div>		
		</div><!-- /container -->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.ba-throttle-debounce.min.js"></script>
		<script src="js/jquery.stickyheader.js"></script>


<br><br><br></div></div></div><br><br><br>
		<!--copyrights-->
<nav class="navbar navbar-default navbar-fixed-bottom" style="background:transparent;">
  <div class="container">
   <p align="center"><strong>  HIK Technologies   &nbsp |&nbsp All Copyrights Reserved</strong></p>
  </div>
</nav>      
<!-- Menu Toggle Script -->
    <script>

 function confirmDelete(uname) {
            var test = confirm("Are you sure you want to delete this user ?");
            if(test==true)
                window.location = '/surveyhik/user/delete_user_back.jsp?username='+uname;
                }
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
    
    
                                    <%
                    }
                                connection.close();
                                }
                                catch (Exception e) 
                                {
                                e.printStackTrace();
								out.println("error"+e);
                                }
                                %>
    </body>
</html>
