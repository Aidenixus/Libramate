<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>
			LibraMate
		</title>
		<script>
			function validate(){
				if (document.myform.text.value.trim().length >0)
					return true;
				else if (document.myform.text.value.trim().length == 0)
				{
					document.getElementById("terror").innerHTML = "<font color = 'red'><strong></strong></font>";
				}
				return false;
			}
		</script>
		<link rel="stylesheet" type="text/css" href="home.css" />
	</head>
	<body>
		<div class = "b">
		</div>
		<div class = "middleb">
		</div>
		
		<div class="header">
		<p>LibraMate</p></div>
		
		<form method = "POST" action= "generalServlet" name = "myform" onsubmit = "return validate();">
			<div class="search_bar">
        		<input type="text" name="text" placeholder = "Search" id = "text" />  <div id = "terror" ></div>
        		<span style="color: red;font-weight:bold">${search_err!=null? search_err : ''}</span>
        		<input type = "submit" name="submit" value ="SEARCH" />
			</div>
			<div class = "selections">
				&nbsp;&nbsp;&nbsp;
				<label for="Title">Title</label>
				<input type="radio" name="type" id="type" value="Title" checked = "checked" style="margin-right: 20vw">
				&nbsp;
				<label for="ISBN">ISBN</label>
				<input type="radio" name="type" id="type" value="ISBN"><br>
				<label for="Author">Author</label>
				<input type="radio" name="type" id="type" value="Author" style="margin-right: 20vw">
				<label for="Genre">Genre</label>
				<input type="radio" name="type" id="type" value="Genre"><br>
			</div>
			<div class = "gif">
			<img src="search-button.gif" />
			</div>
		</form>
		<form method = "POST" action= "signup.jsp" name = "myforms" >
			<div class = "signup">
			<input type = "image" id = "signup" name="image" value ="SIGN UP" src = "signup.png"/>
			</div>
			</form>
		<form method = "POST" action= "login.jsp" name = "myforml" >
			<div class = "login">
			<input type = "image" id ="login" name="image" value ="LOGIN" src = "login.png"/>
			</div>
			</form>
	</body>
</html>