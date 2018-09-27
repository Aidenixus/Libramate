<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  meta http-equiv="refresh" content="5;URL=profileServleto"-->
<title>Trans</title>
</head>
<body onload = "send()">
	<form id="myform" action = "profileServleto">
	<input type="text" name="username" id="username" value = "OK" style="visibility:hidden;"/>
	<input type="text" name="img" id="img" value = "OK" style="visibility:hidden;"/>
	</form>
	<script>
		let params = (new URL(document.location)).searchParams;
		let username = params.get("username"); // string now
		let img = params.get("img");
		//document.getElementById("username").innerHTML = username;
		document.getElementById("username").value = username;
		document.getElementById("img").value = img;
	
		function send(){
			document.getElementById("myform").submit();
		}	
	</script>

</body>
</html>