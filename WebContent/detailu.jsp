<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>LibraMate</title>
		<link rel="stylesheet" type="text/css" href="detailu.css" />
		<script>
		function myFunction() {
		    document.getElementById("myDropdown").classList.toggle("show");
		}
		window.onclick = function(event) {
		  if (!event.target.matches('.dropbtn')) {

		    var dropdowns = document.getElementsByClassName("dropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		  }
		}
		
		</script>
	</head>
	<body>
		<div class="dropdown">
 			<button onclick="myFunction()" class="dropbtn">Add To Library</button>
  			<div id="myDropdown" class="dropdown-content">
  			<form action="addbook">
    		<input type="submit" name = "type" id = "ok" value="Read" />
    		<input type="submit" name = "type" id = "ok" value="Favorite" />
    		<input type = "text" name = "bookname" id = "bookname" value= "ok" style="visibility:hidden;"/>
    		<input type = "text" name = "profilename" id = "profilename" value= "ok" style="visibility:hidden;"/>
    		<input type = "text" name = "url" id = "url" value = "ok" style="visibility:hidden;"/>
    		</form>
  </div>
		</div>
	
		<div class = "textinfo">
			<p id="title"></p>
			<p id="authors"></p>
			<div class = "publisher">
				<span id="publisher1"></span>
				<span id="publisher2"></span>
			</div>
			<div class ="description">
				<p id="description1"></p>
				<span id="description2"></span>
			</div>
			<div class ="rating">
				<p id="rating1"></p>
				<p id="rating2"></p>
				<p id="rating3"></p>
			</div>
		</div>
		
		<p id="img"></p>
		
		<div class = "b">
		</div>
		<div class="header">
		<a href="home.jsp">LibraMate</a></div>
		
	<form method = "POST" action= "generalServlet" name = "myform">
			<div class="search_bar">
        		<input type="text" name="text" placeholder = "Search" id = "text" />
        		<span style="color: red;font-weight:bold">${search_err!=null? search_err : ''}</span>
        		<input type = "submit" name="submit" value ="SEARCH" />
			</div>
			<div class = "selections">
				<label for="Title">Title</label>
				<input type="radio" name="type" id="type" value="Title" checked = "checked">
				<label for="ISBN">ISBN</label>
				<input type="radio" name="type" id="type" value="ISBN"><br>
				<label for="Author">Author</label>
				<input type="radio" name="type" id="type" value="Author">
				<label for="Genre">Genre</label>
				<input type="radio" name="type" id="type" value="Genre"><br>
			</div>
			<div class = "gif">
		<a href = "searchuu.jsp"><img src="book.png" /></a>
		</div>
		</form>
		<form action = "profileServlet">
    <div class = "profilep">
    	<input type="image" id = "image" name="profile" value= "OK" src= "OK" />
    </div>
    </form>
		 <!-- need to be stars -->
		<script>
		let params = (new URL(document.location)).searchParams;
		let title = params.get("title"); // string now
		let authors = params.get("authors");
		let publisher = params.get("publisher");
		let description = params.get("description");
		let img = params.get("img");
		let rating = params.get("rating");
		let link = params.get("profilelink");
		img = img.replace(/\*/g,"&");
		authors = authors.replace(/\-/g,",");
		document.getElementById("title").innerHTML = title;
		document.getElementById("publisher1").innerHTML = "Publisher: ";
		document.getElementById("publisher2").innerHTML = publisher;
		document.getElementById("description1").innerHTML = "Description: "
		document.getElementById("description2").innerHTML = description;
		document.getElementById("img").innerHTML = "<br><img src=\"" +img+ "\">";
		document.getElementById("rating1").innerHTML = "Rating: ";
		document.getElementById("rating3").innerHTML = rating;
		document.getElementById("bookname").value = title;
		document.getElementById("profilename").value = link;
		document.getElementById("image").value = link;
		document.getElementById("image").src = link;
		document.getElementById("url").value = window.location.href;
		if (title == "")
			{
			document.getElementById("title").innerHTML = "Title Unavailable";
			}
		if (authors == "")
			{
			document.getElementById("authors").innerHTML = "Author Unavailable";
			}
		else
			{
				document.getElementById("authors").innerHTML = "By " + authors;
			}
		if (publisher == "")
			{
			var notification = "Unavailable";
			document.getElementById("publisher2").innerHTML += notification;
			}
		
		if (description == "")
			{
			var notification = "Unavailable";
			document.getElementById("description2").innerHTML += notification;
			}
		var count = 0;
		if (rating == 0)
			{
				var notification = "Unavailable";
				document.getElementById("rating2").innerHTML += notification;
			}
		else
			{
			for (var i = 1; i <= rating; i++)
				{
				document.getElementById("rating2").innerHTML += "<img src=\"" +"f.gif"+ "\">";
				document.getElementById("rating2").innerHTML += "&nbsp";
				count = i;
				}
			if (count != rating)
				{
				document.getElementById("rating2").innerHTML += "<img src=\"" +"h.png"+ "\">";
				}
			}
		</script>
	</body>
</html>