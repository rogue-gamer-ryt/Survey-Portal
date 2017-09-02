<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
String cid = (String) session.getAttribute("catid");
String catname = request.getParameter("catname");
String catdesc = request.getParameter("catdesc");
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
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql ="update category set cat_name='"+catname+"', cat_desc='"+catdesc+"' where cat_id="+cid;
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