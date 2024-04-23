<%@ page import="data.inform.notice.NoticeDao" %>
<%@ page import="data.inform.notice.NoticeDto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:include page="../include/header.html"></jsp:include>
<title>고객센터 | 영화 그 이상의 감동</title>
<style>
    .customer .main {
        align-items: center;
        margin-top: 40px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
</style>
<%
    String id = request.getParameter("noticeId");
    NoticeDao noticeDao = new NoticeDao();
    NoticeDto noticeDto = noticeDao.getNoticeById(id);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<body>
<div id="wrap">
    <div id="notice" class="customer">
        <div class="center">
            <div class="head">
                <p>고객센터</p>
            </div>
            <div class="main">
                <div>
                    <div style="display: flex; margin-bottom: 20px">
                        <span style="font-size: 30px;"><%=noticeDto.getTitle()%></span>
                    </div>
                    <div style="display: flex;margin-bottom: 20px;">
                        <span style="margin-right: 30px"><strong>분류: </strong><%=noticeDto.getCategory()%></span>
                        <span style="margin-right: 30px"><strong>조회수: </strong><%=noticeDto.getViewCount()%></span>
                        <span style=""><strong>등록일: </strong><%=sdf.format(noticeDto.getRegisteredDate())%></span>
                    </div>
                    <div>
                        <%=noticeDto.getContent()%>
                    </div>
                    <div style="display: flex;">
                        <button class="btn btn-outline-success" onclick="history.back()">목록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../include/footer.html"></jsp:include>
</body>
</html>