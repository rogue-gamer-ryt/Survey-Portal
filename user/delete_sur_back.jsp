<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String sid = request.getParameter("surid");
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
Statement stmt;
ResultSet resultSet = null;
%>
<head>
<meta http-equiv="refresh" content="0; url=manage_survey.jsp">
</head>
<%
try
{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
stmt = connection.createStatement();
String sql0 = "select * from assigned_surveys where assigned_survey="+sid;
//out.println("SQL Received "+sql0);
resultSet = stmt.executeQuery(sql0);
//out.println("<br>Result Received");
if(!resultSet.next()){
String sql ="update list_of_surveys set showable=0 where survey_id="+sid;
prs = connection.prepareStatement(sql);
prs.executeUpdate();
}
else{
//out.println("<br>errorMessage");
session.setAttribute("delSurErr","Survey cannot be deleted as it has been assigned to a user.");
}

connection.close();
}
catch (Exception e) 
{
e.printStackTrace();
}

%>