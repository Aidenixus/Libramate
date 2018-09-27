<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LibraMate</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="profile.css" />

</head>
<body>

		
<div class = "name"> @<%= session.getAttribute("username") %></div>
    <div class = "user"> 
    <img src = <%= session.getAttribute("imageurl") %> />
    </div>
    
    <div id = "follower" class = "tabcontent"> Followers:
    <% 
    	ArrayList<String> followerlist;
    	followerlist = (ArrayList<String>)session.getAttribute("follower");
    	for (int i = 0; i < followerlist.size(); i++)
    	{
    		%>
    		<br>
    		<%= followerlist.get(i) %>
    		<br>
    		<%
    	}
    	 %>
    </div>
    <div id = "following" class = "tabcontent"> Following:
    <% 
    	ArrayList<String> followinglist;
    	followinglist = (ArrayList<String>)session.getAttribute("following");
    	for (int i = 0; i < followinglist.size(); i++)
    	{
    		%>
    		<br>
    		<%= followinglist.get(i) %>
    		<br>
    		<%
    	}
    	 %>
    </div>
    <div class = "reading" > Reading:
    	 
    </div>
    <div class = "favi" > Favorite:
    	 
    </div>
    <div class = "libraryname" id = "libraryname"> <%= session.getAttribute("username") %> 's Library</div>
		<div class="tab">
  <button class="tablinks" onclick="openFo(event, 'follower')" id="defaultOpen">follower</button>
  <button class="tablinks" onclick="openFo(event, 'following')">following</button>
  </div>
		<div class = "b">
		</div>
		
		
		<div class="header">
		<a href="home.jsp">LibraMate</a></div>
		
		
		
	<form method = "POST" action= "uServlet" name = "myform" onsubmit = "return validate();">
			<div class="search_bar">
        		<input type="text" name="text" placeholder = "Search" id = "text" /> <div id = "terror" ></div>
        		<span style="color: red;font-weight:bold">${search_err!=null? search_err : ''}</span>
        		<input type = "submit" name="submit" value ="SEARCH" />
			</div>
			<div class = "selections">
				<label for="Title" id = "type1">Title</label>
				<input type="radio" name="type" id="type2" value="Title" checked = "checked">
				<label for="ISBN" id = "type3">ISBN</label>
				<input type="radio" name="type" id="type4" value="ISBN"><br>
				<label for="Author" id = "type5">Author</label>
				<input type="radio" name="type" id="type6" value="Author">
				<label for="Genre" id = "type7">Genre</label>
				<input type="radio" name="type" id="type8" value="Genre"><br>
			</div>
			<div class = "hiddenimgsrc">
				<input type="text" name="user" value = <%= session.getAttribute("user") %> id = "user" />
			</div>
		</form>
		<div class = "gif">
		<a href = "searchu.jsp"><img src="user.png" /></a>
		</div>
   <form action = "profileServlet">
    <div class = "profilep">
    	<input type="image" id = "image1" name="profile" value= <%= session.getAttribute("userOld") %> src= <%= session.getAttribute("userOld") %> />
    </div>
    </form>
    
    <form action = "followServlet">
    <div class = "followbutton">
    	<input type="image" id = "image" name="follow" value= "follow" src= "follow.png" />
    	<input type="text" id = "follower" name="followername" value =  <%= session.getAttribute("userOldName") %> style="visibility:hidden;" />
    	<input type="text" id = "followed" name="followedname" value = <%= session.getAttribute("username") %> style="visibility:hidden;"/>
    	<input type="text" id = "userOld" name="userOld" value = <%= session.getAttribute("userOld") %> style="visibility:hidden;"/>
    </div>
    </form>
    
</body>
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
		<% ArrayList<String> fav1 = (ArrayList<String>)session.getAttribute("fav");%>
		var author = [];
		var image = [];
		var title = [];
		<% for (int i = 0 ; i < fav1.size(); i++) 
		{ %>
			$.ajax({
				url: "https://www.googleapis.com/books/v1/volumes?maxResults=12&q=intitle:" + "<%=fav1.get(i)%>",
				success: function(data){
					author[<%=i%>] = data.items[0].volumeInfo.authors[0];
					image[<%=i%>] = data.items[0].volumeInfo.imageLinks.thumbnail;
					title[<%=i%>] = data.items[0].volumeInfo.title;
				},
				async: false,
			});
		
		<% } %>
		var contentString = "";
		console.log(image);
		for (var i = 0; i < author.length; i++){
			if (i == 0)
	        {
	        	 contentString += "<table style='width=100%'>";
	        }
	        if (i%3 == 0)
	        	{
	        		contentString += "<tr>";
	        	}
	        contentString += "<td valign='top'>" + "<img src = '" + image[i] + "'/><br>"+"<h3>" + title[i] + "<h3>" + "<h4>"+author[i]+"<\h4>";
	        if (i%3 == 2)
	    	{
	    		contentString += "</tr>";
	    		console.log("endrow");
	    	}
	        if (i == author.length - 1){
	        	console.log("end");
	        	contentString += "</table>";
	        }
	      }

		
		console.log(document.getElementsByClassName("favi")[0]);
		document.getElementsByClassName("favi")[0].innerHTML += contentString;
		
		<% ArrayList<String> red1 = (ArrayList<String>)session.getAttribute("reading");%>
		var author = [];
		var image = [];
		var title = [];
		<% for (int i = 0 ; i < red1.size(); i++) 
		{ %>
			$.ajax({
				url: "https://www.googleapis.com/books/v1/volumes?maxResults=12&q=intitle:" + "<%=red1.get(i)%>",
				success: function(data){
					author[<%=i%>] = data.items[0].volumeInfo.authors[0];
					image[<%=i%>] = data.items[0].volumeInfo.imageLinks.thumbnail;
					title[<%=i%>] = data.items[0].volumeInfo.title;
				},
				async: false,
			});
		
		<% } %>
		var contentString = "";
		console.log(image);
		for (var i = 0; i < author.length; i++){
			if (i == 0)
	        {
	        	 contentString += "<table style='width=100%'>";
	        }
	        if (i%3 == 0)
	        	{
	        		contentString += "<tr>";
	        	}
	        contentString += "<td valign='top'>" + "<img src = '" + image[i] + "'/><br>"+"<h3>" + title[i] + "<h3>" + "<h4>"+author[i]+"<\h4>";
	        if (i%3 == 2)
	    	{
	    		contentString += "</tr>";
	    		console.log("endrow");
	    	}
	        if (i == author.length - 1){
	        	console.log("end");
	        	contentString += "</table>";
	        }
	      }

		
		console.log(document.getElementsByClassName("favi")[0]);
		document.getElementsByClassName("reading")[0].innerHTML += contentString;

		function openFo(evt, fotype) {
		    // Declare all variables
		    var i, tabcontent, tablinks;

		    // Get all elements with class="tabcontent" and hide them
		    tabcontent = document.getElementsByClassName("tabcontent");
		    for (i = 0; i < tabcontent.length; i++) {
		        tabcontent[i].style.display = "none";
		    }

		    // Get all elements with class="tablinks" and remove the class "active"
		    tablinks = document.getElementsByClassName("tablinks");
		    for (i = 0; i < tablinks.length; i++) {
		        tablinks[i].className = tablinks[i].className.replace(" active", "");
		    }

		    // Show the current tab, and add an "active" class to the button that opened the tab
		    document.getElementById(fotype).style.display = "block";
		    evt.currentTarget.className += " active";
		}
		document.getElementById("defaultOpen").click();
		
</script>
</html>