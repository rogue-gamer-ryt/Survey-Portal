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
PreparedStatement prs,prs2,prs3;
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
while(resultSet.next())
{
	String x = resultSet.getString("srusername");
        //out.println("<br> uname:"+x);
        if((username.equals(x))==true)
                {//out.println("          Match!!");
                    f++;} 
        //out.println("F = "+f);
}
//out.println("FLY LIKE AN EAGLE");
if(f==0)
{
    //out.println("FLY LIKE AN pig");

connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql ="insert into users values ('"+username+"','"+passwordfu+"','"+email+"','"+changed_string2+"',"+client_id+",'"+testmail+"')";
String sql2[]=new String[15]; 
for(i=0;i<15;i++)
{ sql2[i]="NULL";
    temp[i]="NULL";
}
//out.println(sql);
prs = connection.prepareStatement(sql);
prs.executeUpdate();//out.println("<br><br><br>"+lengthofsurveys);

for(i=0;i<lengthofsurveys;i++)
{
    temp[i]= surveys[i];
    sql2[i] ="Insert into assigned_surveys values ('"+username+"','"+temp[i]+"')";
    prs2 = connection.prepareStatement(sql2[i]);
    //out.println(sql2[i]);
    prs2.executeUpdate();
}
//out.println("<br><br><br>Values have been entered Successfully");
connection.close();
//out.println("This user created sucessfully!"); 
        request.setAttribute("errorMessage", "User created sucessfully");
            RequestDispatcher rd = request.getRequestDispatcher("manage_user.jsp");
            rd.forward(request, response);
}
else if(f!=0)
{
	//out.println("This user already exists!"); 
        request.setAttribute("errorMessage", "User already exists");
            RequestDispatcher rd = request.getRequestDispatcher("create_user.jsp");
            rd.forward(request, response);
connection.close();
}
}
catch (Exception e) 
{
e.printStackTrace();
}
%>