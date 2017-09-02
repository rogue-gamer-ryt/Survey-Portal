<%-- 
    Document   : signup
    Created on : Feb 20, 2016, 4:27:45 PM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.swing.JTextField" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SignUp</title>
        <!-- Loading Bootstrap -->
        <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Loading Flat UI -->
        <link href="dist/css/flat-ui.css" rel="stylesheet">
        <link href="docs/assets/css/demo.css" rel="stylesheet">

        <link rel="shortcut icon" href="img/favicon.ico">
    </head>
    
	
    <body style="overflow-x:hidden; background-color: #1abc9c;">
	<script type="text/javascript">
window.onload = function () {
	document.getElementById("login-pass").onchange = validatePassword;
	document.getElementById("confirm-login-pass").onchange = validatePassword;
}
function validatePassword(){
var pass2=document.getElementById("confirm-login-pass").value;
var pass1=document.getElementById("login-pass").value;
if(pass1!=pass2)
	document.getElementById("confirm-login-pass").setCustomValidity("Passwords Don't Match");
else
	document.getElementById("confirm-login-pass").setCustomValidity('');	 
//empty string means no validation error
}
</script>

        <div class="login">
            <div class="login-screen">

                <div class="sucessmessage" style="width: 40%; margin: 0px auto;">            
                    <%
                        if (null != request.getAttribute("succMessage")) {
                            out.println(request.getAttribute("succMessage"));
                        }
                    %></div>
                <div class="login-form">
                    <form name="signup-form" class="login-form" action="signup_back.jsp" method="post">
                       <!-- <div class="form-group" >
                            <input name="companyname" type="text" class="form-control login-field" value="" placeholder="Enter your Company Name" id="login-name" required="true">
                            <label class="login-field-icon fui-home" for="login-name"></label>
                        </div>-->
<!-- -->
                        <div class="form-group">
                            <input name="email" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" class="form-control login-field" value="" placeholder="Enter your E-Mail ID" id="login-name" required="true" oninvalid="setCustomValidity('Enter valid e-mail')">
                            <label class="login-field-icon fui-mail" for="login-name"></label>
                        </div>
                        <div class="form-group">
                            <input name="password" type="password" pattern=".{6,}" class="form-control login-field" value="" placeholder="Password" id="login-pass" required="true" oninvalid="setCustomValidity('Minimum 6 characters')">
                            <label class="login-field-icon fui-lock" for="login-pass" ></label>
                        </div>
                        <div class="form-group">
                            <input name="confirmpassword" type="password" pattern=".{6,}" class="form-control login-field" value="" placeholder="Confirm Password" id="confirm-login-pass" required="true" oninvalid="setCustomValidity('Minimum 6 characters')">
                            <label class="login-field-icon fui-lock" for="login-pass" ></label>
                        </div>

                        <!-- <div class="form-group">
                            <input name="username" type="text" class="form-control login-field" value="" placeholder="Enter your Username" id="login-name" onfocusOut="funcat()" required="true">
                            <label class="login-field-icon fui-user" for="login-name"></label>
                        </div>-->
                        <!--<div class="radio" align="right">
                            <label style="color:black;"><input type="button" name="optradio" value="Check Availability" class="btn btn-primary btn-lg btn-block" onClick="ret()"></label>
                        </div> -->


                        

                       <!--  <div class="form-group">
                            <textarea name="address" class="form-control" id="inputEmail" placeholder="Address" type="text" required="true"></textarea>
                            <label class="login-field-icon fui-location" for="login-name"></label>
                        </div>

                        <div class="form-group">
                            <input name="website" type="text" class="form-control login-field" value="" placeholder="Website" id="login-name" required="true">
                            <label class="login-field-icon fui-link" for="login-name"></label>
                        </div>

                        <div class="form-group">
                            <input name="phone" type="text" class="form-control login-field" value="" placeholder="Phone Number" id="login-name" required="true">
                            <label class="login-field-icon fui-chat" for="login-name"></label>
                        </div> -->
                        <div class="row">
                            <div class="col-md-6">
                                <a class="btn btn-danger btn-lg btn-block" href="index.jsp">Cancel</a><br/>
                            </div>
                            <div class="col-md-6">
                                <input type="submit" name="submit" value="SignUp" class="btn btn-primary btn-lg btn-block" onclick="validatePassword()">
                            </div>
                        </div>


                    </form>
                </div>
                <p align="center"><small>&#169; All Copyrights Reserved  | HIK Technologies</small></p>

            </div>
        </div>
		<script>
		function CheckLength(name) {

			var password = document.getElementById(name).value;

			if (password.length < 6)

				alert('Should have miniumum 6 characters');
				return false;

		}
	</script>


        <script src="dist/js/vendor/jquery.min.js"></script>
        <script src="dist/js/vendor/video.js"></script>
        <script src="dist/js/flat-ui.min.js"></script>
        <script src="docs/assets/js/application.js"></script>
        <script>
       function ret()
        {

        window.alert('hi');
        }
        <script>
        function funcat()
        {
        out.println(request.getAttribute("rps"));
        }
        </script>
        <script>
            videojs.options.flash.swf = "dist/js/vendors/video-js.swf"
        </script>
    </body>
</html>


