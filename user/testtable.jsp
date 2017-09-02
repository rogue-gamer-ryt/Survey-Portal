<%-- 
    Document   : manage_results
    Created on : Feb 20, 2016, 4:10:40 PM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Results</title>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
        <!-- Custom CSS -->
        <link rel="stylesheet" type="text/css" href="../css/normalize.css" />
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <link href="css/style3.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css3/normalize2.css" />
        <link rel="stylesheet" type="text/css" href="css3/demo2.css" />
        <link rel="stylesheet" type="text/css" href="css3/component2.css" />
        <link rel="stylesheet" type="text/css" href="../css/demo.css" />
        <link rel="stylesheet" type="text/css" href="../css/component.css" />
        <!--Flat UI-->
        <link href="dist/css/flat-ui.css" rel="stylesheet">
        <link href="docs/assets/css/font-awesome.min.css" rel="stylesheet" >

    </head>
    <body>     
        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">

                <ul class="sidebar-nav">

                    <li class="sidebar-brand">
                        <a href="user_index.jsp">
                            Survey Application
                        </a>
                    </li>
                    <li>

                        <img src="images/logo1.png" class="img-circle" style="width: 30%; height: 30%">
                        <h5 style="font-family:Tahoma ;color:white">Admin Name</h5>  


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

                <!-- /#sidebar-wrapper -->
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

                                    <div class="container"><div class="col-md-6 col-md-offset-3">
                                            <div class="dropdown">
                                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Category Name
                                                    <span class="caret"></span></button>

                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Category 1</a></li>
                                                    <li><a href="#">Category 2</a></li>
                                                    <li><a href="#">Category 3</a></li>
                                                </ul>
                                            </div>
                                            <br><br><br>
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>S.No</th>
                                                        <th>Survey name</th>
                                                        <th>Download</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1.</td>
                                                        <td>Survey 1</td>
                                                        <td width="30%"><button class="btn1 btn-primary-download dropdown-toggle" type="button" >CSV  <i class="glyphicon glyphicon-download-alt" style="font-size:15px;color:white"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>2.</td>
                                                                        <td>Survey 2</td>
                                                                        <td><button class="btn1 btn-primary-download dropdown-toggle" type="button" >CSV <i class="glyphicon glyphicon-download-alt" style="font-size:15px;color:white"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>3.</td>
                                                                                        <td>Survey 3</td>
                                                                                        <td><button class="btn1 btn-primary-download dropdown-toggle" type="button" >CSV  <i class="glyphicon glyphicon-download-alt" style="font-size:15px;color:white"></td>
                                                                                                    </tr>
                                                                                                    </tbody>
                                                                                                    </table>
                                                                                                    </div>         



                                                                                                    </div><br><br><br>
                                                                                                    </div>
                                                                                                    </div>
                                                                                                    </div>
                                                                                                    </div>
                                                                                                    <!-- /#page-content-wrapper -->
                                                                                                    </div>
                                                                                                    <!-- /#wrapper -->

                                                                                                    </div>
                                                                                                    </div>
                                                                                                    </div></div>
                                                                                                    </div>



                                                                                                    <!-- jQuery -->
                                                                                                    <script src="js/jquery.js"></script>

                                                                                                    <!-- Bootstrap Core JavaScript -->
                                                                                                    <script src="js/bootstrap.min.js"></script>
                                                                                                    <script src="js/jquery.min.js"></script>
                                                                                                    <script src="js/jquery.ba-throttle-debounce.min.js"></script>
                                                                                                    <script src="js/jquery.stickyheader.js"></script>
                                                                                                    <!-- Menu Toggle Script -->
                                                                                                    <script>
                                                                                                        $("#menu-toggle").click(function (e) {
                                                                                                            e.preventDefault();
                                                                                                            $("#wrapper").toggleClass("toggled");
                                                                                                        });
                                                                                                    </script>
                                                                                                    <div class="copyrights">
                                                                                                        <p><strong>HIK Technologies   &nbsp |&nbsp All Copyrights Reserved</strong></p>
                                                                                                    </div>
                                                                                                    </body>
                                                                                                    </html>
