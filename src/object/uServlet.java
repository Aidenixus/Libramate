package object;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class myFirstServlet
 */
@WebServlet("/uServlet")
public class uServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uServlet() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String text = request.getParameter("text"); //parameter between the "" has to match perfectly
		String type = request.getParameter("type");
		text = text.trim();
		text = text.replaceAll(" ", "+");
			 // set an error checking, if there's space entered
			String url = "";
			String next = "";
			if (text == "")
			{
				next = "/home.jsp";
				request.setAttribute("search_err", "");
			}
			else {
				response.setContentType("text/html"); //text/json, it's telling the browser what to render
				// if statement doesn't work. Why?
				if (type.equals("Title")) {
					url = "https://www.googleapis.com/books/v1/volumes?maxResults=12&q=intitle:" + text +"&callback=handleResponse";}
				else if (type.equals("ISBN")) {
					url = "https://www.googleapis.com/books/v1/volumes?maxResults=12&q=isbn:" + text +"&callback=handleResponse";}
				else if (type.equals("Author")) {
					url = "https://www.googleapis.com/books/v1/volumes?maxResults=12&q=inauthor:" + text +"&callback=handleResponse";}
				else if (type.equals("Genre")) {
					url = "https://www.googleapis.com/books/v1/volumes?maxResults=12&q=subject:" + text +"&callback=handleResponse";}
				HttpSession session=request.getSession();  
		        session.setAttribute("json",url);  
		        String user = request.getParameter("user");
		        session.setAttribute("user",user); 
				next = "/searchu.jsp";
			}
			HttpSession session=request.getSession();  
	        session.setAttribute("json",url);
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
			dispatch.forward(request, response);
		
	}

}
