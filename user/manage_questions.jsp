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
        <title>Manage Question</title>
        <meta name="description" content="" />
        <meta name="keywords" content="Monitoring System" />
        <meta name="author" content="Codrops" />
       <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <link href="css/style3.css" rel="stylesheet">
        <!--Flat UI-->


        <link href="dist/css/flat-ui.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css3/component2.css" />
        <link rel="stylesheet" type="text/css" href="css3/component.css" />
        <!--[if IE]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script>
function confirmDelete(surid, surname) {
    var test = confirm("Are you sure you want to delete "+surname+" survey?");
    if(test==true)
        window.location = '/surveyhik/user/delete_sur_back.jsp?surid='+surid;

}
</script>
    </head>
    <body background="../images/bg2.jpg" style="overflow-x:hidden;">
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
                Statement statement = null,statement2=null;
                ResultSet resultSet = null,rs=null;;
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
        <!-- /#sidebar-wrapper -->




<%
                Long qp;
                    String r=request.getParameter("ark");
                    if (r == null || r.trim().isEmpty()) {
                        qp = (Long)session.getAttribute("surid");
                    }
                    else{
                        qp=Long.parseLong(r);
                        session.setAttribute("surid",qp);
                    }
                    
                    try{ 
                        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                        statement=connection.createStatement();
                        String sql ="SELECT * FROM list_of_surveys where survey_id="+qp;
                        resultSet = statement.executeQuery(sql);
                        resultSet.next();
                        %>

        <div class="container">
            <div class="component">
            <div class="col-lg-11">

                    <p align="right">

                                    <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Menu</a></p>
                        
                          <center><h5> MANAGE QUESTIONS</h5></center>
                          <br>
                         
                         <div class="col-md-5">
                             
                         <p align="left">
                          
                         <b><%= resultSet.getString("survey_desc") %></b>
                         </div>
                         <div class="row">
                         <div class="col-md-5 ">
                             <p align="right">
                              
                                <a href="create_question.jsp"><button type="button" class="btn btn-primary">Add Question</button></a>
                         <a href="manage_survey.jsp?catid=<%= resultSet.getString("category_id") %>"><button type="button" class="btn btn-primary">Back</button></a>
                            </p>
                         </div>
                         <div class="col-md-10">
                            
                             <p align="center">
                         

                        <%
                        connection.close();
                        }
                        catch (Exception e) 
                        {
                        e.printStackTrace();
                        }
                        %>
<form>
<%
try
{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql = "SELECT * FROM questions where showable=1 && survey_id="+qp;
resultSet = statement.executeQuery(sql);
%>
<table>
<tr>
    <th>SNo</th>
    <th>Question</th>
    <th>Delete</th>
</tr>
<%
while(resultSet.next())
{
%>
 <tr>
                <td><%= ++count%></td>
                <td> <a href="edit_question.jsp?ark=<%=resultSet.getLong("q_id")%>&ask=<%=resultSet.getString("ans_type")%>"><%= resultSet.getString("question") %></td>
                <td><button onclick="confirmDelete('<%=resultSet.getLong("q_id") %>')" class="btn1 btn-primary-delete dropdown-toggle" type="button" >Delete <span class="fui-cross"></span></td>
            </tr>
            <%} if(count==0){%>
                                <td colspan="4">NO QUESTIONS YET!</td>
                                <%}%>
            </table>
<%
connection.close();
}
catch(Exception e)
{
    e.printStackTrace();
}

%>                         </div></div></div></div>       
        </div></div></div></div></div><!-- /container -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.ba-throttle-debounce.min.js"></script>
        <script src="js/jquery.stickyheader.js"></script>



        <!--copyrights-->
   <nav class="navbar navbar-default navbar-fixed-bottom" >
  <div class="container">
   <p align="center"><strong>HIK Technologies   &nbsp |&nbsp All Copyrights Reserved</strong></p>
  </div>
</nav>

        <script>
            function confirmDelete(qid) {
            var test = confirm("Are you sure you want to delete this question ?");
            if(test==true)
                window.location = '/surveyhik/user/delete_ques_back.jsp?surid='+qid;
                }</script>        
<!-- Menu Toggle Script -->
   <script>
                    $("#menu-toggle").click(function (e) {
                        e.preventDefault();
                        $("#wrapper").toggleClass("toggled");
                    });
                </script>
    </body>
</html>
