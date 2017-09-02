<%-- 
    Document   : regwrite
    Created on : Mar 24, 2016, 10:07:28 AM
    Author     : jeyabalaji
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.sql.*" %>
<%
    String fname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String dob = request.getParameter("dob");
    String cf1 = request.getParameter("cf1");
    String cf2 = request.getParameter("cf2");
    String cf3 = request.getParameter("cf3");
    String cf4 = request.getParameter("cf4");
    out.println(fname);out.println(dob);out.println(cf3);out.println(email);out.println(cf1);out.println(cf4);out.println(phone);out.println(cf2);
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
        String sql = "insert into apptest values ('"+fname+"','"+email+"','"+phone+"','"+dob+"','"+cf1+"','"+cf2+"','"+cf3+"','"+cf4+"')";
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