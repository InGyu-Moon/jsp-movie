<%@page import="data.inform.faq.FaqDao"%>
<%@page import="data.inform.faq.FaqDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<%
	request.setCharacterEncoding("utf-8");
	
	int faqId = Integer.parseInt(request.getParameter("faqId"));
	
	System.out.println("faqId " + faqId);
	
	String category = request.getParameter("category");
	String question = request.getParameter("question");
	String answer = request.getParameter("answer");
	answer = answer.replace("\r\n", "<br>");
	
	FaqDto faq = new FaqDto();
	faq.setFaqId(faqId);
	faq.setCategory(category);
	faq.setQuestion(question);
	faq.setAnswer(answer);
	
	FaqDao dao = new FaqDao();
	dao.updateFaq(faq);
	
	response.sendRedirect("../adminMainPage.jsp?curr=faq/faqMain.jsp");
%>
