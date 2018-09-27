package object;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class myFirstServlet
 */
@WebServlet("/unfollowServlet")
public class unfollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public unfollowServlet() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsonName = "Assignment3.json";
		String path = getServletContext().getRealPath(jsonName);
		test t = new test(path);
		roster r = t.getR();
		String next = "/profileOthers.jsp";
		String unfollowedname = request.getParameter("unfollowedname");
		String unfollowername = request.getParameter("unfollowername");
		User unfollowed = r.getUserByUsername(unfollowedname);
		User unfollower = r.getUserByUsername(unfollowername);
		unfollower.removeFollowing(unfollowedname);
		unfollowed.removeFollower(unfollowername);
		r.update(unfollower);
		r.update(unfollowed);
		Writer writer = new FileWriter(getServletContext().getRealPath(jsonName));
		Gson gson = new GsonBuilder().create();
		gson.toJson(r, writer);
		writer.flush();
		String actual = "/Users/aidensong/Documents/Academia/Fourth Semester (Summer)/CSCI201/Projects/Assignment3_S/WebContent/Assignment3.json";
		t.save(actual);
		User user = r.getUserByUsername(unfollowedname);
		String userOld = request.getParameter("userOld");
		HttpSession session=request.getSession();
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
	}

}
