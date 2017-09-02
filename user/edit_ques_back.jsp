<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.util.Date" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<%
String anstype = request.getParameter("qid");
String enques = request.getParameter("enques");
String ensco = request.getParameter("ensco");
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
PreparedStatement prs;
ResultSet resultSet = null;
%>
<head>
<meta http-equiv="refresh" content="0; url=manage_category.jsp">
</head>
<%
try
{ 
	//Date dNow = new Date();
    //SimpleDateFormat ft = new SimpleDateFormat ("yyMMddHHmmssSSS");
      //  String sid =""+ft.format(dNow);
        // SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMddHHmmssSSS");
        //String cid =""+ft.format(dNow);
        //out.println(cid);
        String quid="22222";
        String sid="34334";
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql ="insert into questions values ("+quid+",'"+enques+"',"+sid+",'"+ensco+"','"+anstype+"')";
//out.println(sql);
prs = connection.prepareStatement(sql);
//out.println("<br><br><br>"+prs);
prs.executeUpdate();
//out.println("<br><br><br>Values have been entered Successfully");
connection.close();
}
catch (Exception e) 
{
e.printStackTrace();
}

%>