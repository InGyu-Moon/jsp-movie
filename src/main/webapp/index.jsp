<%@page import="data.movie.chart.MovieInfoDto"%>
<%@page import="data.movie.chart.MovieInfoDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="include/index_header.html"></jsp:include>
<%
MovieInfoDao dao = new MovieInfoDao();
List<MovieInfoDto> list = dao.getThreeMovieData();
List<MovieInfoDto> elist = dao.getElseMovieData();
List<MovieInfoDto> listchk = dao.getThreeMovieDataChk();
List<MovieInfoDto> elistchk = dao.getElseMovieDataChk();
List<MovieInfoDto> Schedule_list = dao.getThreeMovieSchedule();
List<MovieInfoDto> Schedule_elist = dao.mainMovieSchedule();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
%>
<body>
	<div id="wrap">
		<div class="index">
			<div class="main_slide">
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img alt="" src="img/main/main_slide_01.png">
							<div class="pop_btn n_01">
								<img alt="" src="img/main/play.png">
							</div>
						</div>
						<div class="swiper-slide">
							<img alt="" src="img/main/main_slide_02.png">
							<div class="pop_btn n_02">
								<img alt="" src="img/main/play.png">
							</div>
						</div>
						<div class="swiper-slide">
							<img alt="" src="img/main/main_slide_03.png">
							<div class="pop_btn n_03">
								<img alt="" src="img/main/play.png">
							</div>
						</div>
						<div class="swiper-slide">
							<img alt="" src="img/main/main_slide_04.png">
							<div class="pop_btn n_04">
								<img alt="" src="img/main/play.png">
							</div>
						</div>
						<div class="swiper-slide">
							<img alt="" src="img/main/main_slide_05.png">
							<div class="pop_btn n_05">
								<img alt="" src="img/main/play.png">
							</div>
						</div>
					</div>
					<div class="swiper-pagination"></div>
					<div class="btn">
						<div class="swiper_start" data-action="start">
							<img alt="" src="img/main/play.png">
						</div>
						<div class="swiper_stop" data-action="stop"></div>
					</div>
				</div>
			</div>
			<div class="pop_up n_01">
				<div class="dimd"></div>
				<div class=video>
					<iframe width="970" height="580"
						src="https://www.youtube.com/embed/0T01ksZAwiU?autoplay=1&si=4xNgwAzryTKb9xXN"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<div class="btn">
						<img alt="" src="img/common/x_btn.png">
					</div>
				</div>
			</div>
			<div class="pop_up n_02">
				<div class="dimd"></div>
				<div class=video>
					<iframe width="970" height="580"
						src="https://www.youtube.com/embed/BiEMLmp96WA?autoplay=1&si=TSsqXr_8IUmubdJD"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<div class="btn">
						<img alt="" src="img/common/x_btn.png">
					</div>
				</div>
			</div>
			<div class="pop_up n_03">
				<div class="dimd"></div>
				<div class=video>
					<iframe width="970" height="580"
						src="https://www.youtube.com/embed/8NXtOCF5V5A?autoplay=1&si=fvSZfbQbeb3okI0D"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<div class="btn">
						<img alt="" src="img/common/x_btn.png">
					</div>
				</div>
			</div>
			<div class="pop_up n_04">
				<div class="dimd"></div>
				<div class=video>
					<iframe width="970" height="580"
						src="https://www.youtube.com/embed/sYqbLFQmUCs?autoplay=1&si=J0C-JK134BF7CghQ"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<div class="btn">
						<img alt="" src="img/common/x_btn.png">
					</div>
				</div>
			</div>
			<div class="pop_up n_05">
				<div class="dimd"></div>
				<div class=video>
					<iframe width="970" height="580"
						src="https://www.youtube.com/embed/Xxf4gJ0UbRA?autoplay=1&si=3sfQpWIFS9zb-ITz"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<div class="btn">
						<img alt="" src="img/common/x_btn.png">
					</div>
				</div>
			</div>
			<div class="chart">
				<div class="center">
					<div class="top">
						<ul>
							<li class="active">무비차트</li>
							<li>상영예정작</li>
						</ul>
						<div class="link view">
							<a href="movie/movieShowRate.jsp"> <img alt=""
								src="img/common/arrow.png"> 전체보기
							</a>
						</div>
						<div class="link">
							<a href="movie/movieShowSchedule.jsp"> <img alt=""
								src="img/common/arrow.png"> 전체보기
							</a>
						</div>
					</div>
					<div class="container">
						<div class="view box">
							<div class="navigation chartnav chart">
								<div class="swiper-button-next">
									<img alt="" src="img/common/arrow.png">
								</div>
								<div class="swiper-button-prev">
									<img alt="" src="img/common/arrow.png">
								</div>
							</div>
							<div class="swiper chart">

								<div class="swiper-wrapper">
									<%
									// 이미지 경로를 가져오고, '../'를 제거하여 안전한 이미지 경로를 생성합니다.
									int no = 0;
									String todayStrChk = sdf.format(new Date());
									Date todayChk = sdf.parse(todayStrChk); // 현재 날짜 설정
									for (MovieInfoDto dto : list) {
										String dDayText = ""; // D-day 텍스트 초기화
										if (dto.getReleaseDate() != null) {
											Date releaseDate = dto.getReleaseDate();
											long diffInMillies = releaseDate.getTime() - todayChk.getTime();
											long diffInDays = diffInMillies / (1000 * 60 * 60 * 24);
											if (diffInDays < 0) {
										dDayText = ""; // 이미 지난 날짜인 경우
											} else if (diffInDays == 0) {
										dDayText = "D-day"; // 오늘인 경우
											} else {
										dDayText = "D-" + diffInDays; // 남은 날짜인 경우
											}
										}
										no++;
									%>
									<div class="swiper-slide">
										<div class="img">
											<img alt="" src="<%=dto.getMovieImg() %>" class="movieImage">

											<div class="age_day">
												<div class="age">
													<img class="icon"
														src="img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
												</div>
											</div>
											<div class="hover">
												<div class="no"><%=no%></div>
												<div>

													<div class="btn">
														<a
															href="movie/movieDetail.jsp?movie_id=<%=dto.getMovieId()%>">상세보기</a>
													</div>
													<div class="btn">
														<a href="javascript:;">예매하기</a>
													</div>
												</div>
											</div>
										</div>
										<div class="text_box">
											<div class="title">
												<span><%=dto.getMovieTitle()%></span>
											</div>
											<div class="reservation">
												<span>예매율 : <%=dto.getBookingRate()%>
												</span>평점<span> : <%=dto.getRating()%></span>
											</div>
										</div>
									</div>
									<%
									}
									%>
									<%
									int no2 = 3;
									for (MovieInfoDto dto : elist) {
										String dDayText = ""; // D-day 텍스트 초기화
										if (dto.getReleaseDate() != null) {
											Date releaseDate = dto.getReleaseDate();
											long diffInMillies = releaseDate.getTime() - todayChk.getTime();
											long diffInDays = diffInMillies / (1000 * 60 * 60 * 24);
											if (diffInDays < 0) {
										dDayText = ""; // 이미 지난 날짜인 경우
											} else if (diffInDays == 0) {
										dDayText = "D-day"; // 오늘인 경우
											} else {
										dDayText = "D-" + diffInDays; // 남은 날짜인 경우
											}
										}
										no2++;
									%>
									<div class="swiper-slide">
										<div class="img">
											<img alt="" src="<%=dto.getMovieImg() %>" class="movieImage">
											<div class="age_day">
												<div class="age">
													<img class="icon"
														src="img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
												</div>
											</div>
											<div class="hover">
												<div class="no"><%=no2%></div>
												<div>

													<div class="btn">
														<a
															href="movie/movieDetail.jsp?movie_id=<%=dto.getMovieId()%>">상세보기</a>
													</div>
													<div class="btn">
														<a href="javascript:;">예매하기</a>
													</div>
												</div>
											</div>
										</div>
										<div class="text_box">
											<div class="title">
												<span><%=dto.getMovieTitle()%></span>
											</div>
											<div class="reservation">
												<span>예매율 : <%=dto.getBookingRate()%>
												</span>평점<span> : <%=dto.getRating()%></span>
											</div>
										</div>
									</div>
									<%
									}
									%>
								</div>

							</div>
						</div>
						<div class="box">
							<div class="navigation chartnav expected">
								<div class="swiper-button-next">
									<img alt="" src="img/common/arrow.png">
								</div>
								<div class="swiper-button-prev">
									<img alt="" src="img/common/arrow.png">
								</div>
							</div>
							<div class="swiper chart expected">

								<div class="swiper-wrapper">
									<%
									// 이미지 경로를 가져오고, '../'를 제거하여 안전한 이미지 경로를 생성합니다.
									int no3 = 0;
									String todayStr = sdf.format(new Date());
									Date today = sdf.parse(todayStr); // 현재 날짜 설정
									for (MovieInfoDto dto : Schedule_list) {
										String dDayText = ""; // D-day 텍스트 초기화
										if (dto.getReleaseDate() != null) {
											String releaseDateStr = sdf.format(dto.getReleaseDate());
											Date releaseDate = sdf.parse(releaseDateStr);
											long diffInMillies = releaseDate.getTime() - today.getTime();
											long diffInDays = diffInMillies / (1000 * 60 * 60 * 24);
											if (diffInDays > 0) {
										dDayText = "D-" + diffInDays; // 남은 날짜인 경우
											}
										}
										no3++;
									%>
									<div class="swiper-slide">
										<div class="img">
											<img alt="" src="<%=dto.getMovieImg() %>" class="movieImage">

											<div class="age_day">
												<div class="age">
													<img class="icon"
														src="img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
												</div>
											</div>
											<div class="hover">
												<div class="no"><%=no3%></div>
												<div>

													<div class="btn">
														<a
															href="movie/movieDetail.jsp?movie_id=<%=dto.getMovieId()%>">상세보기</a>
													</div>
													<div class="btn">
														<a href="javascript:;">예매하기</a>
													</div>
												</div>
											</div>
										</div>
										<div class="text_box">
											<div class="title">
												<span><%=dto.getMovieTitle()%></span>
											</div>
											<div class="reservation">
												</span>평점<span> : <%=dto.getRating()%></span>
											</div>
										</div>
									</div>

									<%
									}
									%>

									<%
									// 이미지 경로를 가져오고, '../'를 제거하여 안전한 이미지 경로를 생성합니다.
									int no4 = 3;
									String todayStr4 = sdf.format(new Date());
									Date today4 = sdf.parse(todayStr4); // 현재 날짜 설정
									for (MovieInfoDto dto : Schedule_elist) {
										String dDayText = ""; // D-day 텍스트 초기화
										if (dto.getReleaseDate() != null) {
											String releaseDateStr = sdf.format(dto.getReleaseDate());
											Date releaseDate = sdf.parse(releaseDateStr);
											long diffInMillies = releaseDate.getTime() - today4.getTime();
											long diffInDays = diffInMillies / (1000 * 60 * 60 * 24);
											if (diffInDays > 0) {
										dDayText = "D-" + diffInDays; // 남은 날짜인 경우
											}
										}
										no4++;
									%>
									<div class="swiper-slide">
										<div class="img">
											<img alt="" src="<%=dto.getMovieImg() %>" class="movieImage">

											<div class="age_day">
												<div class="age">
													<img class="icon"
														src="img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
												</div>
											</div>
											<div class="hover">
												<div class="no"><%=no4%></div>
												<div>

													<div class="btn">
														<a
															href="movie/movieDetail.jsp?movie_id=<%=dto.getMovieId()%>">상세보기</a>
													</div>
													<div class="btn">
														<a href="javascript:;">예매하기</a>
													</div>
												</div>
											</div>
										</div>
										<div class="text_box">
											<div class="title">
												<span><%=dto.getMovieTitle()%></span>
											</div>
											<div class="reservation">
												</span>평점<span> : <%=dto.getRating()%></span>
											</div>
										</div>
									</div>

									<%
									}
									%>

								</div>

							</div>
						</div>

					</div>
					<div class="banner">
						<div class="center">
							<div class="img">
								<img alt="" src="img/main/banner.png">
							</div>

						</div>
					</div>

				</div>
				<div class="event">
					<div class="img">
						<img alt="" src="img/main/event.png">
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="include/index_footer.html"></jsp:include>

	<script>
		//메인 슬라이드
		var startBtn = document.querySelector(".swiper_start");
		var stopBtn = document.querySelector(".swiper_stop");

		if (startBtn && stopBtn) { // 버튼이 존재하는 경우에만 이벤트 리스너 추가
			var swiper = new Swiper(".mySwiper", {
				pagination : {
					el : ".swiper-pagination",
				},
				loop : true,
				autoplay : {
					delay : 2500,
					disableOnInteraction : false,
					loopAdditionalSlides : 1
				},
			});

			// 버튼 클릭시 정지
			stopBtn.addEventListener('click', function() {
				swiper.autoplay.stop()
			})

			// 버튼 클릭시 시작
			startBtn.addEventListener('click', function() {
				swiper.autoplay.start()
			})
		} else {
			console.error("버튼을 찾을 수 없습니다.");
		}

		//차트 슬라이드
		var swiperChart = new Swiper(".swiper.chart", {
			observer : true,
			observeParents : true,
			watchOverflow : true,
			navigation : {
				nextEl : ".navigation.chartnav.chart .swiper-button-next",
				prevEl : ".navigation.chartnav.chart .swiper-button-prev",
				// 버튼 클릭 여부
				clickable : true,
			},
			slidesPerView : '5',
			spaceBetween : 30,
			slidesPerGroup : 5

		});

		var swiperexpected = new Swiper(".swiper.chart.expected", {
			observer : true,
			observeParents : true,
			watchOverflow : true,
			navigation : {
				nextEl : ".navigation.chartnav.expected .swiper-button-next",
				prevEl : ".navigation.chartnav.expected .swiper-button-prev",
				// 버튼 클릭 여부
				clickable : true,
			},
			slidesPerView : '5',
			spaceBetween : 30,
			slidesPerGroup : 5
		});

		var imageElements = document.querySelectorAll('.movieImage');
		if (imageElements.length > 0) {
			imageElements.forEach(function(imageElement) {
				// 이미지 경로에서 '../'를 제거합니다.
				var imagePath = imageElement.getAttribute('src').replace('../',
						'');
				// 수정된 이미지 경로를 설정합니다.
				imageElement.setAttribute('src', imagePath);
			});
		}
	</script>
</body>
</html>