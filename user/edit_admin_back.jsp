<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
long uid = (Long) session.getAttribute("userid");
String compname = request.getParameter("compname");
String website = request.getParameter("website");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String name = request.getParameter("name");
String address = request.getParameter("address");
String pass = request.getParameter("password");
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
<meta http-equiv="refresh" content="0; url=user_index.jsp">
</head>
<script>
function dis()
{
	alert('Details saved successfully!');
}
window.onload = dis();
</script>
<%
try
{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql ="UPDATE `client` SET `password`='"+pass+"', `company_name`='"+compname+"', `address`='"+address+"', `email`='"+email+"',`name`='"+name+"', `website`='"+website+"', `phone`='"+phone+"' WHERE `user_id`='"+uid+"'";
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