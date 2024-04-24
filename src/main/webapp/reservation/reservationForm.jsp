<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.movie.screening.ScreeningDto"%>
<%@page import="data.movie.screening.ScreeningDao"%>
<%@page import="data.theater.info.TheaterDao"%>
<%@page import="data.theater.info.TheaterDto"%>
<%@page import="data.movie.chart.MovieInfoDto"%>
<%@page import="java.util.List"%>
<%@page import="data.movie.chart.MovieInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd E요일");

	MovieInfoDao movieDao = new MovieInfoDao();
	List<MovieInfoDto> movieList = movieDao.getAllMovieData();
	//System.out.println(movieList.toString());
	TheaterDao theaterDao = new TheaterDao();
	List<TheaterDto> theaterRegionList = theaterDao.getRegionList();
	List<TheaterDto> theaterBranchList = theaterDao.getBranchList();
	//System.out.println(theaterRegionList.toString());
	//System.out.println(theaterBranchList.toString());
	ScreeningDao screeningDao = new ScreeningDao();
	List<ScreeningDto> screenDateList = screeningDao.getDate();
	
%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<title>영화예매</title>
<style>
    .custom-col {
	    background-color: black;
	    color: white;
	    border: 2px solid white;
	    display: flex;
	    align-items: center; /* 수직 가운데 정렬 */
	    justify-content: center; /* 수평 가운데 정렬 */
	    font-weight: bold;
	    height: 40px;
	}
	.a1:focus {
	    background-color: black;
	    color: white;
	}
	
	.a2:focus {
	    background-color: black;
	    color: white;
	}
	
	.a3:focus {
	    background-color: black;
	    color: white;
	}
	table {
	    background-color: transparent;
	    
	}
	tr, td{
		background-color: transparent;
		color: white;
	}
	#writeMovie {
		margin-top: 30px;
	}
	#go{
		margin-top: 30px;
	}
	
	
	
</style>

