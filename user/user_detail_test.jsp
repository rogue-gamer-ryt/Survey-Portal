<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
long uid = (Long) session.getAttribute("userid");
String FN = request.getParameter("1");
String EID = request.getParameter("EID");
String DOB = request.getParameter("DOB");
String phone = request.getParameter("Phone");
String cf1 = request.getParameter("CF1");
String cf2 = request.getParameter("CF2");
String cf3 = request.getParameter("CF3");
String cf4 = request.getParameter("CF4");
String cus1 = request.getParameter("cus1");
String cus2 = request.getParameter("cus2");
String cus3 = request.getParameter("cus3");
String cus4 = request.getParameter("cus4");


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
<meta http-equiv="refresh" content="10; url=edit_admin.jsp">
</head>
<%

out.println(FN);
out.println(cus1);
out.println(cus2);


try
{ 
//connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
//String sql ="UPDATE `client` SET `password`='"+pass+"', `company_name`='"+compname+"', `address`='"+address+"', `email`='"+email+"',`name`='"+name+"', `website`='"+website+"', `phone`='"+phone+"' WHERE `user_id`='"+uid+"'";
//out.println(sql);
//prs = connection.prepareStatement(sql);
//out.println("<br><br><br>"+prs);
//prs.executeUpdate();
out.println("<br><br><br>Values have been entered Successfully");

connection.close();
}
catch (Exception e) 
{
e.printStackTrace();
out.println(e);
}
%>
