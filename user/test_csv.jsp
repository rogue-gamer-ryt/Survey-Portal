<%-- 
    Document   : test_csv
    Created on : 15 Mar, 2016, 9:38:51 AM
    Author     : user pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <%@ page import="java.io.*,java.sql.*"%>
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="../images/bg2.jpg">
        
        <% 

            String filename = "Users/jeyabalaji/DropBox/HIK Tech/updatedcode/surveyhik/web/user/CSV/testfinal.csv";
            Connection conn = null;
            String url = "jdbc:mysql://localhost:3306/";
            String dbName = "test2";
            String driver = "com.mysql.jdbc.Driver";
            String userName = "root"; 
            String password = "sjbalaji";
            Statement stmt;
            try
            {
            FileWriter fw = new FileWriter(filename);
            fw.append("CLASS");
            fw.append(',');
            fw.append("DAY");
            fw.append(',');
            fw.append("H1");
            fw.append('\n');

            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+dbName,userName,password);
            String query = "select * from client";
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next())
            {
            fw.append(rs.getString(1));
            fw.append(',');
            fw.append(rs.getString(2));
            fw.append(',');
            fw.append(rs.getString(3));
            fw.append('\n');
            }
            fw.flush();
            fw.close();
            conn.close();} catch (Exception e) {
e.printStackTrace();
}
%>
                <tbody>
                                                    <tr>
                                                        <td>1.</td>
                                                        <td>Survey 1</td>
                                                        <td width="30%"><a href="http://localhost:8084/surveyhik/user/CSV/testfinal.csv"><button class="btn1 btn-primary-download dropdown-toggle" type="button" >CSV  <i class="glyphicon glyphicon-download-alt" style="font-size:15px;color:white"></a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>2.</td>
                                                                        <td>Survey 2</td>
                                                                        <td><button class="btn1 btn-primary-download dropdown-toggle" type="button" >CSV <i class="glyphicon glyphicon-download-alt" style="font-size:15px;color:white"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>3.</td>
                                                                                        <td>Survey 3</td>
                                                                                        <td><button class="btn1 btn-primary-download dropdown-toggle" type="button" >CSV  <i class="glyphicon glyphicon-download-alt" style="font-size:15px;color:white"></td>
                                                                                                    </tr>
                                                                                                    </tbody>
out.println("<b>You are Successfully Created Csv file.</b>");

        <h1>Hello World!</h1>
    </body>
</html>
