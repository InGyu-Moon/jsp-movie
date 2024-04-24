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
<title>Insert title here</title>
<style type="text/css">


#mymain {
    clear: both;
    padding-bottom: 50px;
    position: relative;
    width: 980px;
    margin: 0 auto;
}

.my-info-wrap {
    width: 882px;
    height: 200px;
    padding: 25px 40px 0 58px;
    background: #DDDDDD;
}

span.thumb-image{
	float: left;
    width: 135px;
    height: 135px;
}

span.thumb-image img{
	width: 150px;
	height: 150px;
	border-radius: 100px;
	
}

div.box-contents{
	float: right;
    width: 600px;
    padding-top: 25px;

}

.my-info-wrap .set-person-info > .box-contents > .person-info {
    margin-bottom: 15px;
    padding-bottom: 15px;
    border-bottom: 1px solid #AAAAAA;
    width: 482px;
}

em {
    font-style: normal;
    margin-right: 8px;
    margin-left: 8px;
    margin-top: 2px;
}

.my-info-wrap .set-person-info > .box-contents > .person-info > strong {
    font-size: 29px;
    line-height: 32px;
}

.my-info-wrap .sect-person-info > .box-contents.newtype > .person-info, .mycgv-info-wrap .sect-person-info > .box-contents.newtype > .grade-info {
    width: 482px;
}

.my-info-wrap .set-person-info > .box-contents.newtype > .grade-info p{
    margin-bottom: 4px;
    color: #342929;
    font-size: 20px;
    line-height: 20px;
}

.cols-content {
    padding-top: 25px;
    margin-top: 25px;
}

.cols-content .col-aside:first-child {
    float: left;
}

ul, li {
	list-style: none;
	padding-left: 0px;
}


a {
    text-decoration: none;
}

.cols-content .col-aside {
    width: 160px;
}

.cols-content .col-aside .snb > ul > li.on{

}

.cols-content .col-aside .snb > ul > li.on > a {
    background-color: #fb4357;
    color: #fdfcf0;
}

.cols-content .col-aside .snb > ul > li > a {
    width: 155px;
    height: 34px;
    padding-left: 10px;
    color: #222;
    font-weight: 600;
    font-size: 14px;
    line-height: 34px;
    display: block;
}

.cols-content .col-aside .snb li li > a {
    width: 125px;
    height: 14px;
    padding: 0 0 0 35px;
    font-size: 14px;
    color: #666;
    line-height: 14px;
    white-space: nowrap;
    letter-spacing: -0.02em;
}

.cols-content .col-aside .snb li ul {
    padding: 10px 0;
}

.cols-content .col-detail {
    float: right;
    position: relative;
    width: 800px;
}

.cols-content .col-aside .snb > ul > li.my-movie {
    background-color: #222;
    border: 0 none;
    margin-bottom: 5px;
}