<script>
$(document).ready(function() {
	var movieId; // 영화id
	var movieTitle; // 영화제목
	var theaterId; // 지역id
	var branch; // 지역
	var screeningDate; // 상영날짜
	var screeningDateFormat;
	var screenInfo; //상영정보
	var screenName; //몇 관 
	
	
	// 영화 라인 클릭 시
    $(".a1").click(function(event) {
        event.preventDefault(); // 링크의 기본 동작을 막음
        movieId = $(this).attr("value"); // 클릭된 영화id 가져오기
        movieTitle = $(this).text().trim(); // 클릭된 영화 제목 가져오기
        // 함수 호출 및 값 전달
        getMovie(movieId); // yourFunction은 호출할 함수 이름입니다.
    });
	// 극장에 지역 클릭 시
    $(".a2").click(function(event) {
        event.preventDefault(); // 링크의 기본 동작을 막음
        theaterId = $(this).attr("value"); // 선택된 극장 ID 가져오기
        
        // 함수 호출 및 값 전달
        //getMovieIdAndRegionId(movieId, theaterId); // yourFunction은 호출할 함수 이름입니다.
    });
	// 극장에 지점 클릭 시
    $(".a3").click(function(event) {
        event.preventDefault(); // 링크의 기본 동작을 막음
        theaterId = $(this).attr("value");
        branch = $(this).text().trim(); // 현재 지점의 텍스트 가져오기
        
        console.log("지점 선택 시 id "+theaterId);
        $("#theaterId").val(theaterId);
        // 함수 호출 및 값 전달
        getScreeningAndTheaterScreen(movieId, branch); 
    });
	// 날짜 지점 클릭 시
    $(".a4").click(function(event) {
        event.preventDefault(); // 링크의 기본 동작을 막음
        screeningDate = $(this).attr("value"); // 상영날짜 value 가져오기
        screeningDateFormat = ($(this).text().trim()).substr(-3,4); // 상영날짜 텍스트 가져오기
        
        // 함수 호출 및 값 전달
        getScreeningTime(movieId, branch, screeningDate); 
    });
	// 상영 시간 클릭 시
    $("#screeningTime").on("click", "#time", function(event) {
    	var screeningInfoId = $(this).val();
    	$("#theaterDate").text(screeningDate+"("+screeningDateFormat+")"+" "+$(this).text().trim());
    	$("#theaterScreen").text(screenInfo);
    	$("#screeningInfoId").val(screeningInfoId);
    	console.log("시간 버튼 클릭 시 상영관 : "+screenInfo+screenName);
    });
	
	$("#go").click(function (){
		$("#branch").val(branch);
		$("#screeningDateVal").val(screeningDate);
	})


    // getMovieId 구현
    function getMovie(id) {
        console.log("클릭된 영화 아이디: " + id);
        // 여기에 원하는 동작을 구현하세요
        $.ajax({
			type:"post",
			dataType:"json",
			url:"reservationGetMovie.jsp",
			data:{"movieId":id},
			success:function(data){
				console.log("데이터 받음:", data);
				// 받아온 데이터를 변수에 저장
	            //var movieImg = data.movieImg;
	            var movieImg = "https://via.placeholder.com/150";
	            var movieId = data.movieId;
	            var movieTitle = data.movieTitle;
	            var viewingRating = data.viewingRating;
				
	        	// 이미지 소스 설정
	            $("#imgg").attr("src", movieImg);
	            // 이미지 크기 설정
	            $("#imgg").css({"height": "50px", "width": "50px"});
				// id
	            $("#movieId").val(movieId);
	            // 제목 설정
	            $("#title").text(movieTitle);

	            // 등급 설정
	            $("#rating").text(viewingRating);
			}
		});
        
    }
    // getMovieId 구현
    /* function getMovieIdAndRegionId(movieId, theaterId) {
        console.log("클릭된 영화와 지역 아이디: " + movieId+ ", " + theaterId);
        // 여기에 원하는 동작을 구현하세요
        $.ajax({
			type:"post",
			dataType:"json",
			url:"reservationGetTheater.jsp",
			data:{"movieId":movieId},
			success:function(data){
				console.log("데이터 받음:", data);
				// 받아온 데이터를 이용하여 동적으로 HTML 생성 및 추가
				$.each(data,function(index,item){
					var theaterId = item.theaterId;
					var branch = item.branch;
					// 생성한 HTML을 테이블에 추가
					// id
		            $("#theaterId").val(theaterId);
		            // 극장 설정
		            //$("#theater").text(branch);
		            
				});
				
			}
		});
    } */
    
    // 상영정보 가져오기
    function getScreeningAndTheaterScreen(movieId, branch) {
        console.log("클릭된 영화와 지역: " + branch);
        // 여기에 원하는 동작을 구현하세요
        $.ajax({
			type:"post",
			dataType:"json",
			url:"reservationGetScreeningAndTheaterScreen.jsp",
			data:{"branch":branch, "movieId":movieId},
			success:function(data){
				console.log("데이터 받음:", data);
				// 받아온 데이터를 이용하여 동적으로 HTML 생성 및 추가
				$.each(data,function(index,item){
					var screeningInfoId = item.screeningInfoId; // 상영정보id
					var screeningDate = item.screeningDate; // 상영날짜
					var screeningTime = item.screeningTime; //상영시간
					var screenInfo = item.screenInfo; //상영정보
					var screenName = item.screenName; //몇 관 
					// 생성한 HTML을 테이블에 추가
					// id
		            //$("#screeningInfoId").val(screeningInfoId);
		            // 극장 설정
		            $("#theater").text(branch);
		            //$("#theaterDate").text(screeningDate+screeningTime);
		            //$("#theaterScreen").text(screenName+" "+screenInfo);
		            
				});
				
			}
		});
    }
    
    
    // 상영 시간 정보 가져오기
    function getScreeningTime(movieId, branch, screeningDate) {
        console.log("현재까지 클릭된 영화와 지역과 날짜: " + movieId + branch + screeningDate);
        console.log("포맷 날짜: " + screeningDateFormat);
        // 여기에 원하는 동작을 구현하세요
        $.ajax({
			type:"post",
			dataType:"json",
			url:"reservationGetScreeningTime.jsp",
			data:{"branch":branch,"movieId":movieId,"screeningDate":screeningDate},
			success:function(data){
				console.log("데이터 받음:", data);
				// 날짜만 설정
				$("#theaterDate").text(screeningDate+"("+screeningDateFormat+")");
				
				// 받아온 데이터를 이용하여 동적으로 HTML 생성 및 추가
	            var screeningTimeContainer = $("#screeningTime");
	            screeningTimeContainer.empty(); // 기존 내용을 비움
	            
	            if (data.length === 0) {
	                // 데이터가 없을 때 처리
	                screeningTimeContainer.append("<span id='a4hidden'>영화, 지역, 지점을 먼저 선택해 주세요.</span>");
	            } else {
	            	var s="<div class='row row-cols-3'>";
	            	$.each(data,function(index,item){
	            	    var screeningInfoId = item.screeningInfoId; // 상영정보id
	            	    var screeningTime = item.screeningTime; //상영시간
	            	    console.log("screenName: ", screenName);
	            	    screenInfo = item.screenInfo; //상영정보
	            	    screenName = item.screenName; //몇 관 
	            	    // 생성한 HTML을 테이블에 추가
	            	    // id
	            	    $("#screeningInfoId").val(screeningInfoId);
	            	    // 각 요소를 한 줄에 세 개씩 배치
	            	    s += "<div class='col'>";
	            	    s += "<span><strong>" + screenName + " " + screenInfo + "</strong></span><br>";
	            	    s += "<button type='button' class='btn btn-light time' id='time' value='"+screeningInfoId+"'>" + screeningTime + "</button>";
	            	    s += "</div>";
	            	    // 인덱스가 3의 배수인 경우 새로운 줄을 시작
	            	    if ((index + 1) % 3 === 0) {
	            	        s += "</div><div class='row row-cols-3'>";
	            	    }
	            	});
	            	// 마지막 줄을 닫아줌
	            	s += "</div>";

	            	// HTML을 추가
	            	screeningTimeContainer.append(s);
				}
			}
		});
    }
    
    
});
</script>
</head>
<body>

