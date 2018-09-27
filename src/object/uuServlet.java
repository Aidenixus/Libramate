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
@WebServlet("/uuServlet")
public class uuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uuServlet() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String text = request.getParameter("text"); //parameter between the "" has to match perfectly
		text = text.trim();
		text = text.replaceAll(" ", "+");
			String jsonName = "Assignment3.json";
			String tempLoc = "tempLoc.json";
			String path = getServletContext().getRealPath(jsonName);
			test t = new test(path);
			roster r = t.getR();
			String user = request.getParameter("user");
			List<User> userfound = new ArrayList<User>();
			System.out.println("YES");
			System.out.println(text);
			if (text.equals(""))
			{
				System.out.println("YES");
			userfound = r.getUsers();
			}
			else
			{
				userfound = r.search(text);
			}
//			for (int i = 0; i < userfound.size(); i ++)
//			{
//				System.out.println(userfound.get(i).getUsername());
//			}
			//response.setContentType("text/json");
			Writer writer = new FileWriter(tempLoc);
			Gson gson = new GsonBuilder().create();
			String userslist = gson.toJson(userfound);
			writer.flush();
			HttpSession session=request.getSession();
			userslist = "handleResponse(" + userslist + ")";
			session.setAttribute("json",userslist);
	        session.setAttribute("user",user);
	        String next = "/searchuu.jsp";
	        path = getServletContext().getRealPath(jsonName); // now use this first
	        t = new test(path);
			r = t.getR();
			userfound = r.getUsers();
			for (int i = 0; i < userfound.size(); i ++)
				{
					System.out.println(userfound.get(i).getUsername());
				}
			
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
			dispatch.forward(request, response);
	}

}
