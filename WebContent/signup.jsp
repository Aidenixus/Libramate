<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LibraMate: Signup Page</title>
<link rel="stylesheet" type="text/css" href="homes.css" />
</head>
<body>
<div class = "b">
		</div>
		<div class = "middleb">
		<div class="header">
		<a href="home.jsp">LibraMate</a></div>
		
	<form name = "myform" action = "signupv" method = "GET">
		<!--  why no /> here?? at the form -->
		<!--  onsubmit: whenever submit. If returns false, don't get submitted, otherwise submitted -->
		<!--  default: the form will get submit it. So, if we decide if either one of them
		is blank, we won't submit it. -->
		<!-- form has to have an opening and a close -->
			<div class = "signupform" id ="signup" >
			Username<br><input type = "text" id ="signup1" name = "username" value =${param.username!=null? param.username : ''}> 
			<span style="color: red;font-weight:bold">${uerror!=null? uerror : ''}</span><br />
			<br>
			<!--  what's submitted is value, didn't write it here because it's by default blank. -->
			Password<br> <input type = "password" id ="signup2" name = "pw" value =${param.pw!=null? param.pw : ''}>
			<span style="color: red;font-weight:bold">${perror!=null? perror : ''}</span><br />
			<br>
			Image URL <br><input type = "text" id ="signup3" name = "imageurl" value =${param.imageurl!=null? param.imageurl : ''}>
			<span style="color: red;font-weight:bold">${ierror!=null? ierror : ''}</span><br />
			<br>
			<input type = "image" id = "image" name="submit" value ="SIGN UP" src = "signup.png"/>
			</div>
			</form>
	</div>

</body>
</html>