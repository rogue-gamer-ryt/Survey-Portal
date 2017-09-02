<%-- 
    Document   : create_question
    Created on : Feb 20, 2016, 3:16:41 PM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Question</title>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <link href="css/style3.css" rel="stylesheet">
        <!--Flat UI-->
        <link href="dist/css/flat-ui.css" rel="stylesheet">

    </head>

                <%@page import="java.sql.DriverManager"%>
                <%@page import="java.sql.ResultSet"%>
                <%@page import="java.sql.Statement"%>
                <%@page import="java.sql.Connection"%>

                <%
                session=request.getSession(false);
                long uid = 0L;
                try{
                uid = (Long) session.getAttribute("userid");
                }
                catch(Exception e)
                {
                  }
                 if(uid == 0L){
                String site = "../../surveyhik/index.jsp" ;
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site); 
                }
                String sq = request.getParameter("ark");
                String driverName = "com.mysql.jdbc.Driver";
                String connectionUrl = "jdbc:mysql://localhost:3306/";
                String dbName = "test2";
                String userId = "root";
                String password = "sjbalaji";
                int sc[]=new int[15];
                String lowl=null;
                String splt=null;
                String upll=null;
                String op[]=new String[20];
                try {
                Class.forName(driverName);
                } 
                catch (ClassNotFoundException e) {
                e.printStackTrace();
                }

                Connection connection,connection1 = null;
                Statement statement = null,statement3=null;
                ResultSet resultSet = null,rs=null,res=null,ret=null;;
                int count=0,st;
                long pt;
                connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sq11 ="SELECT path FROM client where user_id = "+uid;
                    resultSet = statement.executeQuery(sq11);
                    resultSet.next();
                    String imgsrc=resultSet.getString("path");
                connection1 = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement3=connection1.createStatement();
                    String sq4 ="SELECT * FROM questions where q_id = "+sq;
                    res = statement3.executeQuery(sq4);
                    res.next();
                    String tt=res.getString("ans_type");
                    if((tt.equals("3"))||(tt.equals("4")))
             {
                    String sq5="SELECT * FROM multiple_options where q_id="+sq;
                    ret=statement3.executeQuery(sq5);
                    ret.next();
                    st=0;
                    pt=ret.getLong("numofoptions");
                    for(int i=1;i<=pt;i++)
                    {
                        op[i]=ret.getString("option_"+i);
                        sc[i]=ret.getInt("option_"+i+"_weightage");
                    }
                   }
                   else if((tt.equals("6")))
{
String sq5="SELECT * FROM slider where q_id="+sq;
                   ret=statement3.executeQuery(sq5);
                   ret.next();
                   pt=0;
                 st=ret.getInt("numofoptions");
                    for(int i=1;i<=st;i++)
                    {
                        op[i]=ret.getString("split_text_"+i);
                        sc[i]=ret.getInt("split_id_"+i);
                    } 
                     lowl=ret.getString("lower_limit");
                     upll=ret.getString("upper_limit");
                     splt=ret.getString("split");
}
                   else
                   {
                    pt=0;st=0;
                   }
                %>
                                   <body background="../images/bg2.jpg">
        <div id="wrapper">   
          
            <!-- Sidebar -->
            <div id="sidebar-wrapper">

                <ul class="sidebar-nav">

                    <li class="sidebar-brand">
                        <a href="user_index.jsp">
                            Survey Application
                        </a>
                    </li>
                    <li style="text-indent: -20px;text-align: center;">
                    <%
                try{ 
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="SELECT * FROM client where user_id = "+uid;
                    resultSet = statement.executeQuery(sql);
                    resultSet.next();
                    %>

                        <img src="<%=imgsrc%>" class="img-circle" style="width: 30%; height: 30%">
                        <h5 style="font-family:Tahoma ;color:white;"><%=resultSet.getString("name") %></h5>  


                    </li><li>
                    <script src="js/log.js"></script>
                        <button type="button"  class="btn btn-primary-logout" style="width: 75%" onclick="log()"><i class="glyphicon glyphicon-off" style="font-size:18px;color:white"></i>Logout</button>
                    <br>
                    <li>
                        <a href="edit_admin.jsp">My Profile</a>
                    </li>
                    <li>
                        <a href="manage_category.jsp">Manage Category</a>
                    </li>
                    <li>
                        <a href="manage_user.jsp">Manage User</a>
                    </li>
                      <li>
                        <a href="user_details.jsp">User Details</a>
                    </li>
                    <li>
                        <a href="manage_results.jsp">Manage Results</a>
                    </li>
                </ul>
                                <%
                                connection.close();
                                }
                                catch (Exception e) 
                                {
                                e.printStackTrace();
                                }
                                %>
            </div>

        
        <!-- Page Content -->
        <% try{ 
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="SELECT * FROM questions where q_id = "+sq;
                    resultSet = statement.executeQuery(sql);
                    resultSet.next();
                    String r=resultSet.getString("ans_type");
                    %>


        <div id="wrap" onload="myFunction()">

            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row">
                               <p align="right">
                                  <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Menu</a>
                                </p>

                                    <form class="col-md-6 col-md-offset-3" name="myForm" method="POST" action="edit_ques_back_test.jsp?arp=<%=sq%>">
                                        <div class="row">
                                            <div class="col-md-6"> <br/><h5><strong>Question</strong><span style="color:red;">*</span></h5><textarea class="form-control" required="true" rows="3" name="enques" placeholder="Enter Your Question" style="overflow: auto; height: 130px;"><%=resultSet.getString("question")%></textarea>
                                            </div>

                                            <div class="col-md-6">
                                                <br/>
                                                <h5><strong>Answer Type</strong><span style="color:red;">*</span></h5>
                                                <select multiple class="form-control" id="idt1" name="qname" style="overflow: auto; height: 130px;">
                                                    <option value="1" id="idtb" onClick="clearAll()">Text Box</option>
                                                    <option value="2" id="idta" onClick="clearAll()">Text Area</option>
                                                    <option value="3" id="idob" onClick="soptions()">Option Button </option>
                                                    <option value="4" id="idcb" onClick="moptions()">Check Box</option>
                                                    <option value="5" id="iddt" onClick="clearAll()">Date</option>
                                                    <option value="6" id="idsl" onClick="slider()">Slider</option>
                                                </select>
                                            </div>
                                        
                                            
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6"><br/><h5><strong>Score</strong> </h5><input type="number" class="form-control" min="0" max="999.99" step="0.01" name="ensco" id="idsc" placeholder="Score input" value="<%=resultSet.getInt("weightage")%>"></input>
                                            </div>
                                                <div class="col-md-6"><br/><h5><strong>Hint</strong> </h5><input type="text" class="form-control" id="hint" name="enhint" placeholder="Hint Text" value="<%=resultSet.getString("hint")%>">
                                            </div>

                                      </div>
                                  
                                <%
                                connection.close();
                                }
                                catch (Exception e) 
                                {
                                e.printStackTrace();
                                }
                                %>              
                                                <br>
                                                    <span id="myForm">
													<div class="form-group">
											<em><span style="color:red;">*</span>  Indicates Mandatory Field</em></span>
                                        
                                            </span>
                                        </div>
													
													</span>
                                            </div>
                                          </div>

                                            <div class="row">

                                                <div class="col-xs-6 col-md-4"><br/><br/>

                                                    <p align="right">

                                                        <a href="manage_questions.jsp"><button type="button"  class="btn btn-primary-delete">Cancel</button></a>

                                                    </p>


                                                </div>
                                                <div class="col-xs-6 col-md-4"><br/><br/>

                                                    <p align="center">

                                                        <button type="Submit" onclick="return scorecheck();"  class="btn btn-primary">Save</button>

                                                    </p>
                                                </div>
                                                <div class="col-xs-6 col-md-4"><br/><br/>

                                                    <p align="left">

                                                        <!--<a href="manage_questions.jsp"><button type="button"  class="btn btn-primary">Save And Exit</button></a> -->

                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                      


                <!-- /#page-content-wrapper -->
                
            </div>
            <!-- /#wrapper --> 
        </div>
        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <!--Click Script -->
                    <script>
            var i = 0;
            var total = 0;
            function increment()
            {
                i += 1;
                total++;/* Function for automatic increment of field's "Name" attribute. */
            }
            //Clear all elements
            window.onload=myFunction;
            function clearAll()
            {
                var hint = document.getElementById("hint");
                hint.setAttribute("value","");
                parentDiv = "myForm";
                while (i >= 1)
                {
                    childDiv = "id_" + i;
                                                                removeElement(parentDiv, childDiv);
                                                                i--;
                                                            }
                                                            removeElement(parentDiv, 'typeOptions');
                                                            total = 0;
                                                          }
                                                        //Clear text elements
                                                        function clearText()
                                                        {
                                                            parentDiv = "myForm";
                                                            while (i >= 1)
                                                            {
                                                                childDiv = "id_" + i;
                                                                removeElement(parentDiv, childDiv);
                                                                i--;
                                                            }
                                                            total = 0;
                                                        }
                                                        //Remove Elements Dynamically
                                                        function removeElement(parentDiv, childDiv)
                                                        {
                                                            if (childDiv === parentDiv)
                                                            {
                                                                alert("The parent div cannot be removed.");
                                                            } else if (document.getElementById(childDiv))
                                               
                                                            {
                                                                var child = document.getElementById(childDiv);
                                                                var parent = document.getElementById(parentDiv);
                                                                parent.removeChild(child);
                                                                total--;
                                                            } else
                                                            {
                                                                //alert("Child div has already been removed or does not exist.");
                                                                return false;
                                                            }
                                                        }
                                            
                                            function myFunction()
                                            { 
                                                   <%
                                                   //ask contains value of answer type                
                                                String qq=request.getParameter("ask");
                                                      %>    
                    
                                              var x="<%=qq%>";
                                              if(x==1)
                                              { 
                                                  clearAll();
                                                  document.getElementById("idtb").selected=true;
                                                  //idtb is id of text box
                                            }                                           
                                              else if(x==2)
                                              {
                                                  clearAll();
                                                  document.getElementById("idta").selected=true;
                                                //idta is id of text area
                                          }
                                              else if(x==5)
                                              { 
                                                  clearAll();
                                                   document.getElementById("iddt").selected=true;
                                               //iddt is id of date box
                                          }
                                          <!-- op1.. contain id values of options sc1.. contain id values of of score -->
                                            else if(x==3)
                                            { var q="<%=pt%>";
                                                soptions();
                                                document.getElementById("idob").selected=true;
                                                document.getElementById("num").value=q;
                                                  //idob is id of option button
                                                textbox();
                                                document.getElementById("op11").value="<%=op[1]%>";
                                                document.getElementById("sc1").value=<%=sc[1]%>;
                                                document.getElementById("op12").value="<%=op[2]%>";
                                                document.getElementById("sc2").value=<%=sc[2]%>;
                                                document.getElementById("op13").value="<%=op[3]%>";
                                                document.getElementById("sc3").value=<%=sc[3]%>;
                                                document.getElementById("op14").value="<%=op[4]%>";
                                                document.getElementById("sc4").value=<%=sc[4]%>;
                                                document.getElementById("op15").value="<%=op[5]%>";
                                                document.getElementById("sc5").value=<%=sc[5]%>;
                                                document.getElementById("op16").value="<%=op[6]%>";
                                                document.getElementById("sc6").value=<%=sc[6]%>;
                                                document.getElementById("op17").value="<%=op[7]%>";
                                                document.getElementById("sc7").value=<%=sc[7]%>;
                                                document.getElementById("op18").value="<%=op[8]%>";
                                                document.getElementById("sc8").value=<%=sc[8]%>;
                                                document.getElementById("op19").value="<%=op[9]%>";
                                                document.getElementById("sc9").value=<%=sc[9]%>;
                                                document.getElementById("op110").value="<%=op[10]%>";
                                                document.getElementById("sc10").value=<%=sc[10]%>;
                                             }
                                            else if(x==4)
                                            {var q="<%=pt%>";
                                                moptions();
                                                document.getElementById("idcb").selected=true;                      
                                                  //idcb is id of text box
                                                document.getElementById("num").value=q;
                                                textbox();
                                                document.getElementById("op11").value="<%=op[1]%>";
                                                document.getElementById("sc1").value=<%=sc[1]%>;
                                                document.getElementById("op12").value="<%=op[2]%>";
                                                document.getElementById("sc2").value=<%=sc[2]%>;
                                                document.getElementById("op13").value="<%=op[3]%>";
                                                document.getElementById("sc3").value=<%=sc[3]%>;
                                                document.getElementById("op14").value="<%=op[4]%>";
                                                document.getElementById("sc4").value=<%=sc[4]%>;
                                                document.getElementById("op15").value="<%=op[5]%>";
                                                document.getElementById("sc5").value=<%=sc[5]%>;
                                                document.getElementById("op16").value="<%=op[6]%>";
                                                document.getElementById("sc6").value=<%=sc[6]%>;
                                                document.getElementById("op17").value="<%=op[7]%>";
                                                document.getElementById("sc7").value=<%=sc[7]%>;
                                                document.getElementById("op18").value="<%=op[8]%>";
                                                document.getElementById("sc8").value=<%=sc[8]%>;
                                                document.getElementById("op19").value="<%=op[9]%>";
                                                document.getElementById("sc9").value=<%=sc[9]%>;
                                                document.getElementById("op110").value="<%=op[10]%>";
                                                document.getElementById("sc10").value=<%=sc[10]%>;
                                            }
                                            else if(x==6)
                                            {var q="<%=st%>";
                                                slider();
                                                document.getElementById("idsl").selected=true;
                                                document.getElementById("num").value=q;
                                                textbox();
                                                 //idsl is id of slider
                                                document.getElementById("idhl").value="<%=upll%>";
                                                document.getElementById("idll").value="<%=lowl%>";
                                                document.getElementById("idbd").value="<%=splt%>"; 
                                                document.getElementById("op11").value="<%=op[1]%>";
                                                document.getElementById("sc1").value=<%=sc[1]%>;
                                                document.getElementById("op12").value="<%=op[2]%>";
                                                document.getElementById("sc2").value=<%=sc[2]%>;
                                                document.getElementById("op13").value="<%=op[3]%>";
                                                document.getElementById("sc3").value=<%=sc[3]%>;
                                                document.getElementById("op14").value="<%=op[4]%>";
                                                document.getElementById("sc4").value=<%=sc[4]%>;
                                                document.getElementById("op15").value="<%=op[5]%>";
                                                document.getElementById("sc5").value=<%=sc[5]%>;
                                                document.getElementById("op16").value="<%=op[6]%>";
                                                document.getElementById("sc6").value=<%=sc[6]%>;
                                                document.getElementById("op17").value="<%=op[7]%>";
                                                document.getElementById("sc7").value=<%=sc[7]%>;
                                                document.getElementById("op18").value="<%=op[8]%>";
                                                document.getElementById("sc8").value=<%=sc[8]%>;
                                                document.getElementById("op19").value="<%=op[9]%>";
                                                document.getElementById("sc9").value=<%=sc[9]%>;
                                                document.getElementById("op110").value="<%=op[10]%>";
                                                document.getElementById("sc10").value=<%=sc[10]%>;
                                            }
                                            else
                                            {
                                                clearAll();
                                            }
                                        
                        }
                                                        //Add Elements Dynamically
                                                        function textbox()
                                                        {
                                                            clearText();
                                                            var q = document.getElementById("num").value;
                                                            if(q>10)
                                                            {
                                                                alert("Maximum 10 options only. Please enter again.");
                                                                document.getElementById("num").focus();
                                                                return;
                                                            }
                                                            else if(q=='')
                                                            {
                                                                alert("Enter the number of options to be added");
                                                                document.getElementById("num").focus();
                                                                return;
                                                            }
                                                            for (i = 1; i <= q; i++)
                                                            {
                                                                var r = document.createElement('span');
                                                                var y = document.createElement("INPUT");
                                                                var z = document.createElement("INPUT");

                                                                y.setAttribute("type", "text");
                                                                y.setAttribute("required", "true");
                                                                y.setAttribute("class", "dyn");
                                                                y.setAttribute("placeholder", "Option");
                                                                y.setAttribute("id","op1"+i);

                                                                z.setAttribute("type", "");
                                                                z.setAttribute("required", "true");
                                                                z.setAttribute("class", "dyn");
                                                                z.setAttribute("placeholder", "Value");
                                                                z.setAttribute("id","sc"+i);
                                                                
                                                                y.setAttribute("Name", "option_" + i);
                                                                z.setAttribute("Name", "score_" + i);
                                                                r.appendChild(y);
                                                                r.appendChild(z);
                                                                r.setAttribute("id", "id_" + i);
                                                                r.setAttribute("style", "display:block;");
                                                                document.getElementById("myForm").appendChild(r);
                                                            
                                                            }
                                                            
                                                            
                                                        }
                                                        function addscr()
                                                        {
                                                            var a=document.getElementById("idll").value;
                                                            var b=document.getElementById("idhl").value;
                                                            var c=document.getElementById("idbd").value;
                                                            var d,f;
                                                            var count = 0;
                                                            d=1;
                                                            f=b-a;
                                                            var aa=a;
                                                            var m=f/c;
                                                            if(m>11)
                                                            {
                                                                alert("Alter breakdown values so that there is only 10");
                                                                return;
                                                            }
                                                            else
                                                            { 
                                                                while(+b>=+aa)
                                                                {  
                                                                    aa=+aa + +c;
                                                                    count++;
                                                                }
                                                               document.getElementById("num").value=+count;
                                                               textbox();
                                                            while(+a<=+b)
                                                            {
                                                             document.getElementById("sc"+d).value=+a;   
                                                              a=+a + +c;
                                                              d=+d + 1;
                                                            }
                                                            d=+d-1;
                                                            var last=document.getElementById("sc"+d).value;
                                                            if(last!=b)
                                                            {
                                                                alert("Highest breakdown does not match Higher Limit,hence Higher Limit is changed");
                                                                a=a-c;
                                                                document.getElementById("idhl").value=a;
                                                            }
                                                        }
                                                        }
