<%-- 
    Document   : versionCheck
    Created on : Mar 26, 2016, 11:18:24 AM
    Author     : jeyabalaji
--%>
<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*,java.io.PrintWriter" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>App VersionCheck</title>
    </head>
    <body>
        <%int latest_version = 1;
            
          PrintWriter outn = response.getWriter();
          outn.print(latest_version);%>
    </body>
</html>
