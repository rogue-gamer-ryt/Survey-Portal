<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.util.Date" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<%
long client_id = (Long)session.getAttribute("userid");
String username = request.getParameter("uname");
String passwordfu = request.getParameter("password");
String email = request.getParameter("email");
String testmail=request.getParameter("testmail");
String players = request.getParameter("players");
String players2 = request.getParameter("players2");
String[] surveys = players.split("::");
String[] surveys2 = players2.split("::");
//String client_id = "test"; 
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "test2";
String userId = "root";
String password = "sjbalaji";

String temp[]=new String[20];
try {
Class.forName(driverName);
} 
catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
PreparedStatement prs,prs2,prs3,prs4;
ResultSet resultSet = null;
try
{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
//out.println(username);
int lengthofsurveys = surveys.length;
int i=0;
//out.println(passwordfu);
//out.println(email);
//out.println(Arrays.toString(surveys));
String changed_string= Arrays.toString(surveys);
String changed_string2= Arrays.toString(surveys2);

String sqlq ="SELECT * FROM users";
prs = connection.prepareStatement(sqlq);
resultSet = prs.executeQuery();
int f=0;
if(f==0 && surveys[0].trim().isEmpty()!= true){
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql ="update users set sr_email='"+email+"', survey_id='"+changed_string2+"' WHERE srusername='"+username+"'";
String sqlx ="delete from assigned_surveys where srusername='"+username+"'";
String sql2[]=new String[15]; 
for(i=0;i<15;i++)
{ sql2[i]="NULL";
   temp[i]="NULL";
}
//out.println(sql);
prs = connection.prepareStatement(sql);
prs.executeUpdate();
prs4 = connection.prepareStatement(sqlx);
prs4.executeUpdate();
//out.println("<br><br><br>"+lengthofsurveys);
//int x=0;
for(i=0;i<lengthofsurveys;i++)
{
    temp[i]= surveys[i];
	//x++;
	//out.println(surveys[i]);
    sql2[i] ="insert into assigned_surveys values ('"+username+"', '"+temp[i]+"')";
    prs2 = connection.prepareStatement(sql2[i]);
    //out.println(sql2[i]);
    prs2.executeUpdate();
	//out.println("<br>");
	//out.println(x);
}
//out.println("<br><br><br>Values have been entered Successfully");
//out.println("User details updated sucessfully!"); 
        request.setAttribute("succMessage", "User updated sucessfully!");
            RequestDispatcher rd = request.getRequestDispatcher("./manage_user.jsp");
            rd.forward(request, response);
			connection.close();
}
else{
        request.setAttribute("succMessage", "User not updated as no survey was assigned!");
            RequestDispatcher rd = request.getRequestDispatcher("./manage_user.jsp");
            rd.forward(request, response);
			connection.close();    
}

}
catch (Exception e) 
{
e.printStackTrace();
}
%>