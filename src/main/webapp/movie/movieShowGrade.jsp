<%@page import="data.movie.chart.MovieInfoDto"%>
<%@page import="data.movie.chart.MovieInfoDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<title>무비차트 | 영화 그 이상의 감동</title>
<!-- movieShowRate.jsp -->
<%
//프로젝트 경로

//String root = request.getContextPath();
MovieInfoDao dao = new MovieInfoDao();
List<MovieInfoDto> list = dao.getThreeMovieData2();
List<MovieInfoDto> elist = dao.getElseMovieData2();
List<MovieInfoDto> listchk = dao.getThreeMovieDataChk2();
List<MovieInfoDto> elistchk = dao.getElseMovieDataChk2();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
%>
<body>
	<div id="wrap">
		<div class="center">
			<div id="movieshowrate">
				<!-- 컨텐츠 시작 -->
				<div class="movie-chart">
					<div class="title-head">
						<h3>무비차트</h3>
						<div class="sub-menu">
							<ul>
								<li class="on"><a href="movieShowRate.jsp"
									style="color: #fb4357; font-weight: bold;">▶&nbsp;무비차트</a></li>
								<li class="schedule"><a href="movieShowSchedule.jsp"
									style="color: #444444; font-weight: bold;"><span>▶</span>&nbsp;상영예정작</a></li>
							</ul>
						</div>
					</div>
					<div class="set-movie">
						<div class="nowshow">
							<input type="checkbox" id="chk_nowshow"> <label
								for="chk_nowshow">현재 상영작만 보기</label>
						</div>
						<label for="order_type" class="hidden">정렬</label>
						<ul id="order_type" class="order-type">
							<li class="on"><a href="movieShowGrade.jsp"
								style="color: black;">평점순</a></li>
							<li class><a href="movieShowRate.jsp" style="color: gray;">예매순</a>
							</li>
						</ul>
					</div>
					<!-- set-movie클래스 종료 -->
					<div class="set-movie-chart">
						<!-- 1,2,3위 만 정렬 -->
						<ol class="olThree">
							<%
							int no = 1;
							String todayStr = sdf.format(new Date());
							Date today = sdf.parse(todayStr); // 현재 날짜 설정
							for (MovieInfoDto dto : list) {
								String dDayText = ""; // D-day 텍스트 초기화
								if (dto.getReleaseDate() != null) {
									String releaseDateStr = sdf.format(dto.getReleaseDate());
									Date releaseDate = sdf.parse(releaseDateStr);
									long diffInMillies = releaseDate.getTime() - today.getTime();
									long diffInDays = diffInMillies / (1000 * 60 * 60 * 24);
									if (diffInDays < 0) {
								dDayText = ""; // 이미 지난 날짜인 경우
									} else if (diffInDays == 0) {
								dDayText = "D-day"; // 오늘인 경우
									} else {
								dDayText = "D-" + diffInDays; // 남은 날짜인 경우
									}
								}
							%>
							<li>
								<div class="box-img">
									<strong class="rank1">No.<%=no++%></strong> <a
										href="movieDetail.jsp?movie_id=<%=dto.getMovieId()%>"> <span
										class="img-rank1"> <img src="<%=dto.getImageLink()%>"
											class="mainimg"> <img class="icon"
											src="../img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
									</span>
									</a> <span class="screentype"></span>
								</div>
								<div class="box-content">
									<a href="movieDetail.jsp?movie_id=<%=dto.getMovieId()%>"> <strong
										class="title"><%=dto.getMovieTitle()%></strong>
									</a>
									<div class="score">
										<strong class="rate">예매율 <span class="rate-percent"><%=dto.getBookingRate()%>%&nbsp;&nbsp;&nbsp;|</span>
										</strong> <strong class="movie-grade">평점 <span
											class="grade-percent"><%=dto.getRating()%></span>
										</strong>
									</div>
									<span class="txt-info"> <strong> <%=sdf.format(dto.getReleaseDate())%>
											<span>개봉</span> <em class="dday"><%=dDayText%></em>
									</strong>
									</span> <span class="reservation"> <a class="link-reservation"
										href="#"> 예매하기</a>
									</span>
								</div>
							</li>
							<%
							}
							%>
						</ol>
						<!-- 4~19위 만 정렬 -->
						<ol class="olElse">
							<%
							int no2 = 4;
							for (MovieInfoDto dto : elist) {
								String dDayText = ""; // D-day 텍스트 초기화
								if (dto.getReleaseDate() != null) {
									Date releaseDate = dto.getReleaseDate();
									long diffInMillies = releaseDate.getTime() - today.getTime();
									long diffInDays = diffInMillies / (1000 * 60 * 60 * 24);
									if (diffInDays < 0) {
								dDayText = ""; // 이미 지난 날짜인 경우
									} else if (diffInDays == 0) {
								dDayText = "D-day"; // 오늘인 경우
									} else {
								dDayText = "D-" + diffInDays; // 남은 날짜인 경우
									}
								}
							%>
							<li>
								<div class="box-img">
									<strong class="rank2">No.<%=no2++%></strong> <a
										href="movieDetail.jsp?movie_id=<%=dto.getMovieId()%>"> <span
										class="img-rank2"> <img src="<%=dto.getImageLink()%>"
											class="mainimg"> <img class="icon"
											src="../img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
									</span>
									</a> <span class="screentype"></span>
								</div>
								<div class="box-content">
									<a href="movieDetail.jsp?movie_id=<%=dto.getMovieId()%>"> <strong
										class="title"><%=dto.getMovieTitle()%></strong>
									</a>
									<div class="score">
										<strong class="rate">예매율 <span class="rate-percent"><%=dto.getBookingRate()%>%&nbsp;&nbsp;&nbsp;|</span>
										</strong> <strong class="movie-grade">평점 <span
											class="grade-percent"><%=dto.getRating()%></span>
										</strong>
									</div>
									<span class="txt-info"> <strong> <%=sdf.format(dto.getReleaseDate())%>
											<span>개봉</span> <em class="dday"><%=dDayText%></em>
									</strong>
									</span> <span class="reservation"> <a class="link-reservation"
										href="#"> 예매하기</a>
									</span>
								</div>
							</li>
							<%
							// 4개마다 새로운 ol 요소 시작
							if ((no2 - 4) % 4 == 0 && no2 != 4) {
							%>
						</ol>
						<ol class="olElse">
							<%
							}
							}
							%>
						</ol>
					</div>
					<div class="set-movie-chart-two">
						<!-- 1,2,3위 만 정렬 -->
						<ol class="olThreeChk">
							<%
							int nochk = 1;
							String todayStrChk = sdf.format(new Date());
							Date todayChk = sdf.parse(todayStrChk); // 현재 날짜 설정
							for (MovieInfoDto dto : listchk) {
								String dDayText = ""; // D-day 텍스트 초기화
								if (dto.getReleaseDate() != null) {
									String releaseDateStr = sdf.format(dto.getReleaseDate());
									Date releaseDate = sdf.parse(releaseDateStr);
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
							%>
							<li>
								<div class="box-img">
									<strong class="rank1">No.<%=nochk++%></strong> <a
										href="movieDetail.jsp?movie_id=<%=dto.getMovieId()%>"> <span
										class="img-rank1"> <img src="<%=dto.getImageLink()%>"
											class="mainimg"> <img class="icon"
											src="../img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
									</span>
									</a> <span class="screentype"></span>
								</div>
								<div class="box-content">
									<a href="movieDetail.jsp?movie_id=<%=dto.getMovieId()%>"> <strong
										class="title"><%=dto.getMovieTitle()%></strong>
									</a>
									<div class="score">
										<strong class="rate">예매율 <span class="rate-percent"><%=dto.getBookingRate()%>%&nbsp;&nbsp;&nbsp;|</span>
										</strong> <strong class="movie-grade">평점 <span
											class="grade-percent"><%=dto.getRating()%></span>
										</strong>
									</div>
									<span class="txt-info"> <strong> <%=sdf.format(dto.getReleaseDate())%>
											<span>개봉</span> <em class="dday"><%=dDayText%></em>
									</strong>
									</span><span class="reservation"> <a class="link-reservation"
										href="#"> 예매하기</a>
									</span>
								</div>
							</li>
							<%
							}
							%>
						</ol>
						<!-- 4~19위 만 정렬 -->
						<ol class="olElseChk">
							<%
							int no2chk = 4;
							for (MovieInfoDto dto : elistchk) {
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
							%>
							<li>
								<div class="box-img">
									<strong class="rank2">No.<%=no2chk++%></strong> <a
										href="movieDetail.jsp?movie_id=<%=dto.getMovieId()%>"> <span
										class="img-rank2"> <img src="<%=dto.getImageLink()%>"
											class="mainimg"> <img class="icon"
											src="../img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
									</span>
									</a> <span class="screentype"></span>
								</div>
								<div class="box-content">
									<a href="movieDetail.jsp?movie_id=<%=dto.getMovieId()%>"> <strong
										class="title"><%=dto.getMovieTitle()%></strong>
									</a>
									<div class="score">
										<strong class="rate">예매율 <span class="rate-percent"><%=dto.getBookingRate()%>%&nbsp;&nbsp;&nbsp;|</span>
										</strong> <strong class="movie-grade">평점 <span
											class="grade-percent"><%=dto.getRating()%></span>
										</strong>
									</div>
									<span class="txt-info"> <strong> <%=sdf.format(dto.getReleaseDate())%>
											<span>개봉</span> <em class="dday"><%=dDayText%></em>
									</strong>
									</span> <span class="reservation"> <a class="link-reservation"
										href="#"> 예매하기</a>
									</span>
								</div>
							</li>
							<%
							// 4개마다 새로운 ol 요소 시작
							if ((no2chk - 4) % 4 == 0 && no2chk != 4) {
							%>
						</ol>
						<ol class="olElseChk">
							<%
							}
							}
							%>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.html"></jsp:include>
	<script type="text/javascript">
		$(function() {

			$(".olElse").show();
			$(".olThree").show();

			$(".olElseChk").hide();
			$(".olThreeChk").hide();

			$("#chk_nowshow").change(function() {
				if (this.checked) {
					$(".olElse").hide(); // 다른 영화 목록을 숨깁니다.
					$(".olThree").hide();
					$(".olThreeChk").show(); // 현재 상영작 목록을 보여줍니다.
					$(".olElseChk").show();
				} else {
					$(".olElse").show();
					$(".olThree").show();
					$(".olElseChk").hide();
					$(".olThreeChk").hide();
				}
			});

		});

		$("#movieshowrate .title-head > .sub-menu > ul > li.schedule").hover(
				function() {
					$(this).find("a").css({
						"color" : "#fb4357",
						"font-weight" : "bold",
						"cursor" : "pointer"
					});
				}, function() {
					$(this).find("a").css({
						"color" : "#444444",
						"font-weight" : "bold", // 폰트 웨이트를 기본값으로 변경
						"cursor" : "default" // 기본 커서로 변경
					});
				});
	</script>
</body>
</html>