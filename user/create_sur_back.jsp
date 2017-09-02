<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.util.Date" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<%
    String cid = request.getParameter("catid");
    String surname = request.getParameter("surname");
    String surdesc = request.getParameter("surdesc");
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

    Connection connection,connection2 = null;
    PreparedStatement prs;
    Statement stmt=null;
    ResultSet resultSet,rs= null;
%>
<head>
    <meta http-equiv="refresh" content="0; url=manage_survey.jsp?catid=<%=cid%>">
</head>
<%
    try {
      //out.println("123");
        Date dNow = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String sid = "" + ft.format(dNow);
        connection2 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    stmt=connection2.createStatement();
                   String sq2="Select * from list_of_surveys where category_id="+cid;
                    resultSet = stmt.executeQuery(sq2);
        int flag = 0;
        while(resultSet.next()){
            String sname=resultSet.getString("survey_desc");
            if(sname.equals(surname)==true)
            {
                flag++;
            }
        }
        
        if(flag>0)
        {
            //out.println("Hello");
            session.setAttribute("delSurErr","Survey Name already exists.");
             //response.sendRedirect("./create_survey.jsp");
             return;
        }
        else
        {
            //out.println("<br>TEstertwouh akufd");
        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
        String sql = "insert into list_of_surveys values (" + cid + "," + sid + ",'" + surname + "','" + surdesc + "',1)";
        prs = connection.prepareStatement(sql);
        prs.executeUpdate();
        sql = "create table `" + sid + "` (fullname varchar(45), dob varchar(45), phone varchar(15), email varchar(45), customField1 varchar(45), customField2 varchar(45), customField3 varchar(45), customField4 varchar(45));";
        //out.println("<br><br>"+sql);
        prs = connection.prepareStatement(sql);
        prs.executeUpdate();
        connection2.close();
        }
        connection.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

%>