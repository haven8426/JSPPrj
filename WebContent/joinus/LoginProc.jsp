<%@page import="com.newlecture.jspprj.model.Member"%>
<%@page import="com.newlecture.jspprj.dao.jdbc.JdbcMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");

	Member m = new JdbcMemberDao().getMember(uid);

	String msg = "";
	out.print(uid);
	if (m == null) {
		msg = "아이디가 올바르지 않습니다.";
	} else if (!m.getPwd().equals(pwd)) {
		msg = "비밀번호가 올바르지 않습니다.";
	} else {
		session.setAttribute("uid", uid);
	}

	if (!msg.equals("")) 
	{
		request.setAttribute("msg", msg);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("login.jsp");

		dispatcher.forward(request, response);
	} else
		response.sendRedirect("../index.jsp");
%>

