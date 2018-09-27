package object;


import java.io.FileNotFoundException;
import java.io.FileWriter;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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

/**
 * Servlet implementation class myFirstServlet
 */
@WebServlet("/signupv")
public class signupv extends HttpServlet {
	roster r;
	private static final long serialVersionUID = 1L;
       
    /**
     * @throws FileNotFoundException 
     * @see HttpServlet#HttpServlet()
     */
    public signupv() throws FileNotFoundException {
        super();
        
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
//		Gson g = new Gson();
//		FileReader fr;
//		BufferedReader br;
		String jsonName = "Assignment3.json";
		String path = getServletContext().getRealPath(jsonName);
		
//		fr = new FileReader(path);
//		br = new BufferedReader(fr);
		test t = new test(path);
		
		roster r = t.getR();
		String next = "";
		String username = request.getParameter("username");
		String pw = request.getParameter("pw");
		String imgurl = request.getParameter("imageurl");
		username = username.trim();
		pw = pw.trim();
		if (username.equals("") || pw.equals("") || imgurl.equals("")) {
		if (username.equals(""))
		{
			next = "/signup.jsp";
			request.setAttribute("uerror", "No Username Entered");
			//System.out.println("U empty");
		}
		if (pw.equals(""))
		{
			next = "/signup.jsp";
			request.setAttribute("perror", "No Password Entered");
			//System.out.println("P empty");
		}
		if (imgurl.equals(""))
		{
			next = "/signup.jsp";
			request.setAttribute("ierror", "No ImageURL Entered");
			//System.out.println("P empty");
		}
		}
		else
		{
			int check = r.VerifyE(username);
			if (check == 1)
			{
				next = "/signup.jsp";
				request.setAttribute("uerror", "Username Taken");
			}
			else
			{
				next = "/searchulogin.jsp";
				response.setContentType("text/html");
				List <String> empty = new ArrayList<String>();
				User user = new User(username, pw, imgurl, empty,
						empty, empty, empty);
				r.addUser(user);
				Writer writer = new FileWriter(getServletContext().getRealPath(jsonName));
				Gson gson = new GsonBuilder().create();
				gson.toJson(r, writer);
				writer.flush();
				String actual = "/Users/aidensong/Documents/Academia/Fourth Semester (Summer)/CSCI201/Projects/Assignment3_S/WebContent/Assignment3.json";
				t.save(actual);
				HttpSession session=request.getSession();
		        session.setAttribute("user",imgurl);
			}
		}
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request, response);
}}
