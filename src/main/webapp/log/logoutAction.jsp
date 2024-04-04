<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
	// 회원 아이디/비밀번호 세션 삭제
	session.removeAttribute("username");
	session.removeAttribute("password");
	
	// 비회원 인증코드/비밀번호 세션 삭제
	session.removeAttribute("verificationCode");
	session.removeAttribute("nonPassword");
	
	response.sendRedirect("../index.jsp");
%>
</body>
</html>