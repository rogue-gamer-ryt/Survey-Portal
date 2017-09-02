<%@page import="java.sql.*"%>
<%@page import="javax.swing.JTextField" %>
<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*" %>
<%@ page import="org.json.simple.*"%>
<%
String id = request.getParameter("surveyId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "test2";
String userId = "root";
String password = "sjbalaji";
JSONObject obj = new JSONObject();
JSONObject obj2 = new JSONObject();
String jsonText="";
try 
{
Class.forName(driverName);
} 
catch (ClassNotFoundException e)
{
    //out.println(e);
}
Connection connection = null;
Statement statement = null;
Statement statement2 = null;
Statement statement3 = null;
ResultSet resultSet = null;
ResultSet resultSet2 = null;
ResultSet resultSet3 = null;
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
statement2=connection.createStatement();
statement3=connection.createStatement();
String sql1 ="SELECT * FROM questions WHERE showable=1 and survey_id="+id+"";
//out.print(sql1);
resultSet = statement.executeQuery(sql1);
JSONArray ja = new JSONArray();
//out.print("afterjson");
while(resultSet.next())
{//out.print("qwe");
	JSONObject json = new JSONObject();
	json.put("ques_id", resultSet.getString("q_id"));
	String mo=resultSet.getString("q_id");
	//out.print(resultSet.getString("question"));
	json.put("ques_text", resultSet.getString("question"));
        json.put("score", resultSet.getString("weightage"));
   	json.put("hint", resultSet.getString("hint"));
	json.put("answer_type", resultSet.getString("ans_type"));
        //out.print(json);
if(resultSet.getString("ans_type").trim().equals("3")||resultSet.getString("ans_type").trim().equals("4"))
{       //out.print("enterd if");
	String sql2 ="SELECT * FROM multiple_options WHERE q_id="+mo+"";
        //out.print("<br><br>"+sql2);
        resultSet2 = statement2.executeQuery(sql2);
                //out.print("<br><br>"+resultSet2.toString());
	
	
JSONArray ja2 = new JSONArray();
        resultSet2.next();
		int i=1;
	int jam=Integer.parseInt(resultSet2.getString("numofoptions"));
	while(i<=jam)
	{
        //out.print("<br><br>"+i);
		//String la=resultSet2.getString("option_"+i+"");
        //out.print("::"+la);
		JSONObject json1 = new JSONObject();
	if(!resultSet2.getString("option_"+i+"").trim().equals("NULL"))
		{
            //out.print("::"+la);
			json1.put("opt", resultSet2.getString("option_"+i+""));
			ja2.add(json1);
	    }
		i++;
    }
	//ja.add(json);
	//ja2.add(json1);
    json.put("options",ja2);
	//out.print("exiting if");
    }
    if(resultSet.getString("ans_type").trim().equals("6"))
{       //out.print("enterd if");
	String sql3 ="SELECT * FROM slider WHERE q_id="+mo+"";
        //out.print("<br><br>"+sql3);
        resultSet3 = statement3.executeQuery(sql3);
        //out.print("<br><br>"+resultSet3.toString());
	
	
JSONArray ja3 = new JSONArray();
        resultSet3.next();
        json.put("higher_limit",resultSet3.getString("upper_limit"));
        json.put("lower_limit",resultSet3.getString("lower_limit"));
        json.put("breakdown",resultSet3.getString("split"));
		int j=1;
	int jam=Integer.parseInt(resultSet3.getString("numofoptions"));
	while(j<=jam)
	{
        //out.print("<br><br>"+j);
		String la=resultSet3.getString("split_text_"+j+"");
        //out.print("::"+la);
		JSONObject json1 = new JSONObject();
	if(!resultSet3.getString("split_text_"+j+"").trim().equals("NULL"))
		{
            //out.print("::"+la);
			json1.put("opt", resultSet3.getString("split_text_"+j+""));
			ja3.add(json1);
	    }
		j++;
    }
	//ja.add(json);
	//ja2.add(json1);
    json.put("options",ja3);
	//out.print("exiting if");
    }

ja.add(json);
obj.put("question", ja);
StringWriter out1 = new StringWriter();
obj.writeJSONString(out1);
jsonText = out1.toString();


}
PrintWriter outn = response.getWriter();
outn.println(jsonText);
connection.close();
} 
catch (Exception e) {
    //out.println(e);
}
%>