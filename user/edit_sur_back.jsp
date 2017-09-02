<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.util.Date" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<%
String sid = (String) session.getAttribute("surid");
session.setAttribute("surid",sid);
String surname = request.getParameter("surname");
String surdesc = request.getParameter("surdesc");
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
<meta http-equiv="refresh" content="0; url=./manage_survey.jsp">
</head>
<%
try
{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql ="update list_of_surveys set survey_desc = '"+surname+"', survey_intro='"+surdesc+"' where survey_id ="+sid;
prs = connection.prepareStatement(sql);
prs.executeUpdate();
connection.close();
}
catch (Exception e) 
{
e.printStackTrace();
}

%>