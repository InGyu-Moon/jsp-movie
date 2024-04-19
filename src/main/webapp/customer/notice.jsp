<%@ page import="data.inform.notice.NoticeDao" %>
<%@ page import="data.inform.notice.NoticeDto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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
	NoticeDao dao = new NoticeDao();
	List<NoticeDto> noticeDtoList = dao.getAllNotices();
	int count = dao.getNoticeCount();

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
					<div class="category">
						<ul>
							<li><a href="faq.jsp">FAQ</a></li>
							<li class="active"><a href="notice.jsp">NOTICE</a></li>
							<li><a href="inquiry.jsp">INQUIRY</a></li>
						</ul>
					</div>

					<!-- 공지 목록 -->
					<div class="container">
						<table class="table table-bordered table-hover table-custom">
							<thead>
							<tr>
								<thead class="table-light">
								<th>구분</th>
								<th style="text-align: center;">제목</th>
								<th style="text-align: center;">등록일</th>
								</thead>
							</tr>
							</thead>
							<tbody>
							<%
								for(NoticeDto noticeDto : noticeDtoList) {
							%>
							<tr>
								<td><%=noticeDto.getCategory() %></td>
								<td>
									<a href="noticeDetail.jsp?noticeId=<%=noticeDto.getNoticeId()%>"><%=noticeDto.getTitle() %></a>
								</td>
								<td>
									<%=sdf.format(noticeDto.getRegisteredDate())%>
								</td>
							</tr>
							<%
								}
							%>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.html"></jsp:include>
</body>
</html>