<%@page import="java.sql.*"%>
<%@page import="javax.swing.JTextField" %>
<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*" %>
<%
String id = request.getParameter("userId");
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
%>
<!DOCTYPE>
<html>
    <head>
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
                background-color:#FFFFF;
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
    </head>

    <body background="../images/bg2.jpg">
        <div class='container'> 
          <div id="dvData">
          
               
                   
                   
<%
long surid=Long.parseLong(""+request.getParameter("surid")); 
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
statement=connection.createStatement();
stmt =connection.createStatement();
String sql ="desc `"+surid+"`";
resultSet0 = stmt.executeQuery(sql);

%>
<table>
 <tr>   
 
               <!--    <tr>
                       
                        <td><% //out.write(resultSet.getString("cat_name"));%></td>
                        <td><%// out.write(resultSet.getString("cat_id")); %></td>
                    </tr> -->
                    <%//resultSet0.next();
                    for(int x=0;x<8;x++){resultSet0.next();%>
                    <th><%=resultSet0.getString("Field")%></th>
                <%}
                    i=0;
                    //out.print("test");
                    while(resultSet0.next()){
                        //out.print("test i="+i);
                    stmt1 =connection.createStatement();
                    qid[i]=Long.parseLong(resultSet0.getString("Field")); %>
                    <% 
                    //out.print("qid = "+qid[i]);
                    String sql1 ="select question from questions where q_id = " + qid[i];
                    i++;
                    resultSet1 = stmt1.executeQuery(sql1);
                    if(resultSet1.next()){ %>
                    <th><%=resultSet1.getString("question")%></th>
 <%}}%>
                    
       </tr>
<tr>
<% stmt2 =connection.createStatement();
 String sql2 ="select * from `"+surid+"`";
 resultSet2 = stmt2.executeQuery(sql2);
 while(resultSet2.next()){%>
 <td><%=resultSet2.getString("fullname")%></td>
 <td><%=resultSet2.getString("dob")%></td>
 <td><%=resultSet2.getString("phone")%></td>
 <td><%=resultSet2.getString("email")%></td>
 <td><%=resultSet2.getString("customField1")%></td>
 <td><%=resultSet2.getString("customField2")%></td>
 <td><%=resultSet2.getString("customField3")%></td>
 <td><%=resultSet2.getString("customField4")%></td>
 <%
     
  for(j=0;qid[j]!=0;j++){
      String x =resultSet2.getString(""+qid[j]); 
      //out.print(x);
if(!(x.trim().equals("null"))){%>
   <td><%=x%></td>
   <%}
 else{
     continue;
}}%>
 </tr><tr>
 <%
}

connection.close();

}
catch (Exception e) 
{
    out.print("error");
e.printStackTrace();
}%>
</tr>
</table>
             
              
              
                    
                    
                
            </div>
            <br/>
            
            <div class='button'>
                <a href="#" id ="export" role='button'>Download Result</a>
            </div>

            
        </div>

        <!-- Scripts ----------------------------------------------------------- -->
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