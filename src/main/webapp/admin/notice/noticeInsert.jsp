<%@ page import="data.inform.notice.NoticeDao" %>
<%@ page import="data.inform.notice.NoticeDto" %>
<%@ page import="data.inform.notice.Category" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");

   String category = request.getParameter("category");
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   content=content.replace("\r\n","<br>");

   NoticeDao noticeDao = new NoticeDao();

   NoticeDto noticeDto = new NoticeDto();
   noticeDto.setCategory(Category.valueOf(category));
   noticeDto.setTitle(title);
   noticeDto.setContent(content);

   noticeDao.insertNotice(noticeDto);
   response.sendRedirect("../adminMainPage.jsp?curr=notice/noticeMain.jsp");
%>
</body>
</html>