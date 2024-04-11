<%@ page import="data.inform.notice.NoticeDao" %>
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
    String noticeIds = request.getParameter("noticeId");

    // ,로 분리해서 배열선언
    String[] noticeIdStrings = noticeIds.split(",");
    // 배열의 갯수만큼 delete
    NoticeDao noticeDao = new NoticeDao();
    for (String noticeId : noticeIdStrings) {
        noticeDao.deleteNotice(noticeId);
    }


    response.sendRedirect("../adminMainPage.jsp?curr=notice/noticeMain.jsp");

%>>
</body>
</html>