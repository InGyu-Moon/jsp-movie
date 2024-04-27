<%@page import="data.inform.inquiry.InquiryDao"%>
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
System.out.println("삭제 페이지 옴");
//nums 얻기
String nums = request.getParameter("nums");

//,로 분리해서 배열선언
String [] num = nums.split(",");

//배열의 갯수만큼 delete
InquiryDao dao = new InquiryDao();
for(String n:num){
	dao.deleteAnswer(Integer.parseInt(n));
}

//목록으로 이동
response.sendRedirect("myInquiry.jsp");
%>
</body>
</html>