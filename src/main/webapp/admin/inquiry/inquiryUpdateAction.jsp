<%@page import="data.inform.inquiry.InquiryDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	int inquiryId = Integer.parseInt(request.getParameter("inquiryId"));
	String option = request.getParameter("inquiryOption");
	String answer = request.getParameter("answer");
	
	InquiryDao dao = new InquiryDao();
	dao.updateAnswer(inquiryId, option, answer);
	
	response.sendRedirect("../adminMainPage.jsp?curr=inquiry/inquiryMain.jsp");

%>
</body>
</html>