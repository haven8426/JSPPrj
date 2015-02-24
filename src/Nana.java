import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/nana")
public class Nana extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse response)
		throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//OutputStream os = response.getOutputStream();
		//PrintWriter out = new PrintWriter(os,true);
		//http://localhost/JSPPrj/Nana?cnt=10
		String _cnt = req.getParameter("cnt");
		
	    int cnt=100;
	    
	    if(_cnt != null)
	    	cnt=Integer.parseInt(_cnt);
		
		PrintWriter out = response.getWriter();
		for(int i=0; i<cnt; i++){
			out.println((i+1)+ "  " +"¾È³ç Servlet!!<br />");
		}
		
	}
 
	
}
