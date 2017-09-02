<%-- 
    Document   : csvtable
    Created on : 5 Apr, 2016, 12:08:33 PM
    Author     : user pc
--%>

<%@page import="java.sql.*"%>
<%@page import="javax.swing.JTextField" %>
<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*" %>
<%
    session = request.getSession(false);
    long uid = 0L;
    try {
        uid = (Long) session.getAttribute("userid");
    } catch (Exception e) {
    }
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
        <link rel="stylesheet" type="text/css" href="./css2/jquery.dataTables.css" > 
        <link rel="stylesheet" type="text/css" href="./css2/dataTables.tableTools.css" >
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">





        <title>Download Results</title>



    </head>

    <body background="../images/bg2.jpg">

        <div class="container"> 
            <%
                long surid = Long.parseLong("" + request.getParameter("surid"));
                int i = 0, j;
                long qid[] = new long[500];
                for (j = 0; j < 500; j++) {
                    qid[j] = 0L;
                }
                //Connection connection = null;
                Statement stmt = null, stmt1 = null, stmt2 = null;
                ResultSet resultSet0 = null, resultSet1 = null, resultSet2 = null;
                try {
                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                    statement = connection.createStatement();
                    stmt = connection.createStatement();
                    String sql = "desc `" + surid + "`";
                    resultSet0 = stmt.executeQuery(sql);
            //ResultSetMetaData me=resultSet0.getMetaData();

            %>

            <table id="example" class="display dataTables_wrapper" cellspacing="0" width="100%">
                <thead>
                    <tr>   
                        <%//resultSet0.next();
                            for (int x = 0; x < 8; x++) {
                                resultSet0.next();%>
                        <th><%=resultSet0.getString("Field")%></th>
                            <%}
                                i = 0;
                                //out.print("test");
                                while (resultSet0.next()) {
                                    //out.print("test i="+i);
                                    stmt1 = connection.createStatement();
                                    qid[i] = Long.parseLong(resultSet0.getString("Field")); %>
                            <%
                                //out.print("qid = "+qid[i]);
                                String sql1 = "select question from questions where q_id = " + qid[i];
                                i++;
                                resultSet1 = stmt1.executeQuery(sql1);
                                if (resultSet1.next()) {%>
                        <th><%=resultSet1.getString("question")%></th>
                            <%}
                                }%>

                    </tr>
                </thead>
                <tbody>
                    <%
                        stmt2 = connection.createStatement();
                        String sql2 = "select * from `" + surid + "` where email in (select testemail from users where client_id ="+uid+")";
                        //String sql2 = "select * from `20160411111435266` where email in (select testemail from users where client_id =" + uid + ")";
                        //out.println("" + sql2);
                        resultSet2 = stmt2.executeQuery(sql2);
                        while (resultSet2.next()) {%>
                    <tr>    

                        <td><%=resultSet2.getString("fullname") == null ? "-" : resultSet2.getString("fullname")%></td>
                        <td><%=resultSet2.getString("dob") == null ? "-" : resultSet2.getString("dob")%></td>
                        <td><%=resultSet2.getString("phone").trim().isEmpty() ? "-" : resultSet2.getString("phone")%></td>
                        <td><%=resultSet2.getString("email").trim().isEmpty() ? "-" : resultSet2.getString("email")%></td>
                        <td><%=resultSet2.getString("customField1").trim().isEmpty() ? "-" : resultSet2.getString("customField1")%></td>
                        <td><%=resultSet2.getString("customField2").trim().isEmpty() ? "-" : resultSet2.getString("customField2")%></td>
                        <td><%=resultSet2.getString("customField3").trim().isEmpty() ? "-" : resultSet2.getString("customField3")%></td>
                        <td><%=resultSet2.getString("customField4").trim().isEmpty() ? "-" : resultSet2.getString("customField4")%></td>


                        <%

                            for (j = 0; qid[j] != 0; j++) {
                                String x = resultSet2.getString("" + qid[j]) + "";
                                //out.print(x);
                                if (!(x.trim().equals("null"))) {%>
                        <td><%=x%></td>
                        <%} else {%>
                        <td>Not Answered</td>
                        <%}
                                    }%>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <%

                    connection.close();

                } catch (Exception e) {
                    out.print("error");
                    out.print(e.toString());
                    e.printStackTrace();
                }%>
        </div>
        <script type="text/javascript" src="./js2/jquery.js"></script>
        <script type="text/javascript" src="./js2/jquery.dataTables.js"></script>
        <script type="text/javascript" src="./js2/dataTables.tableTools.js"></script>


        <!-- If you want to use jquery 2+: https://code.jquery.com/jquery-2.1.0.min.js -->
        <script>

            $(document).ready(function () {
                $('#example').DataTable({
                    "dom": 'T<"clear">lfrtip',
                    "tableTools": {
                        "sSwfPath": "copy_csv_xls_pdf.swf",
                        "aButtons": [
                            {
                                "sExtends": "copy",
                                "sButtonText": "Copy to clipboard"
                            },
                            {
                                "sExtends": "csv",
                                "sButtonText": "Save to CSV"
                            },
                            {
                                "sExtends": "xls"


                            }
                        ]
                    }
                });
            });
        </script>
    </body>
</html>