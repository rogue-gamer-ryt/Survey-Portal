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
     String qq=request.getParameter("arp");
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
    }
     catch (ClassNotFoundException e)
     {
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
    try {
    long quid=Long.parseLong(qq);
        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
        for (int i = 0; i < 15; i++)
     {
        opname[i] = "NULL";
        scname[i] = "NULL";
     }    
        String sql = "UPDATE questions SET question='" + enque + "',weightage=" + ensc + ",ans_type='" + anstype + "',hint='"+hint+"' where q_id="+quid;
        prs = connection.prepareStatement(sql);
        prs.executeUpdate();
      if(((anstype).equals("1")== false )&&(((anstype.equals("2")) == false)&&((anstype.equals("5")) == false)))
          {  
          int tot = Integer.parseInt(q);
        for (int i = 1; i <= tot; i++) 
        {
            opname[i] = request.getParameter("option_" + i);
            scname[i] = request.getParameter("score_" + i);
        }
        if (((anstype.equals("3")) == true) || ((anstype.equals("4")) == true)) {
            String sq2 = "Insert into multiple_options values ("+quid+",'" + opname[1] + "'," + scname[1] + ",'" + opname[2] + "'," + scname[2] + ",'" + opname[3] + "'," + scname[3] + ",'" + opname[4] + "'," + scname[4] + ",'" + opname[5] + "'," + scname[5] + ",'" + opname[6] + "'," + scname[6] + ",'" + opname[7] + "'," + scname[7] + ",'" + opname[8] + "'," + scname[8] + ",'" + opname[9] + "'," + scname[9] + ",'" + opname[10] + "'," + scname[10] + ","+tot+") On DUPLICATE KEY Update option_1='" + opname[1] + "',option_1_weightage= "+ scname[1] + ",option_2='" + opname[2] + "',option_2_weightage= "+ scname[2] + ",option_3='" + opname[3] + "',option_3_weightage= "+ scname[3] +" ,option_4='" + opname[4] + "',option_4_weightage= "+ scname[4] +" ,option_5='" + opname[5] + "',option_5_weightage=" + scname[5] +" ,option_6='" + opname[6] + "',option_6_weightage=" + scname[6] + ",option_7='" + opname[7] + "',option_7_weightage= "+ scname[7] + ",option_8='" + opname[8] + "',option_8_weightage= "+ scname[8] + ",option_9='" + opname[9] + "',option_9_weightage= "+ scname[9] +" ,option_10='" + opname[10] + "',option_10_weightage= "+ scname[10] +" ,numofoptions="+tot;
            prt = connection.prepareStatement(sq2);
            prt.executeUpdate();
           //out.println("success");
        } 
        else if (anstype.equals("6")==true) 
        {
            String highl = request.getParameter("hl");
            String lowl = request.getParameter("ll");
            String brdn = request.getParameter("bd");
            String sq3 = "Insert into slider values ("+quid+",'"+lowl+"','"+highl+"','"+brdn+"',"+scname[1]+",'"+opname[1]+"',"+scname[2]+",'"+opname[2]+"','"+opname[3]+"','"+opname[4]+"','"+opname[5]+"','"+opname[6]+"','"+opname[7]+"','"+opname[8]+"','"+opname[9]+"','"+opname[10]+"',"+scname[3]+","+scname[4]+","+scname[5]+","+scname[6]+","+scname[7]+","+scname[8]+","+scname[9]+","+scname[10]+","+tot+" ) On Duplicate KEY Update lower_limit='" + lowl + "',upper_limit='" + highl + "',split='" + brdn + "',split_id_1=" + scname[1] + ",split_text_1='" + opname[1] + "',split_id_2=" + scname[2] + ",split_text_2='" + opname[2] + "',split_text_3='" + opname[3] + "',split_text_4='" + opname[4] + "',split_text_5='" + opname[5] + "',split_text_6='" + opname[6] + "',split_text_7='" + opname[7] + "',split_text_8='" + opname[8] + "',split_text_9='" + opname[9] + "',split_text_10='" + opname[10] + "',split_id_3=" + scname[3] + ",split_id_4=" + scname[4] + ",split_id_5=" + scname[5] + ",split_id_6=" + scname[6] + ",split_id_7=" + scname[7] + ",split_id_8=" + scname[8] + ",split_id_9=" + scname[9] + ",split_id_10=" + scname[10] + ",numofoptions="+tot;
            pre = connection.prepareStatement(sq3);
            pre.executeUpdate();
            //out.println("success");
        }
        }
        else
        {
        //out.println("Values have been entered Successfully");
        }
        connection.close();
    } 
    catch (Exception e) 
    {
        e.printStackTrace();
    }
%>