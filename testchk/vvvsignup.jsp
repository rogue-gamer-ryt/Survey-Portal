<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup Page</title>
</head>
<body>
<script>
function funcat()
{
	out.println(request.getAttribute("rps"));
}	
</script>
<form action="val.jsp" method="post">
Please enter your username:
<input id="usr_id" type="text" name="user_id" onfocusOut="funcat()"/>
<input type="Submit" name="submit" value="Check"/>
</form>
</body>
