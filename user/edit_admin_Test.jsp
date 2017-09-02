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
        <title>Edit Admin</title>
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
        <link rel="stylesheet" type="text/css" href="css3/bootstrap.css" />


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
                <!-- <div id="footer">
                <h6 align="center"><strong>HIK Technologies    &nbsp |&nbsp All Copyrights Reserved</strong> </h6>
                </div>
                </div>
                <!-- /#sidebar-wrapper -->
            </div>
        <!-- /#sidebar-wrapper -->

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
                    
                        
<form>
<div id="block">
          <!-- /#page-content-wrapper -->
<%@ page import="java.io.*,java.util.*" %>
    <%@ page import="javax.servlet.*,java.text.*" %>
    <%@ page import ="java.sql.*" %>

<%
Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    
try{ 
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?" + "user=root&password=sjbalaji");
PreparedStatement pst = conn.prepareStatement("SELECT * FROM client");
String sql ="SELECT * FROM client WHERE username='admin'";
ResultSet resultSet = null;
resultSet = pst.executeQuery(sql);
while(resultSet.next()){
%>

    <div id="block">
        
        <form name="eda_form" action="edit_admin_back.jsp" method="post">
            <div class="row">
                <div class="col-sm-6">
    <div class="form-group">
    <label for="exampleInputEmail1">Company Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("company_name")%>">
    </div></div>
    <div class="col-sm-6">
    <div class="form-group">
   <label for="exampleInputEmail1">Admin Username</label>
    <input type="text" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("username")%>">
    </div></div></div>
     <div class="row">
                <div class="col-sm-6">
    <div class="form-group">
    <label for="exampleInputEmail1">E-Mail: </label>
    <input type="text" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("email")%>">
    </div></div>
    <div class="col-sm-6">
    <div class="form-group">
     <label for="exampleInputEmail1">Password</label>
    <input type="password" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("password")%>">
    </div></div></div>
    <div class="row">
                <div class="col-sm-6">
    <div class="form-group">
    <label for="exampleInputEmail1">Address</label>
    <input type="text" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("address")%>">
    <label for="exampleInputEmail1">Website</label>
    <input type="text" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("website")%>">
    <label for="exampleInputEmail1">Contact Number</label>
    <input type="text" class="form-control" id="exampleInputEmail1" value="<%=resultSet.getString("phone")%>">
    </div></div>
    <div class="col-sm-6">
    <div class="form-group">  <br>
    <img src="images/logo1.png" alt="..." class="img-rounded">
    <label for="exampleInputFile">Change Company Logo</label>
    <input type="file" id="exampleInputFile">
    <p class="help-block">Upload the .jpg logo</p>
  </div></div></div></div>
    
    <input type="checkbox"> I agree to the terms and conditions!</input>
    <br> 
    <a href="user_index.jsp"><button type="button"  class="btn btn-primary-delete">Cancel</button></a>
    <a href="user_index.jsp"><button type="button"  class="btn btn-primary">Submit</button></a>
</form>
</div>
<% 
}
conn.close();
}
catch (Exception e) 
{
e.printStackTrace();
}
%>
    <br/>
    <br/>
    <br/>
  </div>
</form>
                             

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
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
<div class="copyrights">
<p><strong>HIK Technologies   &nbsp |&nbsp All Copyrights Reserved</strong></p>
</div>
    </body>
</html>
