<%@ page import="data.inform.notice.NoticeDto" %>
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
<%
    NoticeDao noticeDao = new NoticeDao();

    String noticeId = request.getParameter("noticeId");
    NoticeDto noticeDto = noticeDao.getNoticeById(noticeId);
    noticeDto.setContent(noticeDto.getContent().replace("<br>","\r\n"));

%>
<body>

<div class="center">
    <div class="container-rightside" style="width: 80%;">
        <h2 style="margin-bottom: 50px">공지사항 수정</h2>
        <hr style="margin-bottom: 30px">
        <div class="container">
            <form action="notice/noticeUpdateAction.jsp" method="post">
                <input value="<%=noticeId%>" name="noticeId" hidden="hidden">
                <div class="row mb-3">
                    <label for="title" class="col-sm-1 col-form-label"><strong>구분</strong></label>
                    <div class="col-sm-2">
                        <select class="form-select" aria-label="Default select example" name="category" id="categorySelect">
                            <option value="전체">전체</option>
                            <option value="영화관">영화관</option>
                            <option value="이벤트">이벤트</option>
                            <option value="혜택">혜택</option>
                        </select>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="title" class="form-label"><strong>공지사항 제목</strong></label>
                    <input type="text" class="form-control" id="title"
                           name="title" maxlength="100" required="required" placeholder="공지사항 제목 작성" value="<%=noticeDto.getTitle()%>"
                           pattern=".{4,100}">
                    <!-- pattern=".{4,100}" : 4글자 이상 100글자 이하 -->
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label"><strong>공지사항 내용</strong></label>
                    <textarea class="form-control" rows="5" id="content" name="content" placeholder="공지사항 내용 작성"><%=noticeDto.getContent()%></textarea>
                </div>
                <button style="margin-right: 10px" type="submit" class="btn btn-outline-primary" >수정</button>
                <button class="btn btn-outline-success" onclick="history.back()">뒤로</button>
            </form>
        </div>
    </div>
</div>
<script>
    // noticeDto의 category 값에 해당하는 옵션을 선택
    var category = "<%= noticeDto.getCategory() %>";
    document.getElementById("categorySelect").value = category;
</script>
</body>
</html>