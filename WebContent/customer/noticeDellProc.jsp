<%@page import="com.newlecture.jspprj.dao.jdbc.JdbcNoticeDao"%>
<%@page import="com.newlecture.jspprj.model.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String code = request.getParameter("c");
	
	JdbcNoticeDao noticeDao = new JdbcNoticeDao();
	noticeDao.delete(code);
	
	response.sendRedirect("notice.jsp");
	//response.sendRedirect("noticeDetail.jsp?c="+code);
	
	/* String url= String.format("noticeDetail.jsp?c=%s",notice.getCode());
	response.sendRedirect(url); */
	
%>