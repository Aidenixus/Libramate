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
@WebServlet("/profileServleto")
public class profileServleto extends HttpServlet {
	roster r;
	private static final long serialVersionUID = 1L;
       
    /**
     * @throws FileNotFoundException 
     * @see HttpServlet#HttpServlet()
     */
    public profileServleto() throws FileNotFoundException {
        super();
        
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String jsonName = "Assignment3.json";
		String path = getServletContext().getRealPath(jsonName);
		test t = new test(path);
		
		roster r = t.getR();
		String next = "/profileOthers.jsp";
		String username = request.getParameter("username");
		String userOld = request.getParameter("img");
		System.out.println(userOld);
		System.out.println(username);
		User user = r.getUserByUsername(username);
		String userOldName = r.getUserByLink(userOld).getUsername();
		HttpSession session=request.getSession();
		session.setAttribute("userOldName", userOldName);
		session.setAttribute("userOld", userOld);
        session.setAttribute("username",user.getUsername());
        session.setAttribute("imageurl", user.getImageURL() );
        session.setAttribute("user", user.getImageURL() );
        session.setAttribute("follower", user.getFollowers() );
        session.setAttribute("following", user.getFollowing() );
        session.setAttribute("fav", user.getLibrary().getFavorite());
        session.setAttribute("reading", user.getLibrary().getReading());
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request, response);
}}
