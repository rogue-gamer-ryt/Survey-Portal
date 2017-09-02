<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
long uid = (Long) session.getAttribute("userid");
String FN = request.getParameter("FN");
String EID = request.getParameter("EID");
String DOB = request.getParameter("DOB");
//out.print(DOB);
String phone = request.getParameter("Phone");
String cf1 = request.getParameter("CF1");
String cf2 = request.getParameter("CF2");
String cf3 = request.getParameter("CF3");
String cf4 = request.getParameter("CF4");
String cus1 = request.getParameter("cus1");
String cus2 = request.getParameter("cus2");
String cus3 = request.getParameter("cus3");
String cus4 = request.getParameter("cus4");

String var1,var2,var3,var4,var5,var6,var7,var8;
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "test2";
String userId = "root";
String password = "sjbalaji";
 try {
                Class.forName(driverName);
                } 
                catch (ClassNotFoundException e) {
                e.printStackTrace();
                }


Connection connection = null;
PreparedStatement prs;
ResultSet resultSet = null;

session = request.getSession(false);
             
            try {
                uid = (Long) session.getAttribute("userid");
            } catch (Exception e) {
            }
            if (uid == 0L) {
                String site = "../../surveyhik";
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
%>
<head>
<meta http-equiv="refresh" content="0; url=user_details.jsp">
</head>


<%



try
{ 

if(FN!=null){ 
		var1="1";
   }
   else{
	   var1="0";
   }
if(EID!=null){
	var2="1";
	//out.println("\n pigs are flying email");
	}
	else{
	   var2="0";
   }
	
if(phone!=null){
//out.println(phone);
   var3="1";
	}
	else{
	   var3="0";
   }
	
if(DOB!=null){
   var4="1";
  //out.println("\n dob checked");
  //out.println(DOB);

}
else{
	   var4="0";
	  //  out.println("\n dob unchecked");
	   //out.println(DOB);
	  
   }
if((cf1!=null)&&((cus1)!=null))
{
	
	var5=cus1;
}
else{
	   var5="";
   }
	
	if((cf2!=null)&&((cus2)!=null))
{
	
	 var6=cus2;
	//out.println("pigs are flying cus2");
	 
	
}
else{
	   var6="";
	  //out.println("pigs are flying");
   }

if((cf3!=null)&&((cus3)!=null))
{
	
	 var7=cus3;
	
}
else{
	   var7="";
   }

if((cf4!=null)&&((cus4)!=null))
{
	
	 var8=cus4;
	
}
else{
	   var8="";
   }
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql ="Update user_details set Full_Name ='"+var1+"',Email_ID ='"+var2+"',Phone='"+var3+"',DOB='"+var4+"',CF1='"+var5+"',CF2='"+var6+"',CF3='"+var7+"',CF4='"+var8+"' where client_id="+uid;
//out.println(sql);
prs = connection.prepareStatement(sql);
//out.println("<br><br><br>"+prs);
prs.executeUpdate();
//out.println("<br><br><br>Values have been entered Successfully");

connection.close();
}


catch (Exception e) 
{
e.printStackTrace();
//out.println(e);
}

%>