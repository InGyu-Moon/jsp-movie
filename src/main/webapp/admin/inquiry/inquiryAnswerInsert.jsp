<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.inform.inquiry.InquiryDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	//System.out.println("Inquiry ID: " + request.getParameter("inquiryId"));
	String Id = request.getParameter("id");

	if(Id != null) {
		int inquiryId = Integer.parseInt(Id);
		System.out.println("Inquiry ID: " + inquiryId);
		String answer = request.getParameter("answer");
		
		System.out.println("1:1 문의 답변 insert id : "+inquiryId);
		
		InquiryDao dao = new InquiryDao();
		dao.insertAnswer(inquiryId, answer);
		
		response.sendRedirect("../adminMainPage.jsp?curr=inquiry/inquiryMain.jsp");
	} else{
		
		System.out.println("넘어온 inquiryId가 없음");
		//response.sendRedirect("../adminMainPage.jsp?curr=inquiry/inquiryMain.jsp");
	} 
	%>
	<!-- ----------------------------------------------------------------------------------------------------- -->
	<%-- <%
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("test");

	System.out.println(realFolder);

	int fileSize = 1024 * 1024 * 5;

	MultipartRequest multi = null;

	try {
		multi = new MultipartRequest(request, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());

		int inquiryId = Integer.parseInt(multi.getParameter("id"));
		String answer = multi.getParameter("answer");

		System.out.println("1:1 문의 답변 insert id : " + inquiryId);

		InquiryDao dao = new InquiryDao();
		dao.insertAnswer(inquiryId, answer);

		response.sendRedirect("../adminMainPage.jsp?curr=inquiry/inquiryMain.jsp");

	} catch (Exception e) {

	}
	%> --%>
</body>
</html>