///function to check option score and question score
//function to check option score and question score
function scorecheck()
{ 
  var ques=document.getElementById("idt1").value;
  var num=document.getElementById("num").value;
  var sc=document.getElementById("idsc").value;
  if(sc!=0)
  {
if(ques==4)
{
 var total=0;
 for(var q=1;q<=num;q++)
 {  
     total=+total + +document.getElementById("sc"+q).value;
 }
 if(total>sc)
 {
    alert("Score is high,reduce scores");
    return false;
 }
 else
{       quescheck();
         document.myForm.submit();
}
}
else if(ques==3)
{
    var t=0;//to hold true condition
    var nt=0;//to hold not true condition
    var y=document.getElementById("num").value;
    var c=y-1;//to hold number of not true scores
    for(var p=1;p<=y;p++)
    {
       if( (document.getElementById("sc"+p).value)==sc)
       {t++;}
       else if((document.getElementById("sc"+p).value)==0)
       {nt++;} 
    }
    if((t==1)&&(nt==c))
    {    quescheck();
         document.myForm.submit();
    }
    else
    {   
        alert("One score should be equal to Question Score, rest should be zero");    
        return false;
    }
}
//else if(ques==6)
//{
//    var hl=document.getElementById("idhl").value;
//    var ll=document.getElementById("idll").value;
//    var bd=document.getElementById("idbd").value;
//    var sd=0,chck=0;
//    if(bd<hl)
//    {
//        chck++;
//    }
//    else
//    {
//        alert("Breakdown should be less than Higher Limit");
//    }
//    for(var p=1;p<=num;p++)
//    {
//     if((document.getElementById("sc"+p).value)<hl)
//      {
//        sd=0;
//      }
//      else
//      {
//    sd++;
//      }
//    }
 //if(sd!=0&&chck==1)
// {
  //alert("Score should be less than higher limit,Please enter scores in order of increasing multiples");
  //alert(sd);
  //alert(chck);
 // return false;
 //}
// if(chck!=0)
// {
//    return false;
// }
// else
// { 
//    quescheck();
//    document.myForm.submit();
//}
//}
else
{
    quescheck();
    if(dd!=1)
    {
        alert("Question missing");
        return false;
    }
    else 
    {
        document.myForm.submit();
    }
}
}
else
{
    alert("Since Question Score is zero,we are setting answer score to Zero");
 for(var p=1;p<=num;p++)
 {
     document.getElementById("sc"+p).value=0;
 }
}
}



