<%@page import="data.movie.chart.MovieInfoDto"%>
<%@page import="data.movie.chart.MovieInfoDao"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<link href="css/movieshow_rate.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<style type="text/css">
body{
    font-family: Noto Sans KR;
}

#wrap {
    position: relative;
    width: 100%;
    z-index: 7;
}

#moviedetail {
    clear: both;
    padding-bottom: 50px;
    position: relative;
    width: 980px;
    margin: 0 auto;
}

.top{
	display: inline-flex;	
}

.set-movie{
    margin-top: 30px;
}

.box-container {
    display: flex;
    align-items: flex-start;
}

.box-contents {
    flex: 1;
    margin-left: 30px;
    width: 765px;
}

.box-contents > * {
    margin-bottom: 10px;
}

div.box-img img.icon{
	position: absolute;
	width: 20px;
	left: 5px;
	top: 5px;
	border-radius: 3px;
}

.img-main img.post {
    width: 185px;
    height: 260px;
}

.title {
    color: #333333;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

.title strong {
    color: black;
    font-size: 25px;
    vertical-align: middle;
    font-weight: 600;
}

.title em{
    margin-left: 12px;
}

em{
    font-style: normal;
}

em.now.blue{
    border: 2px solid #3e82a4;
    color: #3e82a4;
}

em.now.brown{
    border: 2px solid #a16423;
    color: #a16423;
}

em.now.red{
    border: 2px solid #fb4357;
    color: #fb4357;
}

em.now{
    line-height: 23px;
    font-weight: 600;
    font-size: 12px;
    text-align: center;
    vertical-align: middle;
    display: inline-block;
    position: relative;
    padding: 0 5px 0;
}

div.score{
    margin-top: 25px;
    padding-bottom: 10px;
    border-bottom: 1px solid #333333;
    font-size: 14px;
}

strong.brate{
    padding-right: 10px;
}

div.rating{
    display: inline-block;
    padding-left: 10px;
    border-left: 1px solid #d9d6c8;
}

div.info{
    line-height: 1.6;
    color: #333333;
    font-size: 13px;
    font-weight: 600;
    border-bottom: 1px solid #d9d6c8;
}

.info dt{
    float: left;
}

.set-story-movie{
    margin-top: 35px;
    color: #333333;
    line-height: 1.8;
}

.set-stillcut{
	padding-top: 40px;
}

.heading{
	margin-bottom: 20px;
}

.heading h4{
	float: left;
	margin-left: 16px;
	line-height: 25px;
	color: #333333;
	font-size: 15px;
	font-weight: 600;
	margin-right: 5px;
}

.heading .count{
	font-weight: 300;
}

div.slider-wrap{
	position: relative; 
	display: flex; 
	justify-content: center;
}

.silder .item-wrap .item{
	position: absolute;
	text-align: center;
}

.item-wrap .item button {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 40px;
    height: 40px;
    background-color: rgba(255, 255, 255, 0.5);
    border: none;
    border-radius: 50%;
    cursor: pointer;
    background-color: transparent; /* 버튼의 배경색을 투명하게 설정 */
    background-repeat: no-repeat; /* 배경 이미지 반복 없음 */
    background-size: cover; /* 배경 이미지 크기 조정 */
}

.btn-prev {
    left: 10px;
    background-image: url('images/btn-prev.png'); /* 이전 버튼의 배경 이미지 설정 */
    width: 44px;
    height: 82px;
}

.btn-next {
    right: 10px;
    background-image: url('images/btn-next.png'); /* 다음 버튼의 배경 이미지 설정 */
    width: 40px;
    height: 80px;
}

.swiper {
    width: 100%;
    height: 100%;
}

.swiper-slide {
    text-align: center;
    font-size: 18px;
    background: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 800px;
    height: 450px;
}

.swiper-slide img {
    display: block;
    height: 100%;
	text-align: center;
}


	
</style>

</head>
<%
    String movie_id = request.getParameter("movie_id");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
    MovieInfoDao dao = new MovieInfoDao();
	MovieInfoDto dto = dao.getData(movie_id);
%>
<script type="text/javascript">
$(document).ready(function() {
	
	$(".now.blue").hide();
	$(".now.red").hide();
	$(".now.brown").hide();
    // release_date 가져오기
    var releaseDate = new Date('<%=sdf.format(dto.getReleaseDate()) %>');

    // 오늘 날짜 가져오기
    var today = new Date();

    // 현재 상영 여부 확인 및 텍스트 변경
    var nowShowBlueElement = $('.now.blue .nowshow');
    var nowShowBrownElement = $('.now.brown .nowshow');
    var dDayRedElement = $('.now.red .dday');
    
    if (today < releaseDate) {
    	$(".now.red").show();
    	$(".now.brown").show();
        // 개봉 전
        nowShowBrownElement.text('예매중');
        // 디데이 계산
        var timeDiff = releaseDate.getTime() - today.getTime();
        var dDay = Math.ceil(timeDiff / (1000 * 3600 * 24));
        dDayRedElement.text('D-' + dDay);
    } else {
    	$(".now.blue").show();
        // 개봉 후
        nowShowBlueElement.text('현재상영중');
        dDayRedElement.text('');
    }
});
</script>
<body>
<div id="wrap">
	<div class="center">
       <div id="moviedetail">
    	 <!-- 컨텐츠 시작 -->
         <div class="movie-detail" id="select_main">
         	<div class="set-movie">
         	<div class="top">
         		<div class="box-img">
         			<a title="포스터 크게보기 새창" href="<%=dto.getImageLink() %>" target="_blank">
         				<span class="img-main">
         					<img src="<%=dto.getImageLink()%>" class="post">
                            <img class="icon" src="images/vrating/<%=dto.getViewingRating() %>.png">
         				</span>
         			</a>
         		</div>
         		<div class="box-contents">
         			<div class="title">
         				<strong><%=dto.getMovieTitle() %></strong>
         				<em class="now blue">
         					<span class="nowshow"></span>
         				</em>
         				<em class="now brown">
         					<span class="nowshow"></span>
         				</em>
         				<em class="now red">
         					<span class="dday"></span>
         				</em>
         			</div>
         			<div class="score">
         				<strong class="brate">
         					예매율&nbsp;
         					<span><%=dto.getBookingRate() %>%</span>
         				</strong>
         				<div class="rating">
         					<strong class="srating">평점&nbsp;
         						<span class="rpercent"><%=dto.getRating() %>점</span>
         					</strong>
         				</div>
         			</div>
         			<div class="info">
         				<dl>
         					<dt>감독 :&nbsp;</dt>
         					<dd><%=dto.getDirector() %></dd>
         					<dd></dd>
         					<dt>배우 :&nbsp;</dt>
         					<dd class="on"><%=dto.getCast() %></dd>
         					<dt>장르 :&nbsp;</dt>
         					<dd><%=dto.getGenre() %>&nbsp;/&nbsp;<%=dto.getCountry() %></dd>
         					<dd></dd>
         					<dt>개봉 :&nbsp;</dt>
         					<dd class="on"><%=sdf.format(dto.getReleaseDate()) %></dd>
         					<dt>기본정보 :&nbsp;</dt>
         					<dd class="on"><%=dto.getViewingRating() %>,&nbsp;<%=dto.getRunningTime()%>분</dd>
         				</dl>
         			</div>
         		</div>
         		</div>
         		<div class="cols-content" id="menu">
         			<div class="col-detail">
         				<div></div>
         				<div class="set-story-movie">
         					<%=dto.getMovieDescription() %>
         				</div>
         				<div class="set-stillcut">
         					<div class="heading">
         						<h4>스틸컷</h4>
         						<span class="count">
         							<strong id="stillcut_current">1</strong>
         							/<%-- 해당 movie_id에 맞는 이미지 총 개수<%= %> --%>건
         						</span>
         					</div>
         					 <!-- Swiper -->
							  <div class="swiper mySwiper">
							    <div class="swiper-wrapper">
							      <div class="swiper-slide on">
							      	<img alt="<%=dto.getMovieTitle() %>" src="<%=dto.getImageLink()%>" style="height: 450px;">
							      </div>
							      <div class="swiper-slide">Slide 2</div>
							      <div class="swiper-slide">Slide 3</div>
							      <div class="swiper-slide">Slide 4</div>
							      <div class="swiper-slide">Slide 5</div>
							      <div class="swiper-slide">Slide 6</div>
							      <div class="swiper-slide">Slide 7</div>
							      <div class="swiper-slide">Slide 8</div>
							      <div class="swiper-slide">Slide 9</div>
							    </div>
							    <div class="swiper-button-next"></div>
							    <div class="swiper-button-prev"></div>
							  </div>
							
							  <!-- Swiper JS -->
							  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
							
							  <!-- Initialize Swiper -->
							  <script>
							    var swiper = new Swiper(".mySwiper", {
							      navigation: {
							        nextEl: ".swiper-button-next",
							        prevEl: ".swiper-button-prev",
							      },
							    });
							  </script>
						</div>
						<!-- //set-stillcut -->
         			</div>
         		</div>
         	</div>
       	 </div>
       </div>
	</div>
</div>
</body>
</html>