<%@ page import="data.inform.notice.NoticeDao" %>
<%@ page import="data.inform.notice.NoticeDto" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
<%
    String id = request.getParameter("noticeId");
    NoticeDao noticeDao = new NoticeDao();
    NoticeDto noticeDto = noticeDao.getNoticeById(id);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<h2 style="margin-bottom: 50px">공지사항 상세</h2>
<hr style="margin-bottom: 30px">

<div>
    <div style="display: flex; margin-bottom: 40px">
        <span style="font-size: 30px; width: 50%"><%=noticeDto.getTitle()%></span>
        <span style="margin-right: 30px"><strong>분류: </strong><%=noticeDto.getCategory()%></span>
        <span style="margin-right: 30px"><strong>조회수: </strong><%=noticeDto.getViewCount()%></span>
        <span style=""><strong>등록일: </strong><%=sdf.format(noticeDto.getRegisteredDate())%></span>
    </div>
    <div>
        <%=noticeDto.getContent()%>
    </div>
    <div style="display: flex;">
        <a style="margin-left: 60%;margin-right: 10px" type="button" class="btn btn-outline-primary" href="/admin/adminMainPage.jsp?curr=notice/noticeUpdateForm.jsp?noticeId=<%=noticeDto.getNoticeId()%>">수정</a>
<%--        <a style="margin-right: 10px" type="button" class="btn btn-outline-danger" href="notice/noticeDelete.jsp?noticeId=<%=noticeDto.getNoticeId()%>">삭제</a>--%>
        <a style="margin-right: 10px" type="button" class="btn btn-outline-danger" href="#"
           onclick="return confirm('정말로 삭제하시겠습니까?') ? window.location.href = 'notice/noticeDelete.jsp?noticeId=<%=noticeDto.getNoticeId()%>' : false;">삭제</a>

        <button class="btn btn-outline-success" onclick="history.back()">목록</button>
    </div>
</div>




</body>
</html>