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
@WebServlet("/loginv")
public class loginv extends HttpServlet {
	roster r;
	private static final long serialVersionUID = 1L;
       
    /**
     * @throws FileNotFoundException 
     * @see HttpServlet#HttpServlet()
     */
    public loginv() throws FileNotFoundException {
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
		username = username.trim();
		pw = pw.trim();
		String url = "";
		if (username.equals("") || pw.equals("")) {
		if (username.equals(""))
		{
			next = "/login.jsp";
			request.setAttribute("uerror", "No Username Entered");
		}
		if (pw.equals(""))
		{
			next = "/login.jsp";
			request.setAttribute("perror", "No Password Entered");
		}
		}
		else
		{
			int check = r.Verify(username, pw);
			if (check == 0)
			{
				next = "/login.jsp";
				request.setAttribute("uerror", "Username or Password wrong");
				request.setAttribute("perror", "Username or Password wrong");
			}
			else
			{
				next = "/searchulogin.jsp";
				response.setContentType("text/html");
				User user = r.Return(username);
				url = user.getImageURL();
				HttpSession session=request.getSession();
		        session.setAttribute("user",url);// maybe make url a list of +++
		        // and then parse it?
				//right, i can only set attribute of the imgurl, and the image will
		        //display, and when i click image, i can use getimage to track the user
		        // and get into the profile page by parsing the profile page
		        
			}
		}
		HttpSession session=request.getSession();
        session.setAttribute("user",url);
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request, response);
}}
