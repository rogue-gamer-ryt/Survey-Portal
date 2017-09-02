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
        <title>Manage Category</title>
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
    <body background="../images/bg2.jpg">
        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">

                <ul class="sidebar-nav">

                    <li class="sidebar-brand">
                        <a href="user_index.jsp">
                            Survey Application
                        </a>
                    </li>
                    <li style="text-indent: -20px;">


                        <img src="images/logo1.png" class="img-circle" style="width: 30%; height: 30%">
                        <h5 style="font-family:Tahoma ;color:white">Admin Name</h5>  


                    </li><li>
					<script src="js/log.js"></script>
                        <button type="button"  class="btn btn-primary-logout" style="width: 75%" onclick="log()"><i class="glyphicon glyphicon-off" style="font-size:18px;color:white"></i>Logout</button>
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
                        <a href="manage_results.jsp">Manage Results</a>
                    </li>
                </ul>
                <!-- <div id="footer">
                <h6 align="center"><strong>HIK Technologies    &nbsp |&nbsp All Copyrights Reserved</strong> </h6>
                </div>
                </div>
                <!-- /#sidebar-wrapper -->
            </div>
            
               


                <div class="container">
                    <header>

                    </header>
                    <div class="component">
                        <div class="col-lg-12">
                            <p align="right">

                                <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Menu</a> </p>
                            <br><br>
                            <div class="col-md-10 col-md-offset-3">
                                <div align="center">
                                    <p align="right">
                                        <a href="edit_category.jsp"><button type="button" class="btn btn-primary">Add Category </button></a></div>
                            </div></div>
                        
                          
                <%@page import="java.sql.DriverManager"%>
                <%@page import="java.sql.ResultSet"%>
                <%@page import="java.sql.Statement"%>
                <%@page import="java.sql.Connection"%>

                <%
                 String id = request.getParameter("userId");
                String driverName = "com.mysql.jdbc.Driver";
                String connectionUrl = "jdbc:mysql://localhost:3306/";
                String dbName = "test2";
                String userId = "root";
                String password = "sjbalaji";


                    
                try {
                Class.forName(driverName);
                } 
                catch (ClassNotFoundException e)
                {
                e.printStackTrace();
                }

                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;
                int count=0;
                %>
     
                       
                <form>
                    <%
                try{ 
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="SELECT * FROM category";
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
                                  <td><a href="./test_survey.jsp?ark=<%=resultSet.getInt("cat_id") %>"> 
                                      <%= resultSet.getString("cat_name") %>
                                      </a>
                                  </td> 
                                  
                                  
                                    
                                  <!-- <td><a href="manage_survey.jsp?catname=Category 01">Category 01</a></td> -->
                                    <td width="20%">  <button class="btn1 btn-primary dropdown-toggle" type="button" >Edit  &nbsp;<span class="fui-new"></span></a></td>
                                    <td><button class="btn1 btn-primary-delete dropdown-toggle" type="button" >Delete <span class="fui-cross"></span></td>

                                </tr>
                                <%} %>
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
                    <div class="copyrights">
                        <p><strong>HIK Technologies   &nbsp |&nbsp All Copyrights Reserved</strong></p>
                    </div>

                    <!-- Menu Toggle Script -->
                    <script>
                        $("#menu-toggle").click(function (e) {
                            e.preventDefault();
                            $("#wrapper").toggleClass("toggled");
                        });
                    </script>
                    </body>
                    </html>
