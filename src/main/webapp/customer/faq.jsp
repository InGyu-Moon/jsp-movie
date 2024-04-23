<%@ page import="data.inform.faq.FaqDto"%>
<%@ page import="data.inform.faq.FaqDao"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<title>고객센터 | 영화 그 이상의 감동</title>
<%
request.setCharacterEncoding("utf-8");

FaqDao dao = new FaqDao();
List<FaqDto> faqs = dao.getAllFaq();
int count = dao.getCountFaq();
%>
<body>
	<div id="wrap">
		<div id="faq" class="customer">
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
								for (FaqDto faq : faqs) {
									System.out.println(faq.getFaqId());
								%>
								<tr>
									<td><%=faq.getCategory()%></td>
									<th class="tbody-th">
										<div class="arrow">
											<img alt="" src="../img/common/top_btn.png">
										</div> <a href="#!">&nbsp;&nbsp;<strong class="q"></strong>&nbsp;<%=faq.getQuestion()%></a>
									</th>

								</tr>
								<tr class="answer">
									<td colspan="2">
										<p>
											<strong>A.</strong>
											<%=faq.getAnswer()%>
											<button type="button" class="correction"
												onclick="location.href='?curr=faq/faqUpdateForm.jsp?faqId=<%=faq.getFaqId()%>'">수정</button>
										</p>
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
	<script type="text/javascript">
		$("tr").click(function() {
			$(this).next("tr.answer").toggleClass("active");
			$(this).find(".arrow").toggleClass("active");
		})
	</script>
</body>
</html>