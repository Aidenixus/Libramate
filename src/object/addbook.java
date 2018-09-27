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
@WebServlet("/addbook")
public class addbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addbook() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsonName = "Assignment3.json";
		String path = getServletContext().getRealPath(jsonName);
		test t = new test(path);
		roster r = t.getR();
		String next = "";
		String bookname = request.getParameter("bookname");
		String profilelink = request.getParameter("profilename");
		String type = request.getParameter("type");
		next = request.getParameter("url");
		User user = r.getUserByLink(profilelink);
		if (type.equals("Read"))
		{
			user.addRead(bookname);
		}
		else
		{
			user.addFavorite(bookname);
		}
		r.update(user);
		Writer writer = new FileWriter(getServletContext().getRealPath(jsonName));
		Gson gson = new GsonBuilder().create();
		gson.toJson(r, writer);
		writer.flush();
		String actual = "/Users/aidensong/Documents/Academia/Fourth Semester (Summer)/CSCI201/Projects/Assignment3_S/WebContent/Assignment3.json";
		t.save(actual);
		response.sendRedirect(next);
	}

}
