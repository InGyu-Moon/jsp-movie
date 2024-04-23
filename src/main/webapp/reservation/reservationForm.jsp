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
</style>

<script>
$(document).ready(function() {
	var movieId; // 영화id
	var theaterId; // 지역id
	
	/* $(".a2").each(function() {
        var region = $(this).text().trim(); // 현재 지역의 텍스트 가져오기

        // 만약 지역이 "서울"이면 배경색과 글꼴 색상 변경
        if (region === "서울") {
        	$(this).css({
                "background-color": "black",
                "color": "white"
            });
        }
    }); */
	
	// a 태그 클릭 시 함수 호출
    $(".a1").click(function(event) {
        event.preventDefault(); // 링크의 기본 동작을 막음
        movieId = $(this).attr("value"); // 클릭된 영화 제목 가져오기
        // 함수 호출 및 값 전달
        getMovieId(movieId); // yourFunction은 호출할 함수 이름입니다.
    });
    $(".a2").click(function(event) {
        event.preventDefault(); // 링크의 기본 동작을 막음
        theaterId = $(this).attr("value"); // 선택된 극장 ID 가져오기
       // var movieId = $("a.list-group-item.a1.active").attr("value"); // 현재 선택된 영화 ID 가져오기
        // 함수 호출 및 값 전달
        getMovieIdAndRegionId(movieId, theaterId); // yourFunction은 호출할 함수 이름입니다.
    });

    // getMovieId 구현
    function getMovieId(id) {
        console.log("클릭된 영화 아이디: " + id);
        // 여기에 원하는 동작을 구현하세요
    }
    // getMovieId 구현
    function getMovieIdAndRegionId(movieId, theaterId) {
        console.log("클릭된 영화와 지역 아이디: " + movieId+ ", " + theaterId);
        // 여기에 원하는 동작을 구현하세요
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
	<form action="#" method="post">
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
	            		<a href="#" class="list-group-item list-group-item-action a3"><%=sdf.format(screen.getScreeningDate()) %></a>
	            	<%
	            		}
	            	%>
	            </div>
	        </div>
	        <div class="col-sm-4">
	            <!-- 네 번째 div 내용 -->
            	<div class="list-group overflow-auto" id="screeningTime" style="height: 500px; text-align: center;">
	            	<!-- 여기 시간 출력 할거임 -->
	            	영화, 지역, 지점을 먼저 선택해 주세요.
	            </div>
	            
	        </div>
	    </div>
    </form>
</div>
	
</body>
</html>