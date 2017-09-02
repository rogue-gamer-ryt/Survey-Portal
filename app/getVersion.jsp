<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@page import="javax.swing.JTextField" %>
<%@ page import="org.json.simple.*"%>
<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*,java.io.PrintWriter" %>
<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "test2";
String userId = "root";
String password = "sjbalaji";
try 
{
Class.forName(driverName);
} 
catch (ClassNotFoundException e)
{
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql1 ="SELECT code FROM version";
resultSet = statement.executeQuery(sql1);
while(resultSet.next())
{
	out.println(resultSet.getString("code"));
	
}
connection.close();
}
catch (Exception e) {
e.printStackTrace();
}
%>
