<%-- 
    Document   : validate
    Created on : Feb 21, 2016, 8:09:31 PM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@page import="javax.swing.JTextField" %>
<%@ page import="org.json.simple.*"%>
<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*,java.io.PrintWriter" %>
<%
    PrintWriter outn = response.getWriter();
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
		JSONObject obj = new JSONObject();
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test2?" + "user=root&password=sjbalaji");    
        PreparedStatement pst = conn.prepareStatement("Select * from users where srusername=? and sr_password=?");
	pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();  
        JSONArray ja = new JSONArray();
        JSONObject json = new JSONObject();
        if(rs.next()){
            PreparedStatement pst2 = conn.prepareStatement("Select apppath from client where user_id="+rs.getString("client_id"));
            ResultSet rs2 = pst2.executeQuery();
            json.put("clientID", rs.getString("client_id"));
            if(rs2.next()){
                json.put("imageURL", rs2.getString("apppath"));
            }
	}
        else{
          outn.print("0"); 
        }
	StringWriter out1 = new StringWriter();
        json.writeJSONString(out1); 
        String jsonText = out1.toString();
        outn.print(jsonText);
   }
   catch(Exception e){       
       outn.print("ERROR:\n"+e);
   }      
%>

