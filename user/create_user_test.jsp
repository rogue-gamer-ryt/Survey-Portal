

<%-- 
    Document   : create_user
    Created on : Feb 20, 2016, 3:27:13 PM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Create User</title>
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
    <body>

        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.io.*"%>
        <%@page import="java.util.*"%>

        <%
            long uid = (Long) session.getAttribute("userid");
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
                            try {
                                connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                statement = connection.createStatement();
                                String sql = "SELECT * FROM client where user_id = " + uid;
                                resultSet = statement.executeQuery(sql);
                                resultSet.next();
                        %>

                        <img src="images/logo1.png" class="img-circle" style="width: 30%; height: 30%">
                        <h5 style="font-family:Tahoma ;color:white;"><%=resultSet.getString("username")%></h5>  


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
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
            <!-- /#sidebar-wrapper -->
            <%
                Long qp;
                String r = request.getParameter("catid");
                if (r == null || r.trim().isEmpty()) {
                    qp = (Long) session.getAttribute("catid");
                } else {
                    qp = Long.parseLong(r);
                    session.setAttribute("catid", qp);
                }

                ResultSet rs = null;
                   //long cid = 123;
            %>
            
            <%
                try {
                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                    statement = connection.createStatement();
                    String sql2 = "SELECT * FROM category WHERE user_id=" + uid;
                    rs = statement.executeQuery(sql2);
            %>
        </div>
        <!-- Page Content -->
        <div id="wrap">

            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">


                        <p align="right">

                            <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Menu</a>

                        </p>
                        <form id="newone" method="POST" action="create_user_back.jsp">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3"><br/><br/><h5><strong>User Name </strong> </h5><input name="uname" type="text" class="form-control" placeholder="Text input">
                                </div>

                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">


                                        <br/>
                                        <div class="form-group">
                                            <br/><h5><strong>Password</strong> </h5>
                                            <input name="password" id="password" class="form-control" type="password" value="123" placeholder="password" />
                                            </p>

                                            <label>
                                                <div class="pbm">
                                                    <div class="bootstrap-switch-square">
                                                        <input type="checkbox" data-toggle="switch" id="custom-switch-03" data-on-text="<span class='fui-check'></span>" data-off-text="<span class='fui-cross'></span>" onclick="showPass()" />
                                                        Show password</div></div></label>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                                        </div>

                                        <%
                                            String[][] data = new String[50][2];
                                            try {
                                                connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                statement = connection.createStatement();
                                                String sql = "Select * FROM list_of_surveys where category_id in (select cat_id from category where user_id = " + uid;
                                                resultSet = statement.executeQuery(sql);
                                                int i = 0;
                                                while (resultSet.next()) {
                                                    data[i][0] = "" + resultSet.getLong("category_id");
                                                    data[i][1] = "" + resultSet.getString("survey_desc");
                                                    i++;
                                                }
                                                connection.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                        <script>
                                            function setcidjs() {
                                                var x = document.getElementById("mySelect").selectedIndex.value;
                                                var surs = <% out.println(Arrays.toString(data));%>;
                                                for (i = 0; i < 50; i++) {
                                                    if (x === surs[i][0]) {
                                                        var h = document.createElement("OPTION");
                                                        h.setAttribute("value", "" + surs[i][1]);
                                                        h.text = surs[i][1];
                                                        document.getElementById("source_3").appendChild(h);
                                                    }
                                                }
                                            }
                                        </script>
                                        <br/>

                                        <div class="dropdown">


                                            <select name="catdropdown" onchange="setcidjs()">
                                                <%
                                                    while (rs.next()) {
                                                %>
                                                <option value="<%rs.getLong("cat_id");%>"><%=rs.getString("cat_name")%></option> <%}%>
                                            </select>

                                            <%
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </div>

                                        <br>
                                        <div class="container2">
                                            <select id="source_3" name="source_3" data-text="Source list">
                                                
                                            </select>
                                            <select id="destination_3" name="destination_3" data-text="Destination list">
                                            </select>


                                        </div>
                                        <br/>
                                        <br/>
                                        <input type="hidden" id="players" name="players"/>
                                        <p align="center"> <button type="submit" onclick="testfun()"  class="btn btn-primary">Save User
                                            </button></p>
                                        <script>
                                            function testfun()
                                            {
                                                //$("#destination_3 option").prop('selected',true);
                                                var selected = document.querySelectorAll("#destination_3 option");
                                                var playernames = [];
                                                for (var i = 0; i < selected.length; ++i) {
                                                    //alert(selected[i].textContent);
                                                    playernames.push(selected[i].value);

                                                }
                                                document.getElementById("players").value = playernames.join("::");
                                                if (confirm(document.getElementById("players").value) === true)
                                                    document.getElementById("newone").submit();

                                                else {
                                                }
                                            }</script>
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
    </div>
</div>

<!-- jQuery -->
<script src="js/jquery.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="password.js"></script> 



<script>
                                            function showPass()
                                            {
                                                var showPasswordCheckBox = document.getElementById("custom-switch-03");
                                                if (showPasswordCheckBox.checked) {
                                                    document.getElementById("password").type = "text";
                                                } else {
                                                    document.getElementById("password").type = "password";
                                                }
                                            }

</script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

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
<script>

    < script src = "dist/js/vendor/jquery.min.js" ></script>
<script src="dist/js/vendor/video.js"></script>
<script src="dist/js/flat-ui.min.js"></script>
<script src="docs/assets/js/application.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>
    videojs.options.flash.swf = "dist/js/vendors/video-js.swf";
</script>
<div class="copyrights">
    <p><strong>HIK Technologies   &nbsp |&nbsp All Copyrights Reserved</strong></p>
</div>
</body>
</html>
