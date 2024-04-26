<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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