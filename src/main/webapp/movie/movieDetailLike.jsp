<%@page import="data.movie.review.ReviewLikeDao"%>
<%@page import="data.movie.review.ReviewInfoDao"%>
<%@page import="data.movie.review.ReviewInfoDto"%>
<%@page import="data.user.member.MemberDto"%>
<%@page import="data.user.member.MemberDao"%>
<%@page import="data.movie.chart.MovieTrailerDto"%>
<%@page import="data.movie.chart.MovieTrailerDao"%>
<%@page import="data.movie.chart.MovieImgDao"%>
<%@page import="data.movie.chart.MovieImgDto"%>
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

.set-stillcut, .set-trailer{
	padding-top: 40px;
}

.heading{
	height: 39px;
    background: #f6f6f6;
	margin-bottom: 20px;
	border-radius: 5px;
}

.heading h4{
	float: left;
	margin-left: 16px;
	line-height: 36px;
	color: #333333;
	font-size: 15px;
	font-weight: 600;
	margin-right: 5px;
}

.heading .count{
	line-height: 37px;
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

.swiper {
    width: 100%;
    height: 100%;
}

.swiper-slide {
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

.set-trailer .title{
	margin-top: 10px;
	font-size: 12px;
	line-height: 16px;
}

.ico-trailer {
	color: #2a6fb6;
    display: inline-block;
    height: 16px;
    margin-right: 5px;
    padding: 0 3px;
    border: 1px solid #2a6fb6;
    font-size: 10px;
    text-align: center;
    font-weight: bold;
    line-height: 13px;
}

.swiper-slide.tr {
    font-size: 18px;
    background: #fff;
    display: flex;
    justify-content: start;
    margin-left: 50px;
    align-items: center;
    width: 800px;
    height: 200px;
}

.trailer-thumbnail.tr{
	margin-left: 20px;
}

.play-button{
	cursor: pointer;
}

.set-review{
	padding-top: 70px;
}

.movie-rating{
	position: relative;
	border-top: 2px solid #666666;
}

.point .title{
	font-size: 24px;
    line-height: 30px;
    position: absolute;
    left: 0;
}

.point {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.point .title {
    flex: 1; /* 나머지 공간 차지 */
    white-space: nowrap; /* 넘치는 내용을 줄여줍니다. */
    overflow: hidden; /* 넘치는 내용을 가리고 */
    text-overflow: ellipsis; /* 넘치는 내용을 ...으로 표시합니다. */
    max-width: calc(100% - 120px); /* 최대 너비 지정 */
    margin-right: 20px; /* title과 rating 사이의 간격 조정 */
}

.point .rating-grade{
	position: absolute;
    top: 40px;
    right: 30px;
}

.point {
    position: relative;
    margin-top: 20px;
    display: flex; /* 요소들을 가로로 배치 */
    justify-content: space-between; /* 요소들을 양쪽으로 정렬 */
}

.hidden {
    font: 0 / 0 a;
    height: 0;
    overflow: hidden;
    /* position: absolute; */
    visibility: hidden;
    width: 0;
    zoom: 1;
}

.set-movie .order-type{
    /* position: absolute; */
    right: 0;
}

.point #order_type {
    margin-left: auto; /* 나머지 공간을 차지 */
    display: flex;
    align-items: center;
    padding-top: 20px;
}

ol, ul{
    list-style: none;
}

a{
    text-decoration: none;
}

.order-type li {
    margin-left: 20px; /* 각 항목 간의 간격 조정 */
}

.order-type li a{
    cursor: pointer;
}

.wrap-persongrade-likes{
	padding-top: 30px;
}

.review-list li:first-child{
	border-color: #ccc;
}

.review-list li{
	border-top: 1px solid #eee;
	position: relative;
	padding: 20px 0 15px 68px;
}
	
div.layer-wrap {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 650px;
    height: 416px;
    background-color: #333;
    border: 10px solid #333;
    z-index: 9999; /* 다른 요소보다 위로 */
}

div.popwrap{
	width: 630px;
}

.layer-wrap .popwrap>h1, .popup-general .popwrap>h1 {
    height: 50px;
    line-height: 45px;
    padding-left: 19px;
    border: 2px solid #707070;
    color: #f2f0e5;
    font-weight: 300;
    font-size: 22px;
}

.layer-wrap .pop-contents.write-mygrade {
    padding: 15px 30px;
}

.layer-wrap .pop-contents, .popup-general .pop-contents {
    margin-top: 5px;
    padding: 40px;
    background-color: #f6f6f4;
    color: #333;
}

.layer-wrap .pop-contents{
    background-color: #f6f6f4;
    height: 336px;
}

.mygrade-cont .movie-tit {
    padding-bottom: 15px;
    font-size: 26px;
    font-weight: 500;
    text-align: center;
    border-bottom: 1px dashed #ccc9c7;
}

.mygrade-cont .textbox {
    padding: 10px;
    background: #ffffff;
    border: 1px solid #999999;
}

.mygrade-cont .textbox textarea {
    width: 100%;
    height: 80px;
    padding: 0;
    border: 0;
    background: none;
    font-size: 15px;
    color: #000000;
    line-height: 1.7;
    resize: none;
    overflow: auto;
    overflow-x: hidden;
    vertical-align: top;
}

i.rclose{
    display: block;
    position: absolute;
    color: white;
    zoom: 1;
    top: 12px;
    left: auto;
    right: 20px;
}

.grade-star{
	position: relative;
    height: 100px;
}

.mygrade-cont .footbox {
    margin-top: 8px;
}

.mygrade-cont .footbox .rbox button {
    margin-left: 8px;
    padding: 1px 10px 1px 10px;
}

.mygrade-cont .footbox .rbox {
    float: right;
}

.round.on.red {
    border: 2px solid #fb4357;
    background-color: #fb4357;
    color: #ffffff;
}

.round {
    line-height: 23px;
    font-weight: 500;
    font-size: 12px;
    text-align: center;
}

.grade-star {
    display: flex;
    align-items: center;
}

.grade-star .bi-star {
	cursor: pointer;
    font-size: 40px;
    margin-right: 5px;
    margin-bottom: 7px;
}

.grade-star .bi-star-fill {
	cursor: pointer;
    font-size: 40px;
    margin-right: 5px;
    margin-bottom: 7px;
}

.writerinfo.one {
    margin-right: 20px;
	margin-left: 40px;
	font-size: 15pt;
}

.writerinfo.two {
    margin-left: 15px;
    font-size: 16pt;
}

.real-rating {
    position: relative;
    width: 100%;
    padding: 30px;
    background: #f6f6f6;
    border-radius: 5px;
    box-sizing: border-box;
    margin-top: 20px;
}

.real-rating .title {
    font-size: 17px;
    color: #212224;
    font-weight: 500;
    line-height: 1.8em;
    margin-bottom: 0px;
    margin-top: 10px;
    font-weight: bold;
}

.real-rating .rbtn,
.real-rating .myreview {
    background-color: transparent;
    color: inherit;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 0;
    font: inherit;
}

.real-rating .desc span em {
    font-size: 14px;
    color: #222222;
    font-weight: 500;
    font-style: normal;
}

.real-rating .wrap-btn {
    position: absolute;
    top: 40px;
    right: 30px;
}

.real-rating .wrap-btn button.myreview {
	background-color: #666666;
    width: 76px;
    height: 50px;
    color: #ffffff;
    text-align: center;
    display: inline-block;
    border-radius: 3px;
    margin-left: 6px;
    font-size: 10pt;
    font-weight: bold;
    border: 2px solid #666666;
    
}

.real-rating .wrap-btn button.rbtn {
	background-color: #fb4357;
	width: 76px;
    height: 50px;
    color: #ffffff;
    text-align: center;
    display: inline-block;
    border-radius: 3px;
    margin-left: 6px;
    font-size: 10pt;
    font-weight: bold;
    border: 2px solid #fb4357;
}

span.btn_ic_good{
  cursor: pointer;
}



</style>
<%
ReviewInfoDao rdao = new ReviewInfoDao();
String movie_id = request.getParameter("movie_id");

//전체갯수
int totalCount = rdao.getTotalCount(movie_id);
int perPage = 5; //한페이지당 보여질 글의 갯수
int perBlock = 5; //한블럭당 보여질 페이지 갯수
int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이0번,오라클은 1번);
int startPage; //각블럭당 보여질 시작페이지
int endPage; //각블럭당 보여질 끝페이지
int currentPage; //현재페이지
int totalPage; //총페이지수
int no; //각페이지당 출력할 시작번호

//현재페이지 읽는데 단 null일경우는 1페이지로 준다
if (request.getParameter("currentPage") == null)
	currentPage = 1;
else
	currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총페이지수 구한다
//총글갯수/한페이지당보여질갯수로 나눔(7/5=1)
//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

//각블럭당 보여질 시작페이지
//perBlock=5일경우 현재페이지가 1~5일경우 시작페이지가 5,끝페이지가 1
//현재가 13일경우 시작:15 끝:11
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;

//총페이지가 23일경우 마지막블럭은 끝페이지가 1
if (endPage > totalPage)
	endPage = totalPage;

//각페이지에서 보여질 시작번호
//1페이지:0, 2페이지:5 3페이지: 10.....
startNum = (currentPage - 1) * perPage;

//각페이지당 출력할 시작번호 구하기
//총글개수가 23  , 1페이지:23 2페이지:18  3페이지:13
no = totalCount - (currentPage - 1) * perPage;

//페이지에서 보여질 글만 가져오기
List<ReviewInfoDto> list = rdao.getPagingListLike(movie_id, startNum, perPage);

/*마지막 페이지의 단 한개 남은 글을 삭제시 빈페이지가 남는다 그러므로 해결책은 그이전페이지로 가면 된다  */
if (list.size() == 0 && currentPage != 1) {
%>
<script type="text/javascript">
	location.href="index.jsp?main=movie/movieDetail.jsp?movie_id=<%=movie_id %>&currentPage=<%=currentPage - 1%>";
</script>
<%
}
%>
<%
	String username = (String) session.getAttribute("username");
	
	MovieInfoDao dao = new MovieInfoDao();
	MovieImgDao idao = new MovieImgDao();
	MemberDao mdao = new MemberDao();
	MovieTrailerDao tdao = new MovieTrailerDao();

	int memberId = mdao.getMemberIdByUsername(username);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

	MovieInfoDto dto = dao.getData(movie_id);
	List<MovieImgDto> ilist = idao.getImagesForMovie(movie_id);
	List<MovieTrailerDto> tlist = tdao.getTrailersForMovie(movie_id);
	List<MemberDto> mlist = mdao.getAllMembers();
	List<ReviewInfoDto> rlist = rdao.getReviewList(movie_id);
	List<ReviewInfoDto> rlist2 = rdao.getReviewListLikes(movie_id);
	
	double br = rdao.updateMovieBookingRate(movie_id);
	br = Double.parseDouble(String.format("%.1f", br));
	dao.updateMovieBookingRate(movie_id, br);

	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy.MM.dd hh:mm");
%>
<script type="text/javascript">
$(document).ready(function() {
	
	$(".now.blue").hide();
	$(".now.red").hide();
	$(".now.brown").hide();
	$("div.layer-wrap").hide();

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
   

    $("i.rclose").click(function() {
        $("div.layer-wrap").hide();
    });

    $("div.layer-wrap .layer-content").click(function(event) {
        event.stopPropagation(); // 레이어 클릭 시 닫히지 않도록 이벤트 전파 막기
    });
    
    //최신순
    $("li.p").click(function(){
   		location.reload();
    });
    
    //좋아요순
    $("li.p").click(function(){
    	location.reload();
    });
    
   
  
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
         			<a title="포스터 크게보기 새창" href="<%=dto.getMovieImg() %>" target="_blank">
         				<span class="img-main">
         					<img src="<%=dto.getMovieImg()%>" class="post">
                            <img class="icon" src="../img/movie_img/vrating/<%=dto.getViewingRating() %>.png">
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
						<div class="set-trailer">
							    <div class="heading">
							        <h4>트레일러</h4>
							        <span class="count">
							            <%=tlist.size()%>건
							        </span>
							    </div>
							    <!-- Swiper -->
							    <div class="swiper mySwiper">
							        <div class="swiper-wrapper">
							            <% 
							            // 트레일러를 3개씩 묶어서 출력
							            int batchSize = 3;
							            int totalTrailers = tlist.size();
							            for (int i = 0; i < totalTrailers; i += batchSize) {
							                List<MovieTrailerDto> batch = tlist.subList(i, Math.min(i + batchSize, totalTrailers));
							            %>
							                <div class="swiper-slide tr">
							                    <% for (MovieTrailerDto tdto : batch) { %>
							                        <div class="trailer-thumbnail tr">
							                            <img alt="재생" src="<%= tdto.getTrailerImg() %>" style="height: 150px;" class="play-button" data-video="<%= tdto.getTrailerLink() %>">
							                            <strong class="title">
							                                <span class="ico-trailer hd">HD</span>
							                                <%= tdto.getTrailerTitle() %>
							                            </strong>
							                        </div>
							                    <% } %>
							                </div>
							            <% } %>
							        </div>
							        <!-- 이전/다음 버튼 -->
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
							
							        // 재생 버튼 클릭 시 영상 새 창으로 열기
							        document.querySelectorAll('.play-button').forEach(button => {
							            button.addEventListener('click', function() {
							                var trailerLink = this.dataset.video;
							                window.open(trailerLink, '_blank');
							            });
							        });
							    </script>
							</div>
						<!-- .set-trailer -->
						<div class="set-stillcut">
         					<div class="heading">
         						<h4>스틸컷</h4>
         						<span class="count">
         							<strong id="stillcut_current">1</strong>
         							/<%=ilist.size()%>건
         						</span>
         					</div>
         					 <!-- Swiper -->
         					 <div class="swiper mySwiper">
							    <div class="swiper-wrapper">
							        <!-- 이미지 목록을 반복하여 각 이미지에 대한 슬라이드 생성 -->
							        <% for (MovieImgDto idto : ilist) { %>
							            <div class="swiper-slide">
							                <!-- 이미지 출력 -->
							                <img src="<%= idto.getImageLink() %>" style="height: 450px;">
							            </div>
							        <% } %>
							    </div>
							    <!-- 이전/다음 버튼 -->
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
        							on: {
        				                slideChange: function () {
        				                    // 슬라이드 변경시 현재 슬라이드의 인덱스 가져오기
        				                    var currentSlideIndex = this.realIndex + 1;
        				                    // 슬라이드 개수 업데이트
        				                    document.getElementById("stillcut_current").innerText = currentSlideIndex;
        				                }
        				            }
    							});
							 </script>
						</div>
						<!-- .set-stillcut -->
						<div class="set-review" id="set-review">
							<div class="movie-rating">
								<div class="point">
									<div class="title">
										영화 평점
										<span class="count-rating"><%=dto.getRating() %></span> 
									</div>
									<label for="order_type" class="hidden">정렬</label>
					                <ul id="order_type" class="order-type">
					                	<li class="p">
					                        <a  style="color: gray; padding-right: 20px; border-right: 1px solid lightgray;"
					                         href="movieDetail.jsp?movie_id=<%=dto.getMovieId()%> #set-review">
					                        	<img src="../img/movie_img/sort.png" style="width: 15px; color: black;" >
					                        	최신순
					                        </a>
					                    </li>
					                    <li class="y">
					                    	<a style="color: black;" 
					                    	href="movieDetailLike.jsp?movie_id=<%=dto.getMovieId()%> #set-review">
					                    		<img src="../img/movie_img/like.png" style="width: 15px; color: gray;" >
					                    		좋아요순
					                    	</a>
					                    </li>
					                </ul>
								</div>
							</div>
							<div class="real-rating">
								<p class="title">
								관람평을 남기시면 소원이 이루어질 거예요!
								</p>
								<p class="desc">
									<span>
										<em style="font-weight: bold;"><%=rlist.size() %></em>
										명의 관람객이 소원을 이뤘습니다!
									</span>
								</p>
								<div class="wrap-btn">
									<button class="rbtn">리뷰 작성</button>
									<button class="myreview">내 리뷰</button>
								</div>
							</div>
							<div class="wrap-persongrade-likes">
								<ul class="review-list">
								<%
								if(totalCount==0){
								%>
									<li class="not-review">
											<h6>등록된 리뷰가 없습니다</h6>
									</li>	
								<%
								}else{
									ReviewLikeDao ldao = new ReviewLikeDao();
									
									for(int i=0;i<list.size();i++){
										ReviewInfoDto rdto = list.get(i);
										boolean ok = ldao.getLikeData(rdto.getReviewId(), String.valueOf(memberId));
									if(ok){
										
								%>
								
								<li>
									<input type="hidden" name="review_id" id="review_id" value="<%= rdto.getReviewId() %>">
								<span class="img_info">
									<img src="<%=rdto.getUserPhoto() %>" style="width: 40px;">
								</span>
									<div class="top_info">
										<span class="bookingrate"><%=rdto.getRating()  %></span>
										<span class="booking_rate"></span>
										<span class="name"><%=rdto.getUsername() %></span>
										<span class="txt_ic_score">
											<span class="date"><%=sdf2.format(rdto.getReviewDate()) %></span>
										</span>
										<span class="btn_ic_good" id="btnlike">
											<i class="bi bi-hand-thumbs-up-fill"></i>
											<span class="likes-count"><%=rdto.getLikes() %></span>
										</span>
									</div>
									<div class="review_info"><%=rdto.getReviewContent() %></div>
								</li>
								<%
								}else{
								%>
								<li>
										<input type="hidden" name="review_id" id="review_id" value="<%= rdto.getReviewId() %>">
										<input type="hidden" name="member_id" id="member_id" value="<%= memberId %>">
									<span class="img_info">
										<img src="<%=rdto.getUserPhoto() %>" style="width: 40px;">
									</span>
										<div class="top_info">
											<span class="bookingrate"><%=rdto.getRating()  %></span>
											<span class="booking_rate"></span>
											<span class="name"><%=rdto.getUsername() %></span>
											<span class="txt_ic_score">
												<span class="date"><%=sdf2.format(rdto.getReviewDate()) %></span>
											</span>
											<span class="btn_ic_good" id="btnlike">
												<i class="bi bi-hand-thumbs-up"></i>
												<span class="likes-count"><%=rdto.getLikes() %></span>
											</span>
										</div>
										<div class="review_info"><%=rdto.getReviewContent() %></div>
									</li>
									<%
									}
								}
								}
								
									%>
								</ul>
							</div>
						</div>
						<!-- .set-review -->
						
         			</div>
         		</div>
         	</div>
       	 </div>
       </div>
	</div>
</div>

<div class="layer-wrap">
	<input type="hidden" name="username" id="username" value="<%= username %>">
	<input type="hidden" name="movie_id" id="movie_id" value="<%= movie_id %>">
	<input type="hidden" name="member_id" id="member_id" value="<%= memberId %>">
	<div class="popup-general">
		<div class="popwrap">
			<h1>리뷰작성</h1>
			<div class="pop-contents write-mygrade">
				<div class="mygrade-cont">
					<div class="movie-tit">
						<strong id="regtitle"><%=dto.getMovieTitle() %></strong>
					</div>
					<div class="grade-star">
						<div class="writerinfo one">
							<%=username %>님의 영화 평점은
						</div>
						<i class="bi bi-star"></i>
						<i class="bi bi-star"></i>
						<i class="bi bi-star"></i>
						<i class="bi bi-star"></i>
						<i class="bi bi-star"></i>
						<div class="writerinfo two">
							<span class="star-rating">0</span> 점
						</div>
					</div>
					<div class="textbox">
						<textarea id="textReviewContent" name="textReviewContent" title="리뷰 입력" cols="70" rows="2" 
						maxlength="280" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다."></textarea>
					</div>
					<div class="footbox">
						<div class="rbox">
							<span class="count"><strong id="text_count">0</strong>/280(byte)</span>
							<button type="button" class="round red on" id="regBtn"><span class="reviewinsert">작성하기</span></button>
						</div>
					</div>
				</div>
			</div>
			<i class="bi bi-x-lg rclose"></i>
		</div>
	</div>
</div>
<script type="text/javascript">
	$("div.wrap-persongrade-likes span.btn_ic_good").click(function() {
		var username = '<%= username %>';
		var isLoggedIn = <%= username != null ? "true" : "false" %>;
        var isLiked = $(this).find("i").hasClass("bi-hand-thumbs-up-fill");
        var t = $(this);
        
        if (isLoggedIn) {
            // 로그인 상태인 경우
            if (isLiked) {
                // 좋아요를 누른 상태인 경우
                var memberId = $("#member_id").val();
                var reviewId = t.closest("li").find("#review_id").val();
                $.ajax({
                    type: "get",
                    url: "decrementLikesAction.jsp",
                    data: { 
                  	  "reviewId": reviewId,
                  	  "memberId": memberId
                    },
                    dataType: "json",
                    success: function(res) {
                  	  //alert("ok");
                  	  if(res.reviewId===reviewId){
                 	  	t.find("i.bi-hand-thumbs-up-fill").removeClass("bi-hand-thumbs-up-fill").addClass("bi-hand-thumbs-up");
  			      		t.find("span.likes-count").text(res.likes);
                  	  }
              		}
                  })
            } else {
                // 좋아요를 누르지 않은 상태인 경우
                var memberId = $("#member_id").val();
                var reviewId = t.closest("li").find("#review_id").val();
				//alert(reviewId+","+memberId);
               	// 좋아요를 누르지 않은 상태이므로 좋아요 추가
              	$.ajax({
                  type: "get",
                  url: "incrementLikesAction.jsp",
                  data: { 
                	  "reviewId": reviewId,
                	  "memberId": memberId
                  },
                  dataType: "json",
                  success: function(res) {
                	  //alert("ok");
                	  
                	  if(res.reviewId===reviewId){
               	  		t.find("i.bi-hand-thumbs-up").removeClass("bi-hand-thumbs-up").addClass("bi-hand-thumbs-up-fill");
			      		t.find("span.likes-count").text(res.likes);
                	  }
            		}
                })
                
            }
        } else {
            // 로그인 상태가 아닌 경우
            var confirmLogin = confirm("로그인이 필요합니다.\n 로그인 페이지로 이동하시겠습니까?");
            if (confirmLogin) {
                window.location.href = "../log/loginForm.jsp";
            }
        }
	})
</script>
<script type="text/javascript">
$("span.reviewinsert").click(function() {
	var movie_id = $("#movie_id").val();
	var reviewContent = $("#textReviewContent").val();
	var starRating = $('.star-rating').text();
	starRating = parseFloat(starRating);
	var memberId = $("#member_id").val();

	$.ajax({
		type:"post",
		dataType: "html",
		url:"ReviewInsertAction.jsp",
		data:{
			"movieId":movie_id,
			"reviewContent":reviewContent,
			"memberId":memberId,
			"rating":starRating
		},
		success: function(res) {
			alert("소원이 이루어 졌습니다!");
			location.reload();
		}
		
	});
});
</script>
<script type="text/javascript">
//평점을 별점으로 표시
document.addEventListener('DOMContentLoaded', function() {
	const stars = document.querySelectorAll('.grade-star i');
    const scoreDisplay = document.querySelector('.writerinfo.two span.star-rating');
    
    let currentScore = 0;

    stars.forEach((star, index) => {
        star.addEventListener('click', function() {
            // 클릭된 별을 포함한 이전 별들을 모두 bi-star-fill 클래스로 설정
            for (let i = 0; i <= index; i++) {
                stars[i].classList.remove('bi-star');
                stars[i].classList.add('bi-star-fill');
            }
            // 클릭된 별 다음의 별들은 bi-star-fill 클래스를 제거하고 bi-star 클래스로 설정
            for (let i = index + 1; i < stars.length; i++) {
                stars[i].classList.remove('bi-star-fill');
                stars[i].classList.add('bi-star');
            }
            // 현재 점수 업데이트
            currentScore = index + 1;
            scoreDisplay.textContent = currentScore;
        });
    });

    // 작성하기 버튼 클릭 시 동작
    const regBtn = document.getElementById('regBtn');
    regBtn.addEventListener('click', function() {
        // 작성된 리뷰 내용과 평점을 얻어오기
        const reviewContent = document.getElementById('textReviewContent').value;
        // currentScore에는 현재 선택된 평점이 저장
        console.log('리뷰 내용:', reviewContent);
        console.log('평점:', currentScore);
    });
});

//글자수 계산
document.addEventListener('DOMContentLoaded', function() {
	const textArea = document.getElementById('textReviewContent');
    const textCount = document.getElementById('text_count');

    textArea.addEventListener('input', function() {
        const text = textArea.value;
        const byteCount = countBytes(text);

        // 입력 가능한 글자 수를 초과한 경우 알림창 띄우기
        if (byteCount > 280) {
            alert('입력 가능한 글자수를 초과했습니다.');
            const excessBytes = byteCount - 280;
            text = text.slice(0, text.length - excessBytes);
            byteCount = 280;
        }
        textCount.textContent = byteCount;
    });

    function countBytes(text) {
        let byteCount = 0;
        for (let i = 0; i < text.length; i++) {
            const charCode = text.charCodeAt(i);
            if (charCode <= 127) {
                byteCount += 1;
            } else {
                byteCount += 3; // UTF-8 기준
            }
        }
        return byteCount;
    }
});

//리뷰에 남긴 평점 별로 표시하기
document.addEventListener("DOMContentLoaded", function() {
	$("span.bookingrate").hide();
	
	var bookingRates = document.querySelectorAll('.bookingrate');

    bookingRates.forEach(function(rate) {
        // 숫자 가져오기
        var stars = parseFloat(rate.textContent);

        // 별 아이콘 생성 및 추가
        for (var i = 0; i < stars; i++) {
            var starIcon = document.createElement('i');
            starIcon.classList.add('bi', 'bi-star-fill');
            rate.nextElementSibling.appendChild(starIcon);
        }
    });
});

//리뷰 작성 및 내 리뷰 보러가기 로그인 체크
document.addEventListener('DOMContentLoaded', function() {
    // 리뷰 작성 버튼 클릭 시
    document.querySelector('.rbtn').addEventListener('click', function() {
	var username = '<%= username %>';
       
        if (username === 'null' || username === '') {
            // 사용자가 로그인되어 있지 않은 경우
            if (confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")) {
                window.location.href = "../log/loginForm.jsp";
            } else {
                return false;
            }
        } else if(username != 'null') {
            // 사용자가 로그인되어 있는 경우
            $("div.layer-wrap").show();
        }
    });

// 내 리뷰 버튼 클릭 시
document.querySelector('.myreview').addEventListener('click', function() {
	var username ='<%= username %>';
       
       if (username === 'null') {
           // 사용자가 로그인되어 있지 않은 경우
           if (confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")) {
               window.location.href = "../log/loginForm.jsp";
           } else {
               return false;
           }
       } else if(username != 'null' ) {
           // 사용자가 로그인되어 있는 경우
           window.location.href = "../mypage/myMain.jsp";
       }
   });
});


</script>
<!-- 페이지 번호 출력 -->
  <ul class="pagination justify-content-center">
  <%
  //이전
  if(startPage>1)
  {%>
	  <li class="page-item ">
	   <a class="page-link" href="index.jsp?main=movie/movieDetailLike.jsp?movie_id=<%=movie_id %>&currentPage=<%=startPage-1%> #set-review" style="color: black;">이전</a>
	  </li>
  <%}
    for(int pp=startPage;pp<=endPage;pp++)
    {
    	if(pp==currentPage)
    	{%>
    		<li class="page-item active">
    		<a class="page-link" href="index.jsp?main=movie/movieDetailLike.jsp?movie_id=<%=movie_id %>&currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}else
    	{%>
    		<li class="page-item">
    		<a class="page-link" href="index.jsp?main=movie/movieDetailLike.jsp?movie_id=<%=movie_id %>&currentPage=<%=pp%> "><%=pp %></a>
    		</li>
    	<%}
    }
    
    //다음
    if(endPage<totalPage)
    {%>
    	<li class="page-item">
    		<a  class="page-link" href="index.jsp?main=movie/movieDetailLike.jsp?movie_id=<%=movie_id %>&currentPage=<%=endPage+1%>"
    		style="color: black;">다음</a>
    	</li>
    <%}
  %>
  
  </ul>
</body>
</html>