
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.Date" %>
<%
    try{
        String companyname = request.getParameter("companyname"); 
        String sql2 ="SELECT * FROM users";
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String website = request.getParameter("website");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        int f=0;
        resultSet2 = statement.executeQuery(sql2);
		while(resultSet.next()){
		String x = resultSet.getString("srusername");
		String y=request.getParameter("user_id");
		if((y).equals(x))
		f=1; 
		}
		if(f==1)
		{out.println("Already exists");}
		else
		{out.println("Username valid");}
        Date dNow = new Date();
        SimpleDateFormat ft = 
        new SimpleDateFormat ("yyyyMMddHHmmssSSS");
        String uid =""+ft.format(dNow);
        //out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?" + "user=root&password=sjbalaji");    
        PreparedStatement pst = conn.prepareStatement("insert into client values('"+username+"','"+password+"','"+companyname+"','"+address+"','"+email+"','"+website+"','"+phone+"',"+uid+");");
        //pst.setString(1, username);
        //pst.setString(2, password);
        pst.executeUpdate();
        out.println("Data is successfully inserted!"); 
        request.setAttribute("succMessage", "You have been sucessfully signedup!!");
        
            RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
            rd.forward(request, response);
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again..ERROR="+e);       
   }      
%>
