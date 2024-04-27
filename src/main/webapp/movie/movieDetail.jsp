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
<jsp:include page="../include/header.jsp"></jsp:include>
<title>영화상세 | 영화 그 이상의 감동</title>
<%
ReviewInfoDao rdao = new ReviewInfoDao();
String movie_id = request.getParameter("movie_id");
List<ReviewInfoDto> rlist = rdao.getReviewList(movie_id);
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
List<ReviewInfoDto> list = rdao.getPagingList(movie_id, startNum, perPage);

/*마지막 페이지의 단 한개 남은 글을 삭제시 빈페이지가 남는다 그러므로 해결책은 그이전페이지로 가면 된다  */
if (list.size() == 0 && currentPage != 1) {
%>
<script type="text/javascript">
   location.href="index.jsp?main=movie/movieDetail.jsp?movie_id=<%=movie_id%>&currentPage=<%=currentPage - 1%>";
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

List<ReviewInfoDto> rlist2 = rdao.getReviewListLikes(movie_id);

double br = rdao.updateMovieBookingRate(movie_id);
br = Double.parseDouble(String.format("%.1f", br));
dao.updateMovieBookingRate(movie_id, br);

SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy.MM.dd hh:mm");
%>
<body>
	<div id="wrap">
		<div class="center">
			<div id="moviedetail">
				<!-- 컨텐츠 시작 -->
				<div class="movie-detail" id="select_main">
					<div class="set-movie">
						<div class="top">
							<div class="box-img">
								<a title="포스터 크게보기 새창" href="<%=dto.getMovieImg()%>"
									target="_blank"> <span class="img-main"> <img
										src="<%=dto.getMovieImg()%>" class="post"> <img
										class="icon"
										src="../img/movie_img/vrating/<%=dto.getViewingRating()%>.png">
								</span>
								</a>
							</div>
							<div class="box-contents">
								<div class="title">
									<strong><%=dto.getMovieTitle()%></strong> <em class="now blue">
										<span class="nowshow"></span>
									</em> <em class="now brown"> <span class="nowshow"></span>
									</em> <em class="now red"> <span class="dday"></span>
									</em>
								</div>
								<div class="score">
									<strong class="brate"> 예매율&nbsp; <span><%=dto.getBookingRate()%>%</span>
									</strong>
									<div class="rating">
										<strong class="srating">평점&nbsp; <span
											class="rpercent"><%=dto.getRating()%>점</span>
										</strong>
									</div>
								</div>
								<div class="info">
									<dl>
										<dt>감독 :&nbsp;</dt>
										<dd><%=dto.getDirector()%></dd>
										<dd></dd>
										<dt>배우 :&nbsp;</dt>
										<dd class="on"><%=dto.getCast()%></dd>
										<dt>장르 :&nbsp;</dt>
										<dd><%=dto.getGenre()%>&nbsp;/&nbsp;<%=dto.getCountry()%></dd>
										<dd></dd>
										<dt>개봉 :&nbsp;</dt>
										<dd class="on"><%=sdf.format(dto.getReleaseDate())%></dd>
										<dt>기본정보 :&nbsp;</dt>
										<dd class="on"><%=dto.getViewingRating()%>,&nbsp;<%=dto.getRunningTime()%>분
										</dd>
									</dl>
								</div>
							</div>
						</div>
						<div class="cols-content" id="menu">
							<div class="col-detail">
								<div></div>
								<div class="set-story-movie">
									<%=dto.getMovieDescription()%>
								</div>
								<div class="set-trailer">
									<div class="heading">
										<h4>트레일러</h4>
										<span class="count"> <%=tlist.size()%>건
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
												<%
												for (MovieTrailerDto tdto : batch) {
												%>
												<div class="trailer-thumbnail tr">
													<img alt="재생" src="<%=tdto.getTrailerImg()%>"
														style="height: 150px;" class="play-button"
														data-video="<%=tdto.getTrailerLink()%>"> <strong
														class="title"> <span class="ico-trailer hd">HD</span>
														<%=tdto.getTrailerTitle()%>
													</strong>
												</div>
												<%
												}
												%>
											</div>
											<%
											}
											%>
										</div>
										<!-- 이전/다음 버튼 -->
										<div class="swiper-button-next"></div>
										<div class="swiper-button-prev"></div>
									</div>
								</div>
								<!-- .set-trailer -->
								<div class="set-stillcut">
									<div class="heading">
										<h4>스틸컷</h4>
										<span class="count"> <strong id="stillcut_current">1</strong>
											/<%=ilist.size()%>건
										</span>
									</div>
									<!-- Swiper -->
									<div class="swiper mySwiper">
										<div class="swiper-wrapper">
											<!-- 이미지 목록을 반복하여 각 이미지에 대한 슬라이드 생성 -->
											<%
											for (MovieImgDto idto : ilist) {
											%>
											<div class="swiper-slide">
												<!-- 이미지 출력 -->
												<img src="<%=idto.getImageLink()%>" style="height: 450px;">
											</div>
											<%
											}
											%>
										</div>
										<!-- 이전/다음 버튼 -->
										<div class="swiper-button-next"></div>
										<div class="swiper-button-prev"></div>
									</div>
									<!-- Swiper JS -->
									<script
										src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

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
												영화 평점 <span class="count-rating"><%=dto.getRating()%></span>
											</div>
											<label for="order_type" class="hidden">정렬</label>
											<ul id="order_type" class="order-type">
												<li class="p"><a style="color: black;"
													href="movieDetail.jsp?movie_id=<%=dto.getMovieId()%>#set-review">
														<img src="../img/movie_img/sort.png"
														style="width: 15px; color: black;"> 최신순
												</a></li>
												<li class="y"><a
													style="color: gray; padding-left: 20px; border-left: 1px solid lightgray;"
													href="movieDetailLike.jsp?movie_id=<%=dto.getMovieId()%> #set-review">
														<img src="../img/movie_img/like.png"
														style="width: 15px; color: gray;"> 좋아요순
												</a></li>
											</ul>
										</div>
									</div>
									<div class="real-rating">
										<p class="title">관람평을 남기시면 소원이 이루어질 거예요!</p>
										<p class="desc">
											<span> <em style="font-weight: bold;"><%=rlist.size()%></em>
												명의 관람객이 소원을 이뤘습니다!
											</span>
										</p>
										<div class="wrap-btn">
											<button class="rbtn">리뷰 작성</button>
											<button class="myreview">내 리뷰</button>
										</div>
									</div>
									<div class="wrap-persongrade" id="wrap-persongrade">
										<ul class="review-list">
											<%
											if (totalCount == 0) {
											%>
											<li class="not-review">
												<h6>등록된 리뷰가 없습니다</h6>
											</li>
											<%
											} else {

											ReviewLikeDao ldao = new ReviewLikeDao();

											for (int i = 0; i < list.size(); i++) {
												ReviewInfoDto rdto = list.get(i);

												boolean ok = ldao.getLikeData(rdto.getReviewId(), String.valueOf(memberId));

												if (ok) {
											%>
											<li><input type="hidden" name="review_id" id="review_id"
												value="<%=rdto.getReviewId()%>"> <input
												type="hidden" name="member_id" id="member_id"
												value="<%=memberId%>">
												<div class="icon_like">
													<span class="txt_ic_score"> </span> <span
														class="btn_ic_good" id="btnlike"> <!-- <i
														class="bi bi-hand-thumbs-up-fill"></i> --> <span
														class="like_on like"></span> <span class="likes-count"><%=rdto.getLikes()%></span>
													</span>
												</div>
												<div class="top_info">
													<div class="left">
														<span class="img_info"> <img
															src="<%=rdto.getUserPhoto()%>" onerror="this.src='../img/회원.png'">
														</span>
													</div>
													<div class="right">
														<div class="header">
															<span class="name"><%=rdto.getUsername()%></span> <span
																class="date"><%=sdf2.format(rdto.getReviewDate())%></span>
														</div>
														<div class="icon">
															<div class="star">
																<span class="bookingrate"><%=rdto.getRating()%></span> <span
																	class="booking_rate"></span>
															</div>
														</div>
													</div>
												</div>

												<div class="review_info"><%=rdto.getReviewContent()%></div>
											</li>
											<%
											} else {
											%>
											<li><input type="hidden" name="review_id" id="review_id"
												value="<%=rdto.getReviewId()%>"> <input
												type="hidden" name="member_id" id="member_id"
												value="<%=memberId%>">
												<div class="icon_like">
													<span class="btn_ic_good" id="btnlike"> <!-- <i
														class="bi bi-hand-thumbs-up"></i> --> <span
														class="like_off like"></span><span class="likes-count"><%=rdto.getLikes()%></span>
													</span>
												</div>
												<div class="top_info">
													<div class="left">
														<span class="img_info"> <img
															src="<%=rdto.getUserPhoto()%>" onerror="this.src='../img/회원.png'">
														</span>
													</div>
													<div class="right">
														<div class="header">
															<span class="name"><%=rdto.getUsername()%></span> <span
																class="date"><%=sdf2.format(rdto.getReviewDate())%></span>
														</div>
														<div class="icon">
															<div class="star">
																<span class="bookingrate"><%=rdto.getRating()%></span> <span
																	class="booking_rate"></span>
															</div>
														</div>
													</div>
												</div>

												<div class="review_info"><%=rdto.getReviewContent()%></div>
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
				<div class="layer-wrap">
					<input type="hidden" name="username" id="username"
						value="<%=username%>"> <input type="hidden"
						name="movie_id" id="movie_id" value="<%=movie_id%>"> <input
						type="hidden" name="member_id" id="member_id"
						value="<%=memberId%>">
					<div class="popup-general">
						<div class="popwrap">
							<h1>리뷰작성</h1>
							<div class="pop-contents write-mygrade">
								<div class="mygrade-cont">
									<div class="movie-tit">
										<strong id="regtitle"><%=dto.getMovieTitle()%></strong>
									</div>
									<div class="grade-star">
										<div class="writerinfo one">
											<%=username%>님의 영화 평점은
										</div>
										<i class="bi bi-star"> </i> <i class="bi bi-star"> </i> <i
											class="bi bi-star"> </i> <i class="bi bi-star"> </i> <i
											class="bi bi-star"> </i>
										<div class="writerinfo two">
											<span class="star-rating">0</span> 점
										</div>
									</div>
									<div class="textbox">
										<textarea id="textReviewContent" name="textReviewContent"
											title="리뷰 입력" cols="70" rows="2" maxlength="280"
											placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다."></textarea>
									</div>
									<div class="footbox">
										<div class="rbox">
											<span class="count"><strong id="text_count">0</strong>/280(byte)</span>
											<button type="button" class="round red on" id="regBtn">
												<span class="reviewinsert">작성하기</span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="x_btn bi bi-x-lg rclose">
								<img alt="" src="../img/common/x_btn.png">
							</div>
						</div>
					</div>
				</div>
				<!-- 페이지 번호 출력 -->
				<ul class="pagination justify-content-center">
					<%
					//이전
					if (startPage > 1) {
					%>
					<li class="page-item prev btn"><a class="page-link"
						href="movieDetail.jsp?movie_id=<%=movie_id%>&currentPage=<%=startPage - 1%>"
						style="color: black;"></a></li>
					<%
					}
					for (int pp = startPage; pp <= endPage; pp++) {
					if (pp == currentPage) {
					%>
					<li class="page-item active"><a class="page-link"
						href="movieDetail.jsp?movie_id=<%=movie_id%>&currentPage=<%=pp%>"><%=pp%></a>
					</li>
					<%
					} else {
					%>
					<li class="page-item"><a class="page-link"
						href="movieDetail.jsp?movie_id=<%=movie_id%>&currentPage=<%=pp%>"><%=pp%></a>
					</li>
					<%
					}
					}

					//다음
					if (endPage < totalPage) {
					%>
					<li class="page-item next btn"><a class="page-link"
						href="movieDetail.jsp?movie_id=<%=movie_id%>&currentPage=<%=endPage + 1%>"
						style="color: black;">
						</a></li>
					<%
					}
					%>

				</ul>
			</div>
		</div>
	</div>

	<jsp:include page="../include/footer.html"></jsp:include>
	<script type="text/javascript">

	
	$(".now.blue").hide();
	$(".now.red").hide();
	$(".now.brown").hide();

    // release_date 가져오기
    var releaseDate = new Date('<%=sdf.format(dto.getReleaseDate())%>');

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
   

    $(".rclose").click(function() {
    	$("div.layer-wrap").css("display","none");
    });

    $("div.layer-wrap .layer-content").click(function(event) {
        event.stopPropagation(); // 레이어 클릭 시 닫히지 않도록 이벤트 전파 막기
    });
    
   
  

</script>

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

	<script type="text/javascript">
	$(document).on("click", "div.wrap-persongrade span.btn_ic_good", function() {
	    var username = '<%=username%>';
	    var isLoggedIn = <%=username != null ? "true" : "false"%>;
	    var isLiked = $(this).find("span").hasClass("like_on");
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
	                    if(res.reviewId === reviewId) {
	                        t.find("span.like_on").removeClass("like_on").addClass("like_off");
	                        t.find("span.likes-count").text(res.likes);
	                    }
	                }
	            });
	        } else {
	            // 좋아요를 누르지 않은 상태인 경우
	            var memberId = $("#member_id").val();
	            var reviewId = t.closest("li").find("#review_id").val();
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
	                    if(res.reviewId === reviewId) {
	                    	  t.find("span.like_off").removeClass("like_off").addClass("like_on");
	                        t.find("span.likes-count").text(res.likes);
	                    }
	                }
	            });
	        }
	    } else {
	        // 로그인 상태가 아닌 경우
	        var confirmLogin = confirm("로그인이 필요합니다.\n 로그인 페이지로 이동하시겠습니까?");
	        if (confirmLogin) {
	            window.location.href = "../log/loginForm.jsp";
	        }
	    }
	});

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
			//alert("소원이 이루어 졌습니다!");
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
	var username = '<%=username%>';
       
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
	var username ='<%=username%>';
       
       if (username === 'null') {
           // 사용자가 로그인되어 있지 않은 경우
           if (confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")) {
               window.location.href = "../log/loginForm.jsp";
           } else {
               return false;
           }
       } else if(username != 'null' ) {
           // 사용자가 로그인되어 있는 경우
           window.location.href = "javascript:;";
       }
   });
});
 
</script>
</body>
</html>