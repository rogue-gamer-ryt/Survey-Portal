<%-- 
    Document   : dets
    Created on : Mar 29, 2016, 10:29:51 AM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.swing.JTextField" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*" %>
<%@page import="org.json.simple.*"%>
<%@page import="java.util.*" %>

<%
    String answers = request.getParameter("answers");

    //String surveyId = "20160401104832845";
            String surveyId= request.getParameter("surveyId");
    String regJson = request.getParameter("registration");
    //out.print(regJson);
    //out.print(surveyId);
    //String line = "y,i,o,p";
     String[] qids = new String[200];
     String values = request.getParameter("names"); 
     String q_id = request.getParameter("q_id");
     String delim = ",";
     String str="";
	  HashMap newmap = new HashMap();
         
 
 answers = answers.substring(1, answers.length()-1);           //remove curly brackets
String[] keyValuePairs = answers.split("::");              //split the string to creat key-value pairs
Map<String,String> map = new HashMap ();               
int i=0;
for(String pair : keyValuePairs)                        //iterate over the pairs
{
    String[] entry = pair.split(":");                   //split the pairs to get key and value 
    map.put(entry[0].trim(), entry[1].trim());          //add them to the hashmap and trim whitespaces
    qids[i++] = entry[0].trim();
}
int count = i;
out.print("<br><br>"+map);
    
         String fname1="",phone="",dob="",email="",cf1="",cf2="",cf3="",cf4="";   
    try{
            JSONObject parsingJsonObject = (JSONObject) JSONValue.parseWithException(regJson);
            // get the title
            JSONObject secondParse =(JSONObject) JSONValue.parse(regJson);
            //out.print(secondParse);
            fname1= (String) secondParse.get("fname");
            phone = (String) secondParse.get("phone");
            dob = (String) secondParse.get("dob");
            email = (String) secondParse.get("email");
            cf1 = (String) secondParse.get("cf1");
            cf2 = (String) secondParse.get("cf2");
            cf3 = (String) secondParse.get("cf3");
            cf4 = (String) secondParse.get("cf4");
       }
        catch(Exception e)
			{ 
                System.out.println(e);
            }
%>
    <%
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "test2";
    String userId = "root";
    String password = "sjbalaji";
    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    PreparedStatement prs,prsa;
    ResultSet resultSet,resultSet2 = null;
    Statement statement=null;
%>
<%String cols = "(`fullname`, `dob`, `phone`, `email`, `customField1`, `customField2`, `customField3`, `customField4`";   
  
    try {

  out.println(count);
  //int count=k-8;
   // out.println(count);
   for(int j=0;j<count;j++)
    {
        cols+=",`"+qids[j]+"`";
       str+=",'"+(String)map.get(qids[j])+"'";       
    }
   cols+=") VALUES";
    out.println(str);
    out.println(cols);
        connection.close();
        
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%
      
      
  
    try {
        //out.println(cid);
        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
        String sql = "insert into `"+surveyId+"` "+cols+" ('"+fname1+"','"+dob+"','"+phone+"','"+email+"','"+cf1+"','"+cf2+"','"+cf3+"','"+cf4+"'"+str+")";
        //String sql2 = "update into `"+surveyId+"` where `"+qid+"` ";
        out.println(sql);
        prs = connection.prepareStatement(sql);
//out.println("<br><br><br>"+prs);
        prs.executeUpdate();
//out.println("<br><br><br>Values have been entered Successfully");

        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
	

%>
    