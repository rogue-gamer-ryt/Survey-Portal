<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.swing.JTextField" %>
<%
String id = request.getParameter("userId");
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
String sql ="SELECT * FROM users";
int f=0;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String x = resultSet.getString("srusername");
String y=request.getParameter("user_id");
//out.println(y);
//out.println(x);
if((y).equals(x))
	f=1; 
}
if(f==1)
{out.println("Already exists");request.setAttribute("chkMessage", "You have been sucessfully available!!");}
else
{out.println("Username valid");request.setAttribute("chkMessage", "You have been unfortunately un-available!!");}
connection.close();
}
catch (Exception e) 
{
e.printStackTrace();
}
RequestDispatcher rd = request.getRequestDispatcher("/vvvsignup.jsp");
            rd.forward(request, response);
%>