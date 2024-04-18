<%@page import="data.theater.info.TheaterDao"%>
<%@page import="data.theater.info.TheaterDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<title>극장 | 영화 그 이상의 감동</title>
<%
TheaterDto tichekDto = new TheaterDto();
TheaterDao tichekDao = new TheaterDao();
List<TheaterDto> regionList = tichekDao.regionList();
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
									for (TheaterDto theater : regionList) {
										String region = theater.getRegion();
										if (!uniqueRegions.contains(region)) {
											uniqueRegions.add(region);
									%>
									<li><a href="javascript:;"><%=region%></a></li>
									<%
									}
									}
									%>
								</ul>
							</div>
							<div class="body">
								<div class="list view">
									<%
									// 선택한 지역의 지점들을 표시
									List<String> addresses = new ArrayList<>();
									String defaultRegion = ""; // 기본 지역 변수 추가
									for (TheaterDto theater : regionList) {
										if (theater.getRegion().equals("서울")) { // 서울이 기본 선택되어 있도록 설정
											addresses = tichekDao.addressList("서울"); // 기본적으로 서울의 지점들을 가져옴
											defaultRegion = "서울"; // 기본 지역 설정
											break; // 중복되지 않는 서울 지점들을 가져왔으므로 반복 중지
										}
									}
									%>
									<ul>
										<%
										for (int i = 0; i < addresses.size(); i++) {
											String address = addresses.get(i);
										%>
										<li><a href="javascript:;"><%=address%></a></li>
										<%
										}
										%>
									</ul>
								</div>

								<%
								for (int i = 1; i <= 8; i++) {
									String theaterId2 = regionList.get(i - 1).getTheater_id(); // 지역 리스트의 인덱스는 0부터 시작하므로 (i - 1)을 사용
								%>
								<div class="list">
									<ul>
										<%
										for (String address : addresses) {
										%>
										<li><a href="javascript:;"><%=address%></a></li>
										<%
										}
										%>
									</ul>
								</div>
								<%
								}
								%>

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
							<span></span>
						</div>

						<div class="theater_img">
							<div class="imax_4d">
								<div class="imax">
									<img alt="" src="">
								</div>
								<div class="4d">
									<img alt="" src="">
								</div>
							</div>
							<div class="text">
								<div>
									<div class="location">
										<p></p>
									</div>
									<div class="phone">
										<span></span>
									</div>
									<div class="seat">
										<span></span>관 / <span>seat</span>석
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="tab">
						<ul>
							<li><a href="#schedule">상영시간표</a></li>
							<li><a href="javascript:;">위치/주차안내</a></li>
						</ul>
					</div>
					<div class="schedule" id="schedule">
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
									<!-- 추가적인 슬라이드는 생략 -->
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
		//var theaterId = 
		var swiper = new Swiper(".swiper", {
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
				clickable : true,
			},
			slidesPerView : '8',
			watchOverflow : true,
			slidesPerGroup : 8,
		});

		$(".imax img").hide();
		$(".4d img").hide();

		$(".ticket .region .line .main .category ul li").click(function() {
			region = $(this).text(); // 클릭한 지역 이름 가져오기
			ul = $(this).closest('.main').find('.list ul'); // 해당 지역의 지점 목록을 출력할 ul 요소 찾기
			theater(region, ul); // theater 함수 호출

		});

		$(".ticket .region .line .main .list ul").on("click", "li", function() {
			region = $(this).closest('.main').find('.category ul li').text(); // 선택한 지역 이름 가져오기
			ul = $(this).closest('.list').find('ul'); // 해당 지역의 지점 목록을 출력할 ul 요소 찾기
			var branch = $(this).text();

			theater(region, ul); // theater 함수 호출
			branchattr(branch, ul);
			//alert(branch);
			branch_info(branch);

		});

		//지점 출력
		function theater(region, ul) {
			$.ajax({
				type : "get",
				dataType : "json",
				url : "ticket_address.jsp",
				data : {
					"region" : region
				},
				success : function(response) {
					addresses = response.addresses;
					if (addresses && addresses.length > 0) {
						list = "";

						for (var i = 0; i < addresses.length; i++) {
							list += "<li><a>" + addresses[i] + "</a></li>";
						}
						$(ul).empty().html(list);
					}
				}
			});
		}

		function branchattr(branch, ul) {
			var list = $(ul).find("li");
			list.each(function() {
				$(this).find("a").attr("branch", branch);
			})
		}

		//지점에 대한 정보 출력
		function branch_info(branch) {
			$.ajax({
				type : "post",
				dataType : "json",
				url : "ticket_info.jsp", // JSON 데이터를 반환하는 JSP 페이지에 요청을 보냄
				data : {
					"branch" : branch
				},
				success : function(res) {
					$(".ticket .theater .theater-tit span").text(res.branch);
					$(".location p").text(res.address);
					$(".phone span").text(res.phone);
					$(".seat span:first-child").text(res.screens);
					$(".seat span:last-child").text(res.seat);
					$(".theater_img").css("background-image",
							"url(" + res.img + ")");

					// IMAX 이미지 처리
					if (res.theater_imax === 1) { // IMAX가 true인 경우

						$(".imax img").attr("src", "../img/ticket/imax.png")
								.show();

					} else {
						$(".imax img").hide();
					}

					// 4D 이미지 처리
					if (res.theater_4d === 1) { // 4D가 true인 경우
						$(".4d img").attr("src", "../img/ticket/4dx.png")
								.show();

						;
					} else {
						$(".4d img").hide();
					}
				}
			});
		}

		$(".ticket .region .line .body .list.view ul li:first-child a").click()
				.css("color", "#fff");

		//극장 지역 탭
		$(".ticket .region .line .body .list").on(
				'click',
				'ul li a',
				function() {
					// 클릭된 링크에 활성 클래스를 추가하고 다른 링크에서는 제거
					console.log("성공");
					$(this).addClass('active').parent("li").siblings()
							.children("a").removeClass('active');
				});
	</script>
</body>
</html>
