package object;

import java.io.FileNotFoundException;


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
@WebServlet("/profileServlet")
public class profileServlet extends HttpServlet {
	roster r;
	private static final long serialVersionUID = 1L;
       
    /**
     * @throws FileNotFoundException 
     * @see HttpServlet#HttpServlet()
     */
    public profileServlet() throws FileNotFoundException {
        super();
        
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String jsonName = "Assignment3.json";
		String path = getServletContext().getRealPath(jsonName);
		test t = new test(path);
		
		roster r = t.getR();
		String next = "/profile.jsp";
		String userimglink = request.getParameter("profile");
		User user = r.getUserByLink(userimglink);
		System.out.println(user.getUsername());
		HttpSession session=request.getSession();
        session.setAttribute("username",user.getUsername());
        session.setAttribute("imageurl", user.getImageURL() );
        session.setAttribute("user", userimglink );
        session.setAttribute("follower", user.getFollowers() );
        session.setAttribute("following", user.getFollowing() );
        session.setAttribute("fav", user.getLibrary().getFavorite());
        session.setAttribute("reading", user.getLibrary().getReading());
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request, response);
}}
