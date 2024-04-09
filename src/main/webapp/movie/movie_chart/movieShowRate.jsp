<%@page import="data.movie.chart.MovieInfoDto"%>
<%@page import="data.movie.chart.MovieInfoDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=Noto+Sans+KR&family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<link href="css/movieshow_rate.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<!-- movieShowRate.jsp -->
<style type="text/css">
body {
	font-family: Noto Sans KR;
}

#wrap {
	/* overflow: hidden; */
	position: relative;
	width: 100%;
	z-index: 7;
	/* display: grid;
    place-items: center; */
}

#movieshowrate {
	clear: both;
	padding-bottom: 50px;
	position: relative;
	width: 980px;
	margin: 0 auto;
}

.title-head {
	position: relative;
	height: 100px;
	padding-top: 30px;
	border-bottom: 4px solid #241d1e;
}

.title-head>h3 {
	display: inline-block;
	position: relative;
	height: inherit;
	margin: 0;
	background-image: none;
	color: #222;
	font-weight: 500;
	font-size: 36px;
	text-align: left;
	vertical-align: middle;
	font-weight: bold;
}

h3 {
	/* display: block;
    font-size: 1.17em; */
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	line-height: 41px;
	/* font-weight: bold; */
}

.title-head>.sub-menu>ul>li {
	float: left;
	margin-left: 35px;
}

.title-head>.sub-menu {
	position: absolute;
	top: 48px;
	right: 0;
}

.sub-menu a {
	cursor: pointer;
}

.set-movie {
	position: relative;
	margin-top: 20px;
	display: flex; /* 요소들을 가로로 배치 */
	justify-content: space-between; /* 요소들을 양쪽으로 정렬 */
}

.set-movie .nowshow {
	position: absolute;
	left: 0;
	top: 0;
}

.hidden {
	font: 0/0 a;
	height: 0;
	overflow: hidden;
	/* position: absolute; */
	visibility: hidden;
	width: 0;
	zoom: 1;
}

.set-movie .order-type {
	/* position: absolute; */
	right: 0;
}

ol, ul {
	list-style: none;
}

.order-type li {
	position: relative;
	float: right;
	padding: 0 14px;
}

.order-type li a {
	cursor: pointer;
}

.order-type li.p:before {
	content: "";
	position: absolute;
	left: 0;
	top: 2px;
	height: 20px;
	border-left: 1px solid #CCC;
}

.set-movie-chart {
	margin-top: 30px;
	/* border: 1px solid #000000; */
}

.set-movie-chart-two {
	margin-top: 30px;
	/* border: 1px solid #000000; */
}

ol.olThree {
	display: flex;
	justify-content: space-around;
	align-content: center;
	/*  list-style-type: decimal; */
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding: 0px 40px;
	/* padding-inline-start: 40px; */
}

ol.olThree>li {
	width: 197px;
	padding-bottom: 30px;
}

ol.olElse {
	display: flex;
	align-content: center;
	/*  list-style-type: decimal; */
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-left: 0px;
	/* padding-inline-start: 40px; */
}

ol.olElse>li {
	margin-left: 40px;
	width: 197px;
	padding-bottom: 30px;
}

ol.olThreeChk {
	display: flex;
	justify-content: space-around;
	align-content: center;
	/*  list-style-type: decimal; */
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding: 0px 40px;
	/* padding-inline-start: 40px; */
}

ol.olThreeChk>li {
	width: 197px;
	padding-bottom: 30px;
}

ol.olElseChk {
	display: flex;
	align-content: center;
	/*  list-style-type: decimal; */
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-left: 0px;
	/* padding-inline-start: 40px; */
}

ol.olElseChk>li {
	margin-left: 40px;
	width: 197px;
	padding-bottom: 30px;
}

.rank1 {
	display: block;
	height: 28px;
	margin-bottom: 4px;
	/* border: 6px solid #000000; */
	background: #fb4357;
	color: #ffffff;
	font-size: 19px;
	text-align: center;
	line-height: 28px;
	font-weight: bold;
}

.rank2 {
	display: block;
	height: 28px;
	margin-bottom: 4px;
	/* border: 6px solid #000000; */
	background: #333333;
	color: #ffffff;
	font-size: 19px;
	text-align: center;
	line-height: 28px;
	font-weight: bold;
}

.rank {
	display: block;
	height: 28px;
	margin-bottom: 4px;
	/* border: 6px solid #000000; */
	background: #333333;
	color: #ffffff;
	font-size: 19px;
	text-align: center;
	line-height: 28px;
}

div.box-img img.icon {
	position: absolute;
	width: 20px;
	left: 5px;
	top: 5px;
	border-radius: 3px;
}

.img-rank1 {
	display: block;
	position: relative;
}

.img-rank2 {
	display: block;
	position: relative;
}

a {
	text-decoration: none;
}

a.link-reservation {
	background: #fb4357; /* 배경색 설정 */
	border-radius: 5px;
	color: white;
	font-size: 9pt;
	padding: 3px;
	margin: 5px 3px 0px 0px;
	width: 97px; /* 너비 설정 */
	height: 25px; /* 높이 설정 */
	display: inline-block; /* 링크를 블록 요소로 표시 */
	text-align: center; /* 텍스트 가운데 정렬 */
	line-height: 18px; /* 텍스트 세로 중앙 정렬 */
	vertical-align: middle;
}

