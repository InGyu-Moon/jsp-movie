<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="data.movie.chart.MovieInfoDao"%>
<%@page import="data.movie.chart.MovieInfoDto"%>
<%@page import="data.movie.chart.MovieImgDto"%>
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
	tr {
		text-align: center;
	}
	a {  
		text-align: center;  
		text-decoration: none; /* 링크의 밑줄 제거 */  
		color: inherit; /* 링크의 색상 제거 */
	}
	a:focus, 
	a:hover {
	    font-weight: bold;
	}
	a:focus{
		text-decoration: underline;	
	}
	
</style>
</head>
<%
	MovieInfoDao movieDao = new MovieInfoDao();
	List<MovieInfoDto> movieList = new ArrayList();
	movieList = movieDao.getThreeMovieData();
	movieList = movieDao.getElseMovieData();
%>
<body>
	<div>
		<div>
			<table class="table table-borderless" style="width:50%; margin:80px;">
				<tr>
					<th colspan="2" class="table-dark" style="text-align: center;" >영화</th>
				</tr>
				<tr>
					<td><a href="#">전체</a></td>
					<td><a href="#">특별관</a></td>
				</tr>
				<tr>
					<td><a href="#">예매율순</a></td>
					<td><a href="#">가나다순</a></td>
				</tr>
				<%
				for(MovieInfoDto movie : movieList) {
				%>
				<tr>
					<td><%=movie.getViewingRating() %></td>
					<td><%=movie.getMovieTitle() %></td>
				</tr>		
				<%
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>