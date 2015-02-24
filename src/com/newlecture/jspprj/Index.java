package com.newlecture.jspprj;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Index")
public class Index extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		ServletContext application = req.getServletContext();
		HttpSession session = req.getSession();
		Cookie[] cookies = req.getCookies();
		String _sum = "";
		
		String _app = "0";
		String _session = "0";
		String _cookies = "0";
		
		if (application.getAttribute("sum") != null) {
			_app = application.getAttribute("sum").toString();
		}
		else if (session.getAttribute("sum") != null) {
			_session = session.getAttribute("sum").toString();
		}
		else if (cookies != null) {
			for(Cookie cookie : cookies)
			{
				if("sum".equals(cookie.getName()))
						_cookies = cookie.getValue();
			}
		}
		
		out.write("<!DOCTYPE html>");
		out.write("<html>");
		out.write("<head>");
		out.write("<meta charset=\"UTF-8\">");
		out.write("<title>Insert title here</title>");
		out.write("</head>");
		out.write("<body>");
		out.write("<p><a href=\"add\"> 계산하기 </a></p>");
		out.write("<p>마지막 계산 값 app  :" + _app+ " </p>");
		out.write("<p>마지막 계산 값 session  :" + _session + " </p>");
		out.write("<p>마지막 계산 값 cookie  :" +_cookies + " </p>");
		out.write("</body>");
		out.write("</html>");

	}
}
