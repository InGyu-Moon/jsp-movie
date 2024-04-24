<%@page import="data.user.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<meta charset="UTF-8">
	<title>loginAction</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String userName = request.getParameter("username");
	String password = request.getParameter("password");

	MemberDao dao = new MemberDao();
	boolean loginCheck = dao.isCheckLogin(userName, password);

	if(loginCheck){
		// 로그인 성공 시
		HttpSession loginSession = request.getSession(); // 세션 생성
		loginSession.setAttribute("username", userName); // id 세션
		int memberIdByUsername = dao.getMemberIdByUsername(userName);
		String memberId = String.valueOf(memberIdByUsername);
		loginSession.setAttribute("memberId", memberId); // memberId 세션

		loginSession.setMaxInactiveInterval(30*60); // 30분

		// 메인으로 이동
		response.sendRedirect("../index.jsp");
	} else{
		// 로그인 실패 시 메시지 출력
%>
<script>
	alert("로그인 실패. 아이디 또는 비밀번호를 확인하세요.");
	window.history.back(); // 이전 페이지로 이동
</script>
<%
	}
%>
</body>
</html>