<div class="container">
	<!-- 첫 번째 row -->
    <div class="row">
         <div class="col-sm-3 custom-col">
	        영화
	    </div>
	    <div class="col-sm-3 custom-col">
	        극장
	    </div>
	    <div class="col-sm-2 custom-col">
	        날짜
	    </div>
	    <div class="col-sm-4 custom-col">
	        시간
	    </div>
    </div>
	<form action="selectSeat.jsp" method="post">
    <div class="row">
        <div class="col-sm-3">
            <div class="list-group overflow-auto" id="movieList" style="height: 500px;">
            	<!-- 여기 영화 리스트 출력 할 거임 -->
            	<%
            		for(MovieInfoDto movie : movieList) {
            	%>
            		<a href="#" value="<%=movie.getMovieId() %>" class="list-group-item list-group-item-action a1"><%=movie.getMovieTitle() %></a>
            	<%
            		}
            	%>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="row">
		        <div class="col-sm-6">
		            <div class="list-group overflow-auto" id="movieRegion" style="height: 300px;">
	            	<!-- 여기 지역 출력 할거임 -->
		            	<%
		            		for(TheaterDto theater : theaterRegionList) {
		            	%>
		            		<a href="#" value="<%=theater.getTheater_id() %>" class="list-group-item list-group-item-action small a2"><%=theater.getRegion() %></a>
		            	<%
		            		}
		            	%>
	            	</div>
		        </div>
		        <div class="col-sm-6">
		            <div class="list-group overflow-auto" id="movieBranch" style="height: 500px;">
		            	<!-- 여기 지점 출력 할거임 -->
		            	<%
		            		for(TheaterDto theater : theaterBranchList) {
		            	%>
		            		<a href="#" value="<%=theater.getTheater_id() %>" class="list-group-item list-group-item-action a3"><%=theater.getBranch() %></a>
		            	<%
		            		}
		            	%>
		            </div>
		        </div>
		    </div>
            
        </div>
        <div class="col-sm-2">
            <div class="list-group overflow-auto" id="screeningDate" style="height: 500px;">
            	<!-- 여기 날짜 출력 할거임 -->
            	<%
            		for(ScreeningDto screen : screenDateList) {
            	%>
            		<a href="#" value="<%=screen.getScreeningDate() %>" class="list-group-item list-group-item-action a4"><%=sdf.format(screen.getScreeningDate()) %></a>
            	<%
            		}
            	%>
            </div>
        </div>
        <div class="col-sm-4">
            <!-- 네 번째 div 내용 -->
           	<div class="list-group overflow-auto" id="screeningTime" style="height: 500px; text-align: center;">
            	<!-- 여기 시간 출력 할거임 -->
            	<span id="a4hidden">영화, 지역, 지점을 먼저 선택해 주세요.</span> 
            	<div id="screeningTime">
				    <!-- <div class="col">Column</div> -->
				</div>
            </div>
            
        </div>
    </div>
    
    <br><br><br>
    <div class="row">
		<div class="col rounded-1" style="background-color: black; width: 100%; height: 150px;">
			<div class="row row-cols-4">
				<input type="hidden" value="" name="movieId" id="movieId">
				<input type="hidden" value="" name="theaterId" id="theaterId">
				<input type="hidden" value="" name="screeningInfoId" id="screeningInfoId">
				<input type="hidden" value="" name="branch" id="branch">
<<<<<<< HEAD
				<input type="hidden" value="" name="screeningInfoId" id="screeningInfoId">
=======
				<input type="hidden" value="" name="screeningDate" id="screeningDateVal">
>>>>>>> c42704e61238c95b14073c00e487062a2c1ab066
				<div class="col-sm d-flex justify-content-center">
					<table class="table-borderless" id="writeMovie">
						<tr>
					        <td rowspan="3">
								<img src="" id="imgg">
							</td>
					        <td><span id="title">제목</span></td>
					    </tr>
					    <tr>
					        <td>상영관</td>
					    </tr>
					    <tr>
					        <td><span id="rating">등급</span></td>
					    </tr>
					</table>
				</div>
				<div class="col-sm d-flex justify-content-center">
					<table class="table-borderless" id="writeMovie">
						<tr>
							<td><span>극장</span></td>	
							<td><span id="theater"></span></td>	
						</tr>
					    <tr>
					    	<td><span>일시</span></td>	
					    	<td><span id="theaterDate"></span></td>	
					    </tr>
					    <tr>
					    	<td><span>상영관</span></td>
					    	<td><span id="theaterScreen"></span></td>
					    </tr>
					</table>
				</div>
				<div class="col-sm d-flex justify-content-center"><!-- 그냥 빈칸 -->
				</div>
				<div class="col-sm d-flex justify-content-center">
					<button type="submit" class="btn btn-dark" id="go">버튼이요</button>
				</div>
			</div>
		</div>
    </div>
    </form>
</div>
	
</body>
</html>