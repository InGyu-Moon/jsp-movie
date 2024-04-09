<%@page import="data.inform.faq.FaqDao"%>
<%@page import="data.inform.faq.FaqDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String category = request.getParameter("category");

	String question = request.getParameter("question");
	String answer = request.getParameter("answer");
	answer=answer.replace("\r\n","<br>");

	FaqDto faq = new FaqDto();
	faq.setCategory(category);
	faq.setQuestion(question);
	faq.setAnswer(answer);

	FaqDao dao = new FaqDao();
	dao.insertFaq(faq);

	response.sendRedirect("../adminMainPage.jsp?curr=faq/faqMain.jsp");
%>