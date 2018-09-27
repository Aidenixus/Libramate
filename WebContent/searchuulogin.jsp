<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LibraMate</title>
<link rel="stylesheet" type="text/css" href="searchu.css" />
</head>
<body>
		<div id="content"></div>
		<div class = "b">
		</div>
		
		<div class="header">
		<a href="home.jsp">LibraMate</a></div>
		
	<form method = "POST" action= "uuServlet" name = "myform">
			<div class="search_bar">
        		<input type="text" name="text" placeholder = "Search" id = "text" /> <div id = "terror" ></div>
        		<span style="color: red;font-weight:bold">${search_err!=null? search_err : ''}</span>
        		<input type = "submit" name="submit" value ="SEARCH" />
			</div>
			<div class = "hiddenimgsrc">
				<input type="text" name="user" value = <%= session.getAttribute("user") %> id = "user" />
			</div>
		</form>
		<div class = "gif">
		<a href = "searchulogin.jsp"><img src="user.png" /></a>
		</div>
    <script>
      function handleResponse(response) {
    	  console.log(response);
    	  var contentString = "";
        for (var i = 0; i < response.length; i++) {
          var item = response[i];
          var username = "";
          username = item.username;
          var img = ""; // remember that this is an arraylist
          img = item.imageURL;
        if (i == 0)
        {
        	 contentString += "<table style='width=100%'>";
        }
        if (i%4 == 0)
        	{
        		contentString += "<tr>";
        	}
        contentString += "<td valign='top'><a href=profileOthers.jsp?username="
        		+ username + ">" + "<br><img src=\"" + img+"\">";
        contentString += "<br>" + "<span>" + username + "<\span>";
        if (i%4 == 3)
    	{
    		contentString += "</tr>";
    		console.log("endrow");
    	}
        if (i == response.length - 1){
        	console.log("end");
        	contentString += "</table>";
        }
      }
      document.getElementById("content").innerHTML = contentString;
    }

    </script>
    <!-- code below isn't really needed, but for reference and future probable use of json. -->
    
   <form action = "profileServlet">
    <div class = "profilep">
    	<input type="image" id = "image" name="profile" value= <%= session.getAttribute("user") %> src= <%= session.getAttribute("user") %> />
    </div>
    </form>
    
    
  
</body>
</html>