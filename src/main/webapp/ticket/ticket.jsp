<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="data.ticket.TicketDao"%>
<%@page import="data.ticket.TicketDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<title>극장 | 영화 그 이상의 감동</title>
<%
TicketDto tichekDto = new TicketDto();
TicketDao tichekDao = new TicketDao();
List<TicketDto> regionList = tichekDao.regionList();
%>
<body>
	<div id="wrap">
		<div class="ticket">
			<div class="center">
				<div class="region">
					<div class="line">
						<div class="main">
							<div class="top">
								<div class="title">자주가는 극장</div>
								<div class="favorite">
									<div class="block">
										<a href="javascript:;"> <span>1</span>
										</a>
									</div>
									<div class="block">
										<a href="javascript:;"> <span>2</span>
										</a>
									</div>
									<div class="block">
										<a href="javascript:;"> <span>3</span>
										</a>
									</div>
									<div class="block">
										<a href="javascript:;"> <span>4</span>
										</a>
									</div>
									<div class="block">
										<a href="javascript:;"> <span>5</span>
										</a>
									</div>
									<a class="btn" href="javascript:;"> <span></span> <span></span>
									</a>

								</div>
							</div>
							<div class="category">
								<ul>
									<%
									// 중복되지 않는 지역 정보를 가져와서 표시
									List<String> uniqueRegions = new ArrayList<>();
									for (TicketDto theater : regionList) {
										String region = theater.getRegion();
										if (!uniqueRegions.contains(region)) {
											uniqueRegions.add(region);
									%>
									<li><a href="javascript:;" class="active"><%=region%></a></li>
									<%
									}
									}
									%>
								</ul>
							</div>
							<div class="body">
								<div class="list view">
									<ul>
										<li><a href="javascript:;" class="active">test</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="theater_text">
					<div class="hr">
						<div>
							<hr>
							<hr>
						</div>

						<div class="title">
							<span>THEATER</span>
						</div>
					</div>

					<div class="theater">
						<div class="theater-tit">
							<span>text</span>
						</div>
						<div class="theater_img">
							<div class="text">
								<div class="location">
									<p>location</p>
								</div>
								<div class="phone">
									<span>phone</span>
								</div>
								<div class="seat">
									<span>seat</span>/<span>seat</span>
								</div>
							</div>
						</div>
					</div>

					<div class="tab">
						<ul>
							<li><a href="#">상영시간표</a></li>
							<li><a href="javascript:;">위치/주차안내</a></li>
						</ul>
					</div>
					<div class="schedule">
						<div class="slide">
							<div class="swiper-button-next">
								<img alt="" src="../img/common/arrow.png">
							</div>
							<div class="swiper-button-prev">
								<img alt="" src="../img/common/arrow.png">
							</div>
							<div class="swiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide border">
										<div class="day">
											<p>04월</p>
											<p>월</p>
										</div>
										<div class="no">
											<span>08</span>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="day">
											<p>04월</p>
											<p>월</p>
										</div>
										<div class="no">
											<span>08</span>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="day">
											<p>04월</p>
											<p>월</p>
										</div>
										<div class="no">
											<span>08</span>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="day">
											<p>04월</p>
											<p>월</p>
										</div>
										<div class="no">
											<span>08</span>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="day">
											<p>04월</p>
											<p>월</p>
										</div>
										<div class="no">
											<span>08</span>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="day">
											<p>04월</p>
											<p>월</p>
										</div>
										<div class="no">
											<span>08</span>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="day">
											<p>04월</p>
											<p>월</p>
										</div>
										<div class="no">
											<span>08</span>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="day">
											<p>04월</p>
											<p>월</p>
										</div>
										<div class="no">
											<span>08</span>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="day">
											<p>04월</p>
											<p>월</p>
										</div>
										<div class="no">
											<span>08</span>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="day">
											<p>04월</p>
											<p>월</p>
										</div>
										<div class="no">
											<span>08</span>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="day">
											<p>04월</p>
											<p>월</p>
										</div>
										<div class="no">
											<span>08</span>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="day">
											<p>04월</p>
											<p>월</p>
										</div>
										<div class="no">
											<span>08</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="sect-guide">
							<ul>
								<li><img alt="" src="../img/ticket/ticket_01.png"> <span>모닝</span></li>
								<li><img alt="" src="../img/ticket/ticket_02.png"> <span>심야</span></li>
							</ul>
							<div class="text">
								<p>* 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</p>
							</div>
						</div>
						<div class="list">
							<div class="block">
								<div class="head">
									<div class="grade">
										<img alt="" src="">
									</div>
									<div class="movie_title">영화 제목</div>
									<div class="situation">상영중</div>
									<div class="information">
										<span class="genre">미스터리</span>/ <span class="time">134분</span>/
										<span class="day">2024.02.22 개봉</span>
									</div>
								</div>
								<div class="main">
									<div class="category">
										<span class="screen">2D</span> | <span class="location">3관
											8층</span> | <span class="total_seats">총 172석</span>
									</div>
									<div class="timetable">
										<ul>
											<li><a href="javascript:;"> <span class="time">17:05</span>
													<span class="seat">160석</span>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="info-noti">
							<p>ㆍ입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.html"></jsp:include>
	<script type="text/javascript">
		var swiper = new Swiper(".swiper", {
			/* 	autoplay : {
					delay : 2500,
					disableOnInteraction : false,
					loopAdditionalSlides : 1
				}, */
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
				// 버튼 클릭 여부
				clickable : true,
			},
			slidesPerView : '8',
			watchOverflow : true,
			slidesPerGroup : 8,
		});

		$(".ticket .region .line .main .category ul li").click(
				function() {
					var region = $(this).children("a").text();
					$.ajax({
						type : "get",
						dataType : "html",
						url : "ticket_address.jsp",
						data : {
							"region" : region
						},
						success : function(response) {
							var addresses = $(response).find('#addresses')
									.text();
							$(".ticket .region .line .body .list ul li").text(
									addresses);
						}
					});
				});
	</script>
</body>
</html>