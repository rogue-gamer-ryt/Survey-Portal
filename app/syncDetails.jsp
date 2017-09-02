<%@page import="java.sql.*"%>
<%@page import="javax.swing.JTextField" %>
<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*,java.io.PrintWriter" %>
<%@ page import="org.json.simple.*"%>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "test2";
String userId = "root";
String password = "sjbalaji";
JSONObject obj = new JSONObject();


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
String m=request.getParameter("sur_id");
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql1 ="SELECT * FROM user_details WHERE client_id='"+id+"'";
resultSet = statement.executeQuery(sql1);
JSONArray ja = new JSONArray();
while(resultSet.next())
{
	JSONObject json = new JSONObject();
	json.put("phone", resultSet.getString("Phone"));
        json.put("fullname", resultSet.getString("Full_Name"));
        json.put("dob", resultSet.getString("DOB"));
   	json.put("email", resultSet.getString("Email_ID"));
	json.put("custom1", resultSet.getString("CF1"));
	json.put("custom2", resultSet.getString("CF2"));
	json.put("custom3", resultSet.getString("CF3"));
	json.put("custom4", resultSet.getString("CF4"));

    ja.add(json);
    }
obj.put("details", ja);
StringWriter out1 = new StringWriter();
obj.writeJSONString(out1);

String jsonText = out1.toString();
PrintWriter outn = response.getWriter();
outn.print(jsonText);
connection.close();
} 
catch (Exception e) {
e.printStackTrace();
}
%>