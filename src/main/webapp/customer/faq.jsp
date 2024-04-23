<%@ page import="data.inform.faq.FaqDto" %>
<%@ page import="data.inform.faq.FaqDao" %>
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
	request.setCharacterEncoding("utf-8");

	FaqDao dao = new FaqDao();
	List<FaqDto> faqs = dao.getAllFaq();
	int count = dao.getCountFaq();
%>
<body>
	<div id="wrap">
		<div id="fqp" class="customer">
			<div class="center">
				<div class="head">
					<p>고객센터</p>
				</div>
				<div class="main">
					<div class="category">
						<ul>
							<li class="active"><a href="faq.jsp">FAQ</a></li>
							<li><a href="notice.jsp">NOTICE</a></li>
							<li><a href="inquiry.jsp">INQUIRY</a></li>
						</ul>
					</div>

					<!-- board list area -->
					<div class="container">
						<table class="table table-bordered table-hover table-custom">
							<thead>
							<tr>
								<thead class="table-light">
								<th>구분</th>
								<th style="text-align: center;">질문</th>
								</thead>
							</tr>
							</thead>
							<tbody>
							<%
								for(FaqDto faq : faqs) {
									System.out.println(faq.getFaqId());
							%>
							<tr>
								<td><%=faq.getCategory() %></td>
								<th class="tbody-th">
									<a href="#!">&nbsp;&nbsp;<strong>Q.</strong>&nbsp;<%=faq.getQuestion() %></a>
									<p>
										<br>
										<strong>A.</strong>
										<br>
										<%=faq.getAnswer() %>
										<br><br>
										<button type="button" class="btn btn-outline-warning"
												style="float: right;margin: 0px 15px 15px 0px;"
												onclick="location.href='?curr=faq/faqUpdateForm.jsp?faqId=<%=faq.getFaqId() %>'">수정</button>
									</p>
								</th>
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
	<script type="text/javascript">
		$(document).ready(function(){
			// 페이지 로드 시 슬라이드를 닫습니다.
			// $('.table-bordered a').parent().find('p').slideUp();
			$('.table-bordered a').parent().find('p').css('display', 'none');

			// 각각의 a 태그에 대해 클릭 이벤트를 설정합니다.
			$('.table-bordered a').click(function(e){
				// 기본 동작을 막습니다. => 링크를 막음
				e.preventDefault();
				// 클릭된 a 태그의 부모인 th를 선택합니다.
				var parent = $(this).parent();
				// 형제 요소인 p 태그를 찾아서 슬라이드 토글 애니메이션을 수행합니다.
				parent.find('p').slideToggle();
			});

		});
	</script>
</body>
</html>