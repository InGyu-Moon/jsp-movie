<%@page import="data.user.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int memberId = Integer.parseInt(request.getParameter("memberId"));
	System.out.println(memberId);
	MemberDao dao = new MemberDao();
	
	dao.deleteMember(memberId);
    
	response.sendRedirect("../log/logoutAction.jsp");
	
%>
</body>
</html>