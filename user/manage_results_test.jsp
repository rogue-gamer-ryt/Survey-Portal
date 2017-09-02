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
        <title>Manage Results</title>
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
        <script>
function confirmDelete(catid, catname) {
    var test = confirm("Are you sure you want to delete "+catname+" category?");
    if(test==true)
        window.location = '/surveyhik/user/delete_cat_back.jsp?catid='+catid;

}
</script>
    </head>
    <body>
                <%@page import="java.sql.DriverManager"%>
                <%@page import="java.sql.ResultSet"%>
                <%@page import="java.sql.Statement"%>
                <%@page import="java.sql.Connection"%>

                <%
                long uid = (Long) session.getAttribute("userid");
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
                    <li style="text-indent: -20px;">
                    <%
                try{ 
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="SELECT * FROM client where user_id = "+uid;
                    resultSet = statement.executeQuery(sql);
                    resultSet.next();
                    %>

                        <img src="images/logo1.png" class="img-circle" style="width: 30%; height: 30%">
                        <h5 style="font-family:Tahoma ;color:white"><%=resultSet.getString("username") %></h5>  


                    </li><li>
                        <a href="../index.jsp"><button type="button"  class="btn btn-primary-logout" style="width: 75%"><i class="glyphicon glyphicon-off" style="font-size:18px;color:white"></i>Logout</button></a>
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
                                <%
                                connection.close();
                                }
                                catch (Exception e) 
                                {
                                e.printStackTrace();
                                }
                                %>
            </div>
            
               


                <div class="container">
                    <div class="component">
                        <div class="col-lg-12">
                            <p align="right">

                                <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Menu</a> </p>
                            <br><br>
                          <!--  <div class="col-md-10 col-md-offset-3">
                                <div align="center">
                                    <p align="right">
                                        <a href="create_category.jsp"><button type="button" class="btn btn-primary">Add Category </button></a></div>
                            </div></div> -->
                <form>
                    <%
                try{ 
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="Select * FROM list_of_surveys where category_id in (select cat_id from category where user_id="+uid+")";
                   
                    resultSet = statement.executeQuery(sql);
                    %>
                                              

                        <table>
                            <thead>
                                <tr>
                                    <th>S.No</th>
                                    <th>Survey Name</th>
                                    <th>Download</th>                                 
                                </tr>
                            </thead>
                            <tbody>
                                <% while(resultSet.next()){ %>
                                <tr>
                                    
                                    
                                    <td><%= ++count%></td>
                                  <td><a href="./csv.jsp?surid=<%=resultSet.getLong("survey_id") %>"> 
                                      <%= resultSet.getString("survey_desc") %>
                                      </a>
                                  </td> 
                                  
                    <td width="20%">
					<a href="./csv.jsp?surid=<%=resultSet.getLong("survey_id") %>">  
					<button class="btn1 btn-primary dropdown-toggle" type="button" >Download  &nbsp;<span class="fui-new"></span></a></td>
                                    

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


<br>
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