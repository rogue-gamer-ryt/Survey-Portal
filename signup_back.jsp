<%-- 
    Document   : signup_back
    Created on : Feb 23, 2016, 1:30:02 PM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.Date" %>
<%
    try{
        String companyname = ""; 
        String email = request.getParameter("email");
        String username = "";
        String address = "";
        String website = "";
        String phone = "";
        String name = "";
        String path="";
        String apath="";
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "test2";
		String userId = "root";
		String dbpassword = "sjbalaji";
        String password = request.getParameter("password");
        Date dNow = new Date();
        SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMddHHmmssSSS");
        String uid =""+ft.format(dNow);
        //out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, dbpassword);
statement=connection.createStatement();
String sql ="SELECT * FROM client";
int f=0;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String x = resultSet.getString("email");
if((email).equals(x))
	f=1; 
}
if(f==1)
{//out.println("This email is already registered!"); 
        request.setAttribute("errorMessage", "Email already exists");
        RequestDispatcher rd = request.getRequestDispatcher("./index.jsp");
            rd.forward(request, response);}
else
{
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test2?" + "user=root&password=sjbalaji");    
        PreparedStatement pst = conn.prepareStatement("insert into client values('"+username+"','"+password+"','"+companyname+"','"+address+"','"+email+"','"+website+"','"+phone+"',"+uid+",'"+name+"','"+path+"','"+apath+"');");
        //pst.setString(1, username);
        //pst.setString(2, password);
        pst.executeUpdate();
        //out.println("Data is successfully inserted!"); 
        request.setAttribute("succMessage", "Signup Success. Login to Continue.");
        RequestDispatcher rd = request.getRequestDispatcher("./index.jsp");
        rd.forward(request, response);}
connection.close();
}
catch (Exception e) 
{
e.printStackTrace();
}
        
  }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again..ERROR="+e);       
   }      
%>