function quescheck()//function to check question field
{
    var q=document.getElementById("idqs").value;//idqs has id value of question
    if((q.equals(""))==true)
    {
        alert("Please Enter question");
        return false;
    }
    else 
      dd=1;
      return scorecheck();
}
                                                    function soptions()
                                                        {
                                                            clearAll();
                                                            var hint = document.getElementById("hint");
                                                            hint.setAttribute("value","Only one option can be selected.");
                                                            options();
                                                        }

                                                        function moptions()
                                                        {
                                                            clearAll();
                                                            var hint = document.getElementById("hint");
                                                            hint.setAttribute("value","Multiple options can be selected.");
                                                            options();
                                                        }


                                                        //Add Button Dynamically
                                                        function options()
                                                        {
                                                            var r = document.createElement('span');
                                                            var y = document.createElement("INPUT");
                                                            var h = document.createElement("INPUT");


                                                            y.setAttribute("type", "Button");
                                                            y.setAttribute("value", "Add");
                                                            y.setAttribute("name", "add");
                                                            y.setAttribute("required", "true");
                                                            y.setAttribute("class", "btn btn-primary");
                                                            y.setAttribute("style", "float:right;");
                                                            y.setAttribute("onclick", "textbox()");

                                                            h.setAttribute("type", "number");
                                                            h.setAttribute("required", "true");
                                                            h.setAttribute("placeholder", "Number of Options (Max 10)");
                                                            h.setAttribute("name", "num");
                                                            h.setAttribute("id", "num");
                                                            h.setAttribute("class", "dyn");

                                                            r.appendChild(y);
                                                            r.appendChild(h);
                                                            r.setAttribute("id", "typeOptions");
                                                            document.getElementById("myForm").appendChild(r);
                                                        }

                                                        //Add Slider options Dynamically
                                                        function slider()
                                                        {
                                                            clearAll();

                                                            var r = document.createElement('span');
                                                            var h = document.createElement("INPUT");
                                                            var l = document.createElement("INPUT");
                                                            var b = document.createElement("INPUT");
                                                            var y = document.createElement("INPUT");
                                                            var e = document.createElement("INPUT");

                                                            h.setAttribute("type", "text");
                                                            h.setAttribute("placeholder", "Higher Limit");
                                                            h.setAttribute("id","idhl");
                                                            h.setAttribute("name", "hl");
                                                            h.setAttribute("class", "dyn");
                                                            h.setAttribute("required", "true");

                                                            l.setAttribute("type", "text");
                                                            l.setAttribute("placeholder", "Lower Limit");
                                                            l.setAttribute("name", "ll");
                                                            l.setAttribute("id","idll");
                                                            l.setAttribute("class", "dyn");
                                                            l.setAttribute("required", "true");

                                                            e.setAttribute("type", "number");
                                                            e.setAttribute("placeholder", "Number of Options (Max 10)");
                                                            e.setAttribute("name", "num");
                                                            e.setAttribute("id", "num");
                                                            e.setAttribute("class", "dyn");
                                                            e.setAttribute("required", "true");

                                                            b.setAttribute("type", "text");
                                                            b.setAttribute("placeholder", "Breakdown");
                                                            b.setAttribute("id","idbd");
                                                            b.setAttribute("name", "bd");
                                                            b.setAttribute("class", "dyn");
                                                            b.setAttribute("required", "true");

                                                            y.setAttribute("type", "Button");
                                                            y.setAttribute("value", "Add");
                                                            y.setAttribute("class", "btn btn-primary");
                                                            y.setAttribute("name", "add");
                                                            y.setAttribute("onclick", "addscr()");
                                                            y.setAttribute("required", "true");

                                                            r.appendChild(l);
                                                            r.appendChild(h);
                                                            r.appendChild(b);
                                                            r.appendChild(e);
                                                            r.appendChild(y);

                                                            r.setAttribute("id", "typeOptions");
                                                            document.getElementById("myForm").appendChild(r); 
                                                             document.getElementById("num").style.visibility = "hidden";

                                                        }
  function val() 
  {
         var x = document.forms["myForm"]["enques"].value;
     var y = document.forms["myForm"]["ensco"].value;
          if (x == null || x == "") 
        {
            alert("Question cannot be empty!");
        return false;
        }
    if (y == null || y == "") 
    {
            alert("Score cannot be empty!");
         return false;
    }
    
  }
  
            </script>

        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
        <nav class="navbar navbar-default navbar-fixed-bottom" >
  <div class="container">
   <p align="center"><strong>HIK Technologies   &nbsp |&nbsp All Copyrights Reserved</strong></p>
  </div>
</nav>

        
    </body>
    <form action="#" id="mainform" method="get" name="mainform"><br>
        <span id="myForm"></span>
</html>
