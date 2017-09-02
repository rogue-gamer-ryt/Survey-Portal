<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit User</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Loading Bootstrap -->
        <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


        <!-- Custom CSS -->
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <link href="css/style3.css" rel="stylesheet">
        <!--Flat UI-->
        <link href="dist/css/flat-ui.css" rel="stylesheet">
        <link href="css2/jquerysctipttop.css" rel="stylesheet">
        <link href="css2/listswap.css" rel="stylesheet">
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
            String uname = request.getParameter("username");
            String pw = request.getParameter("password");

            try {
                Class.forName(driverName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            Connection connection = null;
            Statement statement, statement2, statement3 = null;
            ResultSet resultSet = null;
            ResultSet resultSet2 = null;
            ResultSet resultSet3 = null;
            int count = 0;
            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sq11 = "SELECT path FROM client where user_id = " + uid;
            resultSet = statement.executeQuery(sq11);
            resultSet.next();
            String imgsrc = resultSet.getString("path");
        %>


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
                        try {
                            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                            statement = connection.createStatement();
                            String sql = "SELECT * FROM client where user_id = " + uid;
                            resultSet = statement.executeQuery(sql);
                            resultSet.next();
                    %>

                    <img src="<%=imgsrc%>" class="img-circle" style="width: 30%; height: 30%">
                    <h5 style="font-family:Tahoma ;color:white;"><%=resultSet.getString("name")%></h5>  


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
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
        <!-- /#sidebar-wrapper -->
        <%
//                Long qp;
//                String r = request.getParameter("catid");
//                if (r == null || r.trim().isEmpty()) {
//                    qp = (Long) session.getAttribute("catid");
//                } else {
//                    qp = Long.parseLong(r);
//                    session.setAttribute("catid", qp);
//                }
//
            ResultSet rs = null;
               //long cid = 123;
        %>

        <%
            try {
                connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                statement = connection.createStatement();
                String sql2 = "SELECT * FROM users WHERE srusername='" + uname + "'";
                rs = statement.executeQuery(sql2);
                rs.next();
        %>

        <!-- Page Content -->
        <div id="wrap">

            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">


                        <p align="right">

                            <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Menu</a>

                        </p>

                        <div class="sucessmessage" style="width: 40%; margin: 0px auto;">            
                            <%
                                if (null != request.getAttribute("errorMessage")) {
                                    out.println(request.getAttribute("errorMessage"));
                                }
                            %></div>
                        <form id="newone" method="POST" action="edit_user_back.jsp">
                            <div class="row">
                                <div class="col-md-3 col-md-offset-3">
                                    <h5><strong>User Name </strong> <span style="color:red;">*</span> </h5>
                                    <input name="uname" required type="text" readonly class="form-control" value="<%=rs.getString("srusername")%>" placeholder="Text input" />
                                </div>
                                <div class="col-md-3 ">                                      
                                    <div class="form-group">
                                        <h5><strong>Password</strong> <span style="color:red;">*</span> </h5>
                                        <input name="password" required id="password" class="form-control" readonly value="<%=rs.getString("sr_password")%>" type="password" placeholder="password" />
                                        <label>
                                            <input id="showPassword" type="checkbox" onclick="showPass()">Show Password</input>
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 col-md-offset-3">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address  <span style="color:red;">*</span></label>
                                            <input name="email" required type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" class="form-control" value="<%=rs.getString("sr_email")%>" id="exampleInputEmail1" placeholder="Email">
                                        </div></div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Test Email address  <span style="color:red;">*</span></label>
                                            <input name="testmail" required type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" class="form-control" id="exampleInputEmail1" value="<%=rs.getString("testemail")%>" placeholder="Test Email">
                                        </div>
									<div class="form-group">
											<em><span style="color:red;">*</span>ADD ATLEAST ONE SURVEY</em></span>
                                        
                                            </span>


                                    </div></div>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">

                                        <div class="dropdown">




                                            <%
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </div>
                                        <% try {   //String xp=getAttribute("idx");
                                                statement = connection.createStatement();
                                                statement2 = connection.createStatement();
                                                statement3 = connection.createStatement();
                                                String sql = "Select * FROM list_of_surveys where (category_id in (select cat_id from category where user_id =" + uid + ")) AND (survey_id not in (Select assigned_survey FROM assigned_surveys where srusername ='" + uname + "'))";
                                                String sql2 = "Select * FROM assigned_surveys where srusername ='" + uname + "'";
                                                String sql3 = "select * from list_of_surveys where survey_id in (Select assigned_survey FROM assigned_surveys where srusername ='" + uname + "')";
                                                resultSet = statement.executeQuery(sql);
                                                resultSet2 = statement2.executeQuery(sql2);
                                                resultSet3 = statement3.executeQuery(sql3);
                                        %>
                                        <br>
										<!--	<div class="form-group"> -->
											<em><span style="color:red;">*</span>  Add Atleast One Survey </em></span>
                                       <!-- </div> -->
                                        <div class="container2">
                                            <select id="source_3" name="source_3" data-text="Source list">
                                                <%while (resultSet.next()) {%>
                                                <option name="survey" value="<%=resultSet.getString("survey_id")%>"><%=resultSet.getString("survey_desc")%></option>
                                                <% } %>
                                            </select>
                                            <select id="destination_3" name="destination_3" data-text="Destination list">
                                                <%while (resultSet2.next()) {
                                                        resultSet3.next();%>
                                                <option name="survey" value="<%=resultSet2.getString("assigned_survey")%>"><%=resultSet3.getString("survey_desc")%></option>
                                                <% } %>
                                            </select>

                                            <%
                                                connection.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>  
                                        </div>
                                        
                                        <br/>
                                        <br/>
                                        <input type="hidden" id="players" name="players"/>
                                        <input type="hidden" id="players2" name="players2"/>
                                        <p align="center"> <button type="submit" onclick="testfun()"  class="btn btn-primary">Save User
                                            </button></p>
											
											<div class="form-group">
											<em><span style="color:red;">*</span>  Indicates Mandatory Field</em></span>
                                        
                                            </span>
                                        </div>
                                        <script>
                                            function testfun()
                                            {
                                                //$("#destination_3 option").prop('selected',true);
                                                var selected = document.querySelectorAll("#destination_3 option");
                                                //alert(selected.length);
                                                if (selected.length == 0)
                                                {
                                                    alert('Please assign atleast 1 survey!');
                                                    return false;
                                                }
                                                else {
                                                    var playernames = [];
                                                    //alert('Else block');
                                                    for (var i = 0; i < selected.length; ++i) {
                                                        //alert(selected[i].textContent);
                                                        playernames.push(selected[i].value);

                                                    }
                                                    document.getElementById("players").value = playernames.join("::");


                                                    var selected2 = document.querySelectorAll("#destination_3 option");
                                                    var playernames2 = [];
                                                    if (selected2.length == 0)
                                                    {
                                                        alert('Please assign atleat 1 survey!');
                                                        return false;
                                                    }
                                                    else {
                                                        for (var i = 0; i < selected2.length; ++i)
                                                        {
                                                            //alert(selected2[i].textContent);
                                                            playernames2.push(selected2[i].text);

                                                        }
                                                        document.getElementById("players2").value = playernames2.join("::");
                                                        //alert(""+playernames+"   "+playernames2);
                                                    }
                                                }
                                                //alert("test");
                                            }
                                        </script>
                                        </form>
                                            

                                    </div>
                                </div>
                            </div>
                    </div>
                    <!-- /#page-content-wrapper -->
                    <br/> <br/> 
                    <!-- /#wrapper -->

                </div>
            </div>

        </div>  






        <!--</div>-->



        <!--</div>-->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="password.js"></script> 



        <script>
                                            function showPass()
                                            {
                                                var showPasswordCheckBox = document.getElementById("showPassword");
                                                if (showPasswordCheckBox.checked) {
                                                    document.getElementById("password").type = "text";
                                                } else {
                                                    document.getElementById("password").type = "password";
                                                }
                                            }

        </script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"/>

        <!-- Menu Toggle Script -->
        <script>
                                            $("#menu-toggle").click(function (e) {
                                                e.preventDefault();
                                                $("#wrapper").toggleClass("toggled");
                                            });
        </script>

        <script src="js2/jquery.min.js"></script>
        <script src="js2/jquery.listswap.js"></script>
        <script>
                                            $('#source, #destination').listswap({
                                                truncate: true,
                                                height: 135,
                                                is_scroll: true,
                                            });

                                            $('#source_2, #destination_2').listswap({
                                                truncate: true,
                                                height: 162,
                                                label_add: '',
                                                label_remove: '',
                                            });

                                            $('#source_3, #destination_3').listswap({
                                                truncate: true,
                                                height: 162,
                                            });

                                            $('#source_4, #destination_4').listswap({
                                                truncate: true,
                                                height: 162,
                                            });


        </script>

        <script src = "dist/js/vendor/jquery.min.js" ></script>
        <script src="dist/js/vendor/video.js"></script>
        <script src="dist/js/flat-ui.min.js"></script>
        <script src="docs/assets/js/application.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script>
                                            videojs.options.flash.swf = "dist/js/vendors/video-js.swf"
        </script>
        <nav class="navbar navbar-default navbar-fixed-bottom">
            <div class="container">
                <p align="center"><strong>HIK Technologies   &nbsp |&nbsp All Copyrights Reserved</strong></p>
            </div>
        </nav>

    </body>
</html>
