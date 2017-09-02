<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
String cid = request.getParameter("catid");
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
String sql ="delete from category where cat_id="+cid;
prs = connection.prepareStatement(sql);
prs.executeUpdate();

sql ="update questions set showable=0 where survey_id in (select survey_id from list_of_surveys where category_id="+cid+")";
prs = connection.prepareStatement(sql);
prs.executeUpdate();

sql ="update list_of_surveys set showable=0 where category_id="+cid;
//delete from list_of_surveys where category_id="+cid;
prs = connection.prepareStatement(sql);
prs.executeUpdate();

connection.close();
}
catch (Exception e) 
{
e.printStackTrace();
}

%>