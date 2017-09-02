<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
String path = (String)request.getAttribute("pathsend");
String apath= (String)request.getAttribute("apppath");
long uid = 0L;
uid = (Long) session.getAttribute("userid");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "test2";
String userId = "root";
String password="sjbalaji";
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
<meta http-equiv="refresh" content="0; url=user/edit_admin.jsp">s
</head>
<%
try
{ 
//    out.println("123");
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql ="Update client SET path='"+path+"',apppath='"+apath+"' where user_id="+uid;
//out.println(sql);
prs = connection.prepareStatement(sql);
prs.executeUpdate();
//out.println("Values have been entered Successfully");
connection.close();
}
catch (Exception e) 
{
e.printStackTrace();
}
%>