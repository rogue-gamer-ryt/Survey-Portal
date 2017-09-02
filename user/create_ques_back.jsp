<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.util.Date" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<%
    String anstype = request.getParameter("qname");
    String enque = request.getParameter("enques");
    String ensc = request.getParameter("ensco");
    String hint = request.getParameter("enhint");
    enque = enque.replace("'","''");
    //anstype = anstype.replace(""","\"");
    if(ensc==null || ensc.trim().isEmpty())
        ensc="0";
    if(hint==null || hint.trim().isEmpty())
        hint="0";
    String q = request.getParameter("num");
    long sid = (Long) session.getAttribute("surid");
    String opname[] = new String[15];
    String scname[] = new String[15];
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
    PreparedStatement prt;
    PreparedStatement pre;
    ResultSet resultSet = null;
%>
<head>
    <meta http-equiv="refresh" content="0; url=manage_questions.jsp">
</head>
<%
    for (int i = 0; i < 15; i++) {
        opname[i] = "NULL";
        scname[i] = "NULL";
    }
    try {
        Date dNow = new Date();
        SimpleDateFormat ft2 = new SimpleDateFormat("yyMMddHHmmssSSS");
        String quid = "" + ft2.format(dNow);
        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
        String sql = "INSERT INTO questions values (" + quid + ",'" + enque + "'," + sid + "," + ensc + ",'" + anstype + "','"+hint+"',1)";
        prs = connection.prepareStatement(sql);
        prs.executeUpdate();
          if(((anstype).equals("1")== false )&&(((anstype.equals("2")) == false)&&((anstype.equals("5")) == false)))
          {  
          int tot = Integer.parseInt(q);
          //out.println(tot);
        for (int i = 1; i <= tot; i++) 
        {
            opname[i] = request.getParameter("option_" + i);
            scname[i] = request.getParameter("score_" + i);
        }
        if (((anstype.equals("3")) == true) || ((anstype.equals("4")) == true)) {
            String sq2 = "Insert into multiple_options values (" + quid + ",'" + opname[1] + "'," + scname[1] + ",'" + opname[2] + "'," + scname[2] + ",'" + opname[3] + "'," + scname[3] + ",'" + opname[4] + "'," + scname[4] + ",'" + opname[5] + "'," + scname[5] + ",'" + opname[6] + "'," + scname[6] + ",'" + opname[7] + "'," + scname[7] + ",'" + opname[8] + "'," + scname[8] + ",'" + opname[9] + "'," + scname[9] + ",'" + opname[10] + "'," + scname[10] + ","+tot+")";
            prt = connection.prepareStatement(sq2);
            prt.executeUpdate();
           //out.println("success");
        } 
        else if (anstype.equals("6")==true) 
        {
            String highl = request.getParameter("hl");
            String lowl = request.getParameter("ll");
            String brdn = request.getParameter("bd");
            String sq3 = "Insert into slider values (" + quid + ",'" + lowl + "','" + highl + "','" + brdn + "'," + scname[1] + ",'" + opname[1] + "'," + scname[2] + ",'" + opname[2] + "','" + opname[3] + "','" + opname[4] + "','" + opname[5] + "','" + opname[6] + "','" + opname[7] + "','" + opname[8] + "','" + opname[9] + "','" + opname[10] + "'," + scname[3] + "," + scname[4] + "," + scname[5] + "," + scname[6] + "," + scname[7] + "," + scname[8] + "," + scname[9] + "," + scname[10] + ","+tot+")";
            pre = connection.prepareStatement(sq3);
            pre.executeUpdate();
            //out.println("success");
        }
        }
        else
        {
        //out.println("Values have been entered Successfully");
        }
         String sqq = "ALTER TABLE `" + sid + "` ADD `"+quid+"` varchar(450);";
        prt = connection.prepareStatement(sqq);
        //out.println("<br><br><br>"+prs);
        prt.executeUpdate();
        connection.close();
    } 
    catch (Exception e) 
    {
        e.printStackTrace();
    }
%>