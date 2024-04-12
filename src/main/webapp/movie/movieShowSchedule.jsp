<%@page import="data.movie.chart.MovieInfoDto"%>
<%@page import="data.movie.chart.MovieInfoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<title>상영예정작 | 영화 그 이상의 감동</title>

<style>
#movieshowrate ol.olElse{
	justify-content: flex-start;
}

#movieshowrate ol.olThree {
margin-top: 88px;}
</style>

<!-- movieShowRate.jsp -->
<%
MovieInfoDao dao = new MovieInfoDao();
List<MovieInfoDto> list = dao.getThreeMovieSchedule();
List<MovieInfoDto> elist = dao.getElseMovieSchedule();
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
								<li class="moviechart"><a href="movieShowRate.jsp"
									style="color: #444444; font-weight: bold;">무비차트</a></li>
								<li class="schedule"><a href="movieShowSchedule.jsp"
									style="color: #fb4357; font-weight: bold;">▶&nbsp;상영예정작</a></li>
							</ul>
						</div>
					</div>

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
									if (diffInDays > 0) {
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
									</span><span class="reservation"> <a class="link-reservation"
										href="#"> 예매하기</a>
									</span>
								</div>
							</li>
							<%
							}
							%>
						</ol>
						<!-- 해당날짜에 맞는 영화들을 4개씩 정렬 -->
						<%!// currentDate의 요일을 반환하는 함수
	public String getDayOfWeek(Date currentDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("E"); // "E"는 요일을 나타내는 패턴입니다.
		return sdf.format(currentDate);
	}%>
						<%
						// 해당 날짜에 맞는 영화들을 조회
						Map<Date, List<MovieInfoDto>> moviesByDate = new LinkedHashMap<>(); // LinkedHashMap을 사용하여 날짜 순서를 유지합니다.

						// 영화들을 날짜별로 그룹화
						for (MovieInfoDto dto : elist) {
							Date releaseDate = dto.getReleaseDate();
							List<MovieInfoDto> moviesForDate = moviesByDate.get(releaseDate);
							if (moviesForDate == null) {
								moviesForDate = new ArrayList<>();
								moviesByDate.put(releaseDate, moviesForDate);
							}
							moviesForDate.add(dto);
						}

						// 각 날짜별로 영화를 출력
						for (Map.Entry<Date, List<MovieInfoDto>> entry : moviesByDate.entrySet()) {
							Date currentDate = entry.getKey();
							List<MovieInfoDto> movies = entry.getValue();

							// 날짜가 바뀌면 새로운 행 생성
						%>
						<h4>
							<span class="hidden">상영예정작</span>
							<%=sdf.format(currentDate)%>(<%=getDayOfWeek(currentDate)%>)
						</h4>
						<ol class="olElse">
							<%
							int no2 = 4;
							for (MovieInfoDto dto : elist) {
								String dDayText = ""; // D-day 텍스트 초기화
								if (dto.getReleaseDate() != null) {
									Date releaseDate = dto.getReleaseDate();
									long diffInMillies = releaseDate.getTime() - today.getTime();
									long diffInDays = diffInMillies / (1000 * 60 * 60 * 24);
									if (diffInDays > 0) {
								dDayText = "D-" + diffInDays; // 남은 날짜인 경우
									}
								}

								if (dto.getReleaseDate().equals(currentDate)) {
							%>
							<li>
								<div class="box-img">
									<a href="movieDetail.jsp?movie_id=<%=dto.getMovieId()%>"> <span
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
							}
							%>
						</ol>
						<%
						}
						%>
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

			$("div.sub-menu li.moviechart").hover(
					function() {
						$(this).find("a").text("▶ 무비차트")
								.css("color", "#fb4357").css("font-weight",
										"bold").css("cursor", "pointer");
					},
					function() {
						$(this).find("a").text("무비차트").css("color", "#444444")
								.css("font-weight", "bold").css("font-weight",
										"bold").css("cursor", "pointer");
					});

		});
	</script>
</body>
</html>