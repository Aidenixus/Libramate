<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LibraMate</title>
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
<link rel="stylesheet" type="text/css" href="searchu.css" />
</head>
<body>
		<div id="content"></div>
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
		<a href = "searchuu.jsp"><img src="book.png" /></a>
		</div>
    <script>
    function handleResponse(response) {
    	var contentString = "";
      for (var i = 0; i < response.items.length; i++) {
        var item = response.items[i];
        var title = item.volumeInfo.title;
        var authors = item.volumeInfo.authors; // remember that this is an arraylist
        var authorlist = "";
        if (authors == undefined)
        	{
        		authors = "";
        		authorlist = "";
        	}
        else
        	{
        		for (var j = 0; j < authors.length; j++)
        		{
        			if(j != 0){
            			authorlist += "-";}
        				authorlist += authors[j];
        		}
        	}
         var publisher = "";
         publisher = item.volumeInfo.publisher; // it doesn't work to replace space with "", because some books don't have publisher
         var description = "";
         description = item.volumeInfo.description;
         var img = "";
        if (item.volumeInfo.imageLinks == undefined)
        	{
        		img = "content.png;"
        	}
        else
        	{
        		img = item.volumeInfo.imageLinks.thumbnail;
        	} 
        var rating = item.volumeInfo.averageRating;
        if (title == undefined)
        	{
        		title = "";
        	}
        
        title =title.replace(/ /g,"+");
        authorlist = authorlist.replace(/ /g,"+");
        if (publisher != undefined){
        publisher =publisher.replace(/ /g,"+");}
        else
        	{
        		publisher = "";
        	}
        if (description == undefined)
        	{
        		description = "";
        	}
        else
        	{
        		description =description.replace(/ /g,"+");}
        img = img.replace(/&/g,"*");
        if (rating == undefined){
        	rating = 0;
        }
      /*   window.alert(title);
        window.alert(authorlist);
        window.alert(publisher);
        window.alert(description);
        window.alert(img);
        window.alert(rating); */
        // in production code, item.text should have the HTML entities escaped.
        var imgAccess = img.replace(/\*/g,"&");
        imgAccess = imgAccess.replace(/\+/g,"&");
       // window.alert(title);
        var titleAccess = "";
        titleAccess = title.replace(/\+/g," ");
        //window.alert(titleAccess);
        var authorAccess = "";
        authorAccess = authorlist.replace(/\-/g,",");
        authorAccess = authorAccess.replace(/\+/g," ");
        if (authorAccess == "")
        	{
        		authorAccess = "Author Unavailable";
        	}
        else
        	{
        	authorAccess = "by " + authorAccess;
        	}
        if (i == 0)
        {
        	 contentString += "<table style='width=100%'>";
        }
        if (i%4 == 0)
        	{
        		contentString += "<tr>";
        	}
        contentString += "<td valign='top'><a href=detailu.jsp?title="
        		+ title + "&authors=" + authorlist + "&publisher=" + publisher
        		+ "&description=" + description + "&img=" + img
        		+ "&rating=" + rating + "&profilelink=" + "<%=session.getAttribute("user")%>" + ">" + "<br><img src=\"" + imgAccess+"\">";
        contentString += "<br>" + "<span>" + titleAccess + "<\span>";
        contentString += "<br>" + "<span class='bigger_font'>" + authorAccess + "<\span>" + "</td>";
        if (i%4 == 3)
    	{
    		contentString += "</tr>";
    		console.log("endrow");
    	}
        if (i == response.items.length - 1){
        	console.log("end");
        	contentString += "</table>";
        }
      }
      document.getElementById("content").innerHTML = contentString;

    }
    </script>
    <!-- code below isn't really needed, but for reference and future probable use of json. -->
    
    <script src=<%= session.getAttribute("json") %>></script>
    
    <form action = "profileServlet">
    <div class = "profilep">
    	<input type="image" id = "image" name="profile" value= <%= session.getAttribute("user") %> src= <%= session.getAttribute("user") %> />
    </div>
    </form>
    
    
  
</body>
</html>