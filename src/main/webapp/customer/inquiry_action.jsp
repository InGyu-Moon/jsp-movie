<%@page import="data.inform.inquiry.InquiryDto"%>
<%@page import="data.inform.inquiry.InquiryDao"%>
<%@page import="data.inform.inquiry.InquiryOption"%>
<%@page import="data.user.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	InquiryDao dao = new InquiryDao();
	InquiryDto dto = new InquiryDto();

	String optionStr = request.getParameter("category");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String attachment = request.getParameter("file");
	String memberId = (String) session.getAttribute("memberId");

	System.out.println(optionStr);
	System.out.println(title);
	System.out.println(content);
	System.out.println(attachment);
	System.out.println(memberId);

	dto.setMemberId(Integer.parseInt(memberId)); // String을 int로 변환하여 설정
	dto.setOption(optionStr);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setAttachment(attachment);

	dao.Inquiry_insert(dto);

	response.sendRedirect("inquiry.jsp");
	%>
</body>
</html>
