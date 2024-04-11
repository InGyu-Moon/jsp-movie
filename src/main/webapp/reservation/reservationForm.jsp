<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<title>영화 예매 사이트</title>
<style type="text/css">
	.all-body{
		margin: 70px;
		width: 1000px;
		height: 1000px;
		background-color: #f0dcc0;
	}
	#var{
		margin-left:0px;
		width:2px;
		border-left : thin solid black;
  		height : 990px;
		display: inline-block;
	}
	.div_inner {
	    float: left;
	    text-align: left;
	}
	
	.body1 {
	    width: calc(25% - 10px); /* 25% - (2 * 5px 마진) */
	    margin-right: 10px; /* 마진 추가 */
	}
	
	.body2 {
	    width: calc(25% - 10px);
	    margin-right: 10px;
	}
	
	.body3 {
	    width: calc(12.5% - 5px); /* 12.5% - (1 * 5px 마진) */
	    margin-right: 10px; /* 마진 추가 */
	}
	
	.body4 {
	    width: calc(33.33% - 5px); /* 33.33% - (2 * 5px 마진) */
	    margin-right: 0px; /* 마진 추가 */
	}
	.nav{
		cursor: pointer;
		width: 80px;
		display: inline;
	}
		
		
	
</style>
</head>
<body>
	<div class="all-body">
		<!-- 영화 -->
		<div class="body1 div_inner">
			<!-- 타이틀 -->
			<div style="width:350px;height: 80px; background-color: black;">
				<span style="color: white;" >영화</span>
			</div>
			<!-- 내용 -->
			<div>
				<span onclick="location.href='#'" class="nav" style="color: black;margin: 30px 0px 0px 30px;border: 1px solid black;">전체</span>
				<span onclick="location.href='#'" class="nav" style="color: black;">특별관</span>
				<hr width="200px" style="margin-left: 0; margin-top: 2px;">
				<span style="margin-left: 20px; border-bottom: solid 3px black;">예매율순</span>
				<span style="margin-left: 20px;">가나다순</span><br><br>
				
				<button type="button" onclick="location.href='dataCheck.jsp'" >제목 밑 링크 얻어오기</button>
			</div>
		</div>
		<div class="div_inner" id="var" style="background-color: white;"></div>
		
		<!-- 극장 -->
		<div class="body2 div_inner">
			<div style="width:350px;height: 80px; background-color: black;">
				<span style="color: white;" >극장</span>
			</div>
		</div>
		<div class="div_inner" id="var" style="background-color: white;"></div>
		
		<!-- 날짜 -->
		<div class="body3 div_inner">
			<div style="width:130px;height: 80px; background-color: black;">
				<span style="color: white;" >날짜</span>
			</div>
		</div>
		<div class="div_inner" id="var" style="background-color: white;"></div>
		
		<!-- 시간 -->
		<div class="body4 div_inner">
			<div style="width:350px;height: 80px; background-color: black;">
				<span style="color: white;" >시간</span>
			</div>
		</div>
	</div>
</body>
</html>