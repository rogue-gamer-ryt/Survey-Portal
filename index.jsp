<%-- 
    Document   : login
    Created on : Feb 20, 2016, 4:19:23 PM
    Author     : jeyabalaji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Page</title>
        <!-- Loading Bootstrap -->
        <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Loading Flat UI -->
        <link href="dist/css/flat-ui.css" rel="stylesheet">
        <link href="docs/assets/css/demo.css" rel="stylesheet">
    </head>
    <body>
    <body style="background: #1abc9c">    
        <div class="login">
            <div class="login-screen">
                <div class="sucessmessage" style="width: 50%; margin: 0px auto;">            
                    <%
                        if (null != request.getAttribute("succMessage")) {
                            out.println(request.getAttribute("succMessage"));
                        }
                    %></div>
                <div class="errormsg" style="width: 50%; margin: 0px auto; color: #d14233;">            
                    <%
                        if (null != request.getAttribute("errorMessage")) {
                            out.println(request.getAttribute("errorMessage"));
                        }
                    %></div>
                <div class="login-form">
                    <form name="login-form" class="login-form" action="validate.jsp" method="post">
                        <div class="form-group">
                            <input name="username" type="text" class="form-control login-field" value="" placeholder="Enter your e-mail" id="login-name" required=""/>
                            <label class="login-field-icon fui-user" for="login-name"></label>
                        </div>

                        <div class="form-group">
                            <input name="password" type="password" class="form-control login-field" value="" placeholder="Password" id="login-pass" required="" />
                            <label class="login-field-icon fui-lock" for="login-pass"></label>
                        </div>



                        <input type="submit" name="submit" value="Login" class="btn btn-primary btn-lg btn-block" />



                        <%--<a class="btn btn-primary btn-lg btn-block" href="#">Log in</a> --%>


                        <br>
                        <div class="row">
                            <div class="col-md-6">
                                <a class="btn btn-danger btn-lg btn-block" href="forgot_password.jsp">Forgot Password?</a><br/>
                            </div>
                            <div class="col-md-6">
                                <a class="btn btn-success btn-lg btn-block" href="signup.jsp" >Signup</a><br/>
                            </div>
                        </div>
                    </form>
                    <c:if test="${not empty errorMessage}">
                        <c:out value="${errorMessage}"/>
                    </c:if>


                </div>
                <p align="center"><small>&#169; All Copyrights Reserved  | HIK Technologies</small></p>

            </div>
        </div>



        <script src="dist/js/vendor/jquery.min.js"></script>
        <script src="dist/js/vendor/video.js"></script>
        <script src="dist/js/flat-ui.min.js"></script>
        <script src="docs/assets/js/application.js"></script>

        <script>
            videojs.options.flash.swf = "dist/js/vendors/video-js.swf"
        </script>
    </body>
</body>
</html>
