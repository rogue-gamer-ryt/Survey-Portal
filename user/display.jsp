<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Manage Survey</title>
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
		
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         

        <title>CSV Generator</title>


        <style type="text/css">
            body{
                font-family: sans-serif;
                font-weight:300;
                padding-top:30px;
                color:#666;
            }
            .container{
                text-align:center;  
            }
            a{ color:#1C2045; font-weight:350;}
            table{
                font-weight:300;
                margin:0px auto;
                border: 1px solid #1C2045;
                padding:5px;
                color:#666;

            }
            th,td{ 
                border-bottom: 1px solid #dddddd;
                text-align:center;
                margin: 10px;
                padding:0 10px;
            }
            hr{ 
                border:0;
                border-top: 1px solid #E7C254;
                margin:20px auto;
                width:50%;
            }
            .button{
                background-color:#1C2045;
                color:#E7C254;
                padding:5px 20px;
                max-width: 300px;
                line-height:1.5em;
                text-align:center;
                margin:5px auto;
            }
            .button a{ color:#E7C254;}
            .refs{ display:block; margin:auto; text-align:left; max-width:500px; }
            .refs .label{  font-size:1.4em;}
            .refs > ul{ margin-top:10px; line-height:1.5em;}
        </style>
		
		
        <!--Flat UI-->
        <link href="dist/css/flat-ui.css" rel="stylesheet">
<script>
function confirmDelete(surid, surname) {
    var test = confirm("Are you sure you want to delete "+surname+" survey?");
    if(test==true)
        window.location = '/surveyhik/user/delete_sur_back.jsp?surid='+surid;

}
</script>
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
                        <a href="user_details.jsp">User Details</a>
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
                    <%@page import="java.sql.DriverManager"%>
                    <%@page import="java.sql.ResultSet"%>
                    <%@page import="java.sql.Statement"%>
                    <%@page import="java.sql.Connection"%>

                    <%
                    Long qp;
                                String r=request.getParameter("catid");
                                 if (r == null || r.trim().isEmpty()) {
                                     qp = (Long)session.getAttribute("catid");
                                 }
                                 else{
                                 qp=Long.parseLong(r);
                                 session.setAttribute("catid",qp);
                             }
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
<%

                    try{ 
                        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                        statement=connection.createStatement();
                        String sql ="SELECT * FROM category where cat_id="+qp;
                        resultSet = statement.executeQuery(sql);
                        resultSet.next();
                        %>



            <div class="container">
                <div class="component">
                    <div class="col-lg-12">

                        <p align="right">

                            <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Menu</a> </p>
                        <br><br>
                        <div class="col-md-5">

                            <p align="left">

                                <b><%= resultSet.getString("cat_name") %></b>
                        </div>
                        <div class="row">
                            <div class="col-md-5 ">
                                <p align="right">

                                    <a href="create_survey.jsp?catid=<%=qp%>"><button type="button" class="btn btn-primary">Add Survey</button></a>
                                    <a href="manage_category.jsp"><button type="button" class="btn btn-primary">Back</button></a>
                                </p>
                            </div>
                            <div class="col-md-10">

                                <p align="center">

                            </div>
                        </div>
                    </div>

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

long surid=20160317135805025L;
int i=0,j;
long qid[] = new long[25];
for(j=0;j<25;j++){
    qid[j]=0L;
}
//Connection connection = null;
Statement stmt=null,stmt1=null,stmt2=null;
ResultSet resultSet0 = null, resultSet1=null, resultSet2=null;
try
{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
stmt =connection.createStatement();
String sql ="desc `"+surid+"`";
resultSet0 = stmt.executeQuery(sql);%>
<table>
 <tr>
<%
resultSet0.next();
while(resultSet0.next()){
 stmt1 =connection.createStatement();
 qid[i]=Long.parseLong(resultSet0.getString("Field"));%>
<%
 String sql1 ="select question from questions where q_id = " + qid[i];
 i++;
 resultSet1 = stmt1.executeQuery(sql1);
 resultSet1.next();
 %>
 <th><%=resultSet1.getString("question")%></th>
 <%
}%>
</tr>
<tr>
<% stmt2 =connection.createStatement();
 String sql2 ="select * from `"+surid+"`";
 resultSet2 = stmt2.executeQuery(sql2);
 while(resultSet2.next()){%>
 
 <%
  for(j=0;qid[j]!=0;j++){%>
   <td><%=resultSet2.getString(""+qid[j])%></td>
   <%}%>
 </tr><tr>
 <%
}

connection.close();

}
catch (Exception e) 
{
e.printStackTrace();
}%>
</tr>
</table>

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
					
					
					
					
					<script type='text/javascript' src='https://code.jquery.com/jquery-1.11.0.min.js'></script>
        <!-- If you want to use jquery 2+: https://code.jquery.com/jquery-2.1.0.min.js -->
        <script type='text/javascript'>
        $(document).ready(function () {

            console.log("HELLO")
            function exportTableToCSV($table, filename) {
                var $headers = $table.find('tr:has(th)')
                    ,$rows = $table.find('tr:has(td)')

                    // Temporary delimiter characters unlikely to be typed by keyboard
                    // This is to avoid accidentally splitting the actual contents
                    ,tmpColDelim = String.fromCharCode(11) // vertical tab character
                    ,tmpRowDelim = String.fromCharCode(0) // null character

                    // actual delimiter characters for CSV format
                    ,colDelim = '","'
                    ,rowDelim = '"\r\n"';

                    // Grab text from table into CSV formatted string
                    var csv = '"';
                    csv += formatRows($headers.map(grabRow));
                    csv += rowDelim;
                    csv += formatRows($rows.map(grabRow)) + '"';

                    // Data URI
                    var csvData = 'data:application/csv;charset=utf-8,' + encodeURIComponent(csv);

                $(this)
                    .attr({
                    'download': filename
                        ,'href': csvData
                        //,'target' : '_blank' //if you want it to open in a new window
                });

                //------------------------------------------------------------
                // Helper Functions 
                //------------------------------------------------------------
                // Format the output so it has the appropriate delimiters
                function formatRows(rows){
                    return rows.get().join(tmpRowDelim)
                        .split(tmpRowDelim).join(rowDelim)
                        .split(tmpColDelim).join(colDelim);
                }
                // Grab and format a row from the table
                function grabRow(i,row){
                     
                    var $row = $(row);
                    //for some reason $cols = $row.find('td') || $row.find('th') won't work...
                    var $cols = $row.find('td'); 
                    if(!$cols.length) $cols = $row.find('th');  

                    return $cols.map(grabCol)
                                .get().join(tmpColDelim);
                }
                // Grab and format a column from the table 
                function grabCol(j,col){
                    var $col = $(col),
                        $text = $col.text();

                    return $text.replace('"', '""'); // escape double quotes

                }
            }


            // This must be a hyperlink
            $("#export").click(function (event) {
                // var outputFile = 'export'
                var outputFile = window.prompt("What do you want to name your output file?") || 'export';
                outputFile = outputFile.replace('.csv','') + '.csv'
                 
                // CSV
                exportTableToCSV.apply(this, [$('#dvData>table'), outputFile]);
                
                // IF CSV, don't do event.preventDefault() or return false
                // We actually need this to be a typical hyperlink
            });
        });
                </script>
                </body>
                </html>
