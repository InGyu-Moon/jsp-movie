<%@page import="data.inform.inquiry.InquiryDto"%>
<%@page import="data.inform.inquiry.InquiryDao"%>
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

String inquiry_option = request.getParameter("category");
String title = request.getParameter("title");
String content = request.getParameter("content");
String attachment = request.getParameter("file");
System.out.println(inquiry_option);
System.out.println(title);
System.out.println(content);
System.out.println(attachment);

dto.setInquiry_option(inquiry_option);
dto.setTitle(title);
dto.setContent(content);
dto.setAttachment(attachment);


dao.Inquiry_insert(dto);

response.sendRedirect("inquiry.jsp");
%>
</body>
</html>