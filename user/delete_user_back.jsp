<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
String uname = request.getParameter("username");
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
<meta http-equiv="refresh" content="0; url=manage_user.jsp">
</head>
<%
try
{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
//out.println(uname);
String sql ="delete from users where srusername='"+uname+"'";
prs = connection.prepareStatement(sql);
prs.executeUpdate();

sql ="delete from assigned_surveys where srusername='"+uname+"'";
prs = connection.prepareStatement(sql);
prs.executeUpdate();

connection.close();
}
catch (Exception e) 
{
e.printStackTrace();
}

%>