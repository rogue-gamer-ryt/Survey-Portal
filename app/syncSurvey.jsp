<%@page import="java.sql.*"%>
<%@page import="javax.swing.JTextField" %>
<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*,java.io.PrintWriter" %>
<%@ page import="org.json.simple.*"%>

<%
String id = request.getParameter("userId");
String m=request.getParameter("sur_id");
String username=request.getParameter("username");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "test2";
String userId = "root";
String password = "sjbalaji";
JSONObject obj = new JSONObject();
String rt=null;

try 
{
Class.forName(driverName);
} 
catch (ClassNotFoundException e)
{
e.printStackTrace();
out.println(e);
}
Connection connection = null;



Statement statement = null;
Statement statement1 =null;
ResultSet resultSet = null;
ResultSet resultSet1 =null;

try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql1 ="SELECT * FROM assigned_surveys WHERE srusername='"+username+"'";
resultSet = statement.executeQuery(sql1);
JSONArray ja = new JSONArray();
while(resultSet.next())
{
  
  rt=resultSet.getString("assigned_survey");
  
  String sql2="SELECT * FROM list_of_surveys where survey_id="+rt+"";
  statement1 = connection.createStatement();
  resultSet1 = statement1.executeQuery(sql2);
  while(resultSet1.next()){
   JSONObject json = new JSONObject();
 //out.println("pigs are flying");
 json.put("categoryid", resultSet1.getLong(1));
    json.put("surveyid", resultSet1.getLong(2));
    json.put("surveydesc", resultSet1.getString("survey_desc"));
    json.put("welcome", resultSet1.getString("survey_intro"));
 

    ja.add(json);
    }
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
out.println(e);
}
%>