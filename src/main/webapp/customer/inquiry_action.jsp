<%@page import="data.inform.inquiry.InquiryDto"%>
<%@page import="data.inform.inquiry.InquiryDao"%>
<%@page import="data.inform.inquiry.InquiryOption"%>
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
	InquiryOption option = null;
	if (optionStr != null) {
		try {
			option = InquiryOption.valueOf(optionStr);
		} catch (IllegalArgumentException e) {
			// 유효하지 않은 옵션 값이면 기본값으로 설정
			option = InquiryOption.기타;
		}
	} else {
		// optionStr이 null이면 기본값으로 설정
		option = InquiryOption.기타;
	}

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String attachment = request.getParameter("file");

	System.out.println(option);
	System.out.println(title);
	System.out.println(content);
	System.out.println(attachment);

	dto.setOption(option);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setAttachment(attachment);

	dao.Inquiry_insert(dto);

	response.sendRedirect("inquiry.jsp");
	%>
</body>
</html>