.cols-content .col-aside .snb > ul > li.my-movie > a {
    width: 160px;
    padding-left: 14px;
    color: #fff;
}
</style>
</head>
<body>
	<div id="wrap">
		<div class="center">
			<div id="mymain">
				<!-- 컨텐츠 시작 -->
				<div class="set-common">
					<div class="my-info-wrap">
						<div class="set-person-info">
							<div class="box-image">
								<span class="thumb-image">
									<img src="../img/movie_img/yumi/yumi.jpg">
									<span class="profile-mask"></span>
								</span>
							</div>
							<div class="box-contents newtype">
								<div class="person-info">
									<strong><!-- 로그인한 유저 NAME-->김지은<span>님</span></strong>
									<em><!-- 로그인한 유저 USERNAME -->USERNAME</em>
									<button id="go_edit_page" type="button" title="새창열림">나의 정보 변경</button>
								</div>
								<div class="grade-info">
									<p>고객님은 총 <a href="#">0</a>개의 영화를 예매했습니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="cols-content" id="menu">
				    <div class="col-aside">
					    <div class="snb">
					        <ul>
					            <li class="on">
				                    <a href="#">MY HOME<i></i></a>
				                </li>
					            <li>
				                    <a href="#">나의 예매내역 <i></i></a>
				                    <ul>
				                       <li>
				                            <a href="#">예매내역 확인</a>
				                        </li>
				                    </ul>
				                </li>
					            <li>
				                    <a href="#">회원정보<i></i></a>
					                <ul>
				                        <li>
				                            <a href="#">개인정보 변경</a>
				                        </li>
					                    <li>
				                            <a href="#">회원탈퇴</a>
				                        </li>
					                </ul>
					            </li>
				                <li>
				                    <a href="#">프로필 관리<i></i></a>
				                </li>
					            <li>
				                    <a href="#">나의 문의내역 <i></i></a>
					                <ul>
					                    <li>
				                            <a href="#">1:1 문의</a>
				                        </li>
					                </ul>
					            </li>
				                <li class="my-movie">
				                	<a href="#">내가 본 영화<span style="margin-left: 38px;">↗️</span></a>
				                </li> 
					        </ul>
					    </div>
				    </div>
				    <div class="col-detail" id="mycgv_contents">	    
						<div class="sect-mycgv-reserve movielog col3">
						    <div class="box-polaroid">
						        <div class="box-inner watched">
						            <a href="http://www.cgv.co.kr/user/movielog/watched.aspx" title="내가 본 영화">
						                <h3>내가 본 영화</h3>
						                <span>관람한 영화들을 한번에 <br>모아 보고 싶다면?</span>
						            </a>
						        </div>
						        <div class="box-inner mvdiary">
						            <a href="http://www.cgv.co.kr/movies/point/my-list.aspx" title="내가 쓴 평점">
						                <h3>내가 쓴 평점</h3>
						                <span>관람 후 내 감상평을 적어 <br>추억하고 싶다면?</span>
						            </a>
						        </div>
						    </div>
						</div>
						<div class="tit-mycgv">
							<h3>MY 예매내역</h3>
							<p><em>0건</em> <a href="/user/mycgv/reserve/">예매내역 더보기</a></p>
							<span>예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</span>
						</div>
						
						<form name="aspnetForm" method="post" action="./?g=1" id="aspnetForm" novalidate="novalidate">
						<div>
						<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
						<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
						<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTc0NzIwMTk3M2RkGpTZbHfO8pvW/Ta9En5loRX6E2E=">
						</div>
		
						<div>
							<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="F268F2D4">
							<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEdAAVOZtRado8flmBd6Juf8Oum1JUVjiIIXAQpNIHKkzj23tvY44NDYVtgxRb4YZO0EMkABqLIL6iA4iWDemxwy2I/aUpTAIgfxMj+yOtM8nNbfvNGORhC6czTSRoEQvBRr7nelm0b">
						</div>
						    <!-- MY 예매내역 -->
						    <input type="hidden" id="hidCancelReserveNo" name="hidCancelReserveNo">
						    <div class="sect-base-booking">
							    <div class="box-polaroid">
							        <div class="box-inner">
					                    <div class="lst-item">
							    	        고객님의 최근 예매내역이 존재하지 않습니다.
						    	        </div>  
							        </div>
							    </div>
						    </div>
						</form>
						<!-- //MY 예매내역 -->
						<!-- MY 문의이력 -->
						<div class="sect-mycgv-part">
						    <div class="box-polaroid type1">
						        <div class="box-inner">
						            <div class="tit-mycgv">
										<h3>MY Q&amp;A</h3>
										<p><em>0건</em> <a href="/user/mycgv/inquiry/qna/list.aspx">MY Q&amp;A 더보기</a></p>
									</div>
									<div class="col-myqna">
						                
						                    <ul><li>고객님의 1:1 문의내역이 존재하지 않습니다.</li></ul>
						                
									</div>
						        </div>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>