.title {
	font-size: 15px;
	display: block;
	color: #333333;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	font-weight: bold;
}

strong {
	font-weight: 500;
}

.score {
	margin-top: 7px;
	font-size: 11px;
}

.score .rate .movie-grade {
	vertical-align: middle;
}

.score .movie-grade {
	margin-top: -10px;
	padding-left: 6px;
}

.movie-grade {
	display: inline-block;
	width: auto;
	line-height: 1;
}

.txt-info {
	margin-top: 3px;
	height: 13px;
	color: #666666;
	/* font-weight: 500; */
	white-space: nowrap;
}

.txt-info>strong {
	font-size: 11px;
}

em {
	font-style: normal;
}

.dday {
	display: inline-block;
	margin-left: 5px;
	color: #fb4357;
	font-size: 12px;
	font-family: Verdana, Geneva, sans-serif;
	font-weight: bold;
}

.box-img img {
	width: 100%;
}

.box-content {
	margin-top: 7px;
}
</style>
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

		$("div.sub-menu li.schedule").hover(
				function() {
					$(this).find("a").text("▶ 상영예정작").css("color", "#fb4357")
							.css("font-weight", "bold")
							.css("cursor", "pointer");
				},
				function() {
					$(this).find("a").text("상영예정작").css("color", "#444444")
							.css("font-weight", "bold").css("font-weight",
									"bold").css("cursor", "pointer");
				});

	});
</script>
</head>
<%
MovieInfoDao dao = new MovieInfoDao();
List<MovieInfoDto> list = dao.getThreeMovieData();
List<MovieInfoDto> elist = dao.getElseMovieData();
List<MovieInfoDto> listchk = dao.getThreeMovieDataChk();
List<MovieInfoDto> elistchk = dao.getElseMovieDataChk();
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
									style="color: #fb4357; font-weight: bold;">▶&nbsp;무비차트</a></li>
								<li class="schedule"><a href="movieShowSchedule.jsp"
									style="color: #444444; font-weight: bold;">상영예정작</a></li>
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
							<li class="p"><a href="movieShowGrade.jsp"
								style="color: gray;">평점순</a></li>
							<li class="y"><a href="movieShowRate.jsp"
								style="color: black;">예매순</a></li>
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
									<input type="hidden" id="movie_id"
										value="<%=dto.getMovieId()%>"> <strong class="rank1">No.<%=no++%></strong>
									<a
										href="index.jsp?main=movie/movieDetail.jsp?movie_id=<%=dto.getMovieId()%>">
										<span class="img-rank1"> <img
											src="<%=dto.getImageLink()%>"> <img class="icon"
											src="../../img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
									</span>
									</a> <span class="screentype"></span>
								</div>
								<div class="box-content">
									<a
										href="index.jsp?main=movie/movie_chart/movieDetail.jsp?movie_id=<%=dto.getMovieId()%>">
										<strong class="title"><%=dto.getMovieTitle()%></strong>
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
									</span> <br> <span class="reservation"> <a
										class="link-reservation" href="#"> 예매하기</a>
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
										href="index.jsp?main=movie/movie_chart/movieDetail.jsp?movie_id=<%=dto.getMovieId()%>">
										<span class="img-rank2"> <img
											src="<%=dto.getImageLink()%>"> <img class="icon"
											src="../../img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
									</span>
									</a> <span class="screentype"></span>
								</div>
								<div class="box-content">
									<a
										href="index.jsp?main=movie/movie_chart/movieDetail.jsp?movie_id=<%=dto.getMovieId()%>">
										<strong class="title"><%=dto.getMovieTitle()%></strong>
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
									</span> <br> <span class="reservation"> <a
										class="link-reservation" href="#"> 예매하기</a>
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
										href="index.jsp?main=movie/movie_chart/movieDetail.jsp?movie_id=<%=dto.getMovieId()%>">
										<span class="img-rank1"> <img
											src="<%=dto.getImageLink()%>"> <img class="icon"
											src="../../img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
									</span>
									</a> <span class="screentype"></span>
								</div>
								<div class="box-content">
									<a
										href="index.jsp?main=movie/movie_chart/movieDetail.jsp?movie_id=<%=dto.getMovieId()%>">
										<strong class="title"><%=dto.getMovieTitle()%></strong>
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
									</span> <br> <span class="reservation"> <a
										class="link-reservation" href="#"> 예매하기</a>
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
										href="index.jsp?main=movie/movie_chart/movieDetail.jsp?movie_id=<%=dto.getMovieId()%>">
										<span class="img-rank2"> <img
											src="<%=dto.getImageLink()%>"> <img class="icon"
											src="../../img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
									</span>
									</a> <span class="screentype"></span>
								</div>
								<div class="box-content">
									<a
										href="index.jsp?main=movie/movie_chart/movieDetail.jsp?movie_id=<%=dto.getMovieId()%>">
										<strong class="title"><%=dto.getMovieTitle()%></strong>
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
									</span> <br> <span class="reservation"> <a
										class="link-reservation" href="#"> 예매하기</a>
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
</body>
</html>