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
<%@ page import="org.json.simple.*"%>
<%
    String surveyId = request.getParameter("surveyId");
    String regJson = request.getParameter("regJson");
    String answers = request.getParameter("answers");
    JSONObject fname = new JSONObject();
    String sfname = fname.toString();
    JSONObject email = new JSONObject();
    String semail = email.toString();
    JSONObject phone = new JSONObject();
    String sphone = phone.toString();
    JSONObject dob = new JSONObject();
    String sdob = dob.toString();
    JSONObject cf1 = new JSONObject();
    String scf1 = cf1.toString();
    JSONObject cf2 = new JSONObject();
    String scf2 = cf2.toString();
    JSONObject cf3 = new JSONObject();
    String scf3 = cf3.toString();
    JSONObject cf4 = new JSONObject();
    String scf4 = cf4.toString();
    try{
            JSONObject genreJsonObject = (JSONObject) JSONValue.parseWithException(regJson);
            // get the title
            fname=(JSONObject)genreJsonObject.get("fname");
            email=(JSONObject)genreJsonObject.get("email");
            phone=(JSONObject)genreJsonObject.get("phone");
            dob=(JSONObject)genreJsonObject.get("dob");
            cf1=(JSONObject)genreJsonObject.get("cf1");
            cf2=(JSONObject)genreJsonObject.get("cf2");
            cf3=(JSONObject)genreJsonObject.get("cf3");
            cf4=(JSONObject)genreJsonObject.get("cf4");
            out.print(sfname);
            out.print(semail);
            out.print(sphone);
            out.print(sdob);
            out.print(scf1);
            out.print(scf2);
            out.print(scf3);
            out.print(scf4);
            // get the data
            JSONArray genreArray = (JSONArray) genreJsonObject.get("dataset");
            // get the first genre
            JSONObject firstGenre = (JSONObject) genreArray.get(0);
            out.print(firstGenre.get("genre_title"));
            //System.out.println("welcome");
        }
        catch(Exception e){ 
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
    PreparedStatement prs;
    ResultSet resultSet = null;
%>

<%
    try {
        //out.println(cid);
        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
        String sql = "insert into apptest values ('"+sfname+"','"+semail+"','"+sphone+"','"+sdob+"','"+scf1+"','"+scf2+"','"+scf3+"','"+scf4+"')";
//out.println(sql);
        prs = connection.prepareStatement(sql);
//out.println("<br><br><br>"+prs);
        prs.executeUpdate();
//out.println("<br><br><br>Values have been entered Successfully");

        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
    