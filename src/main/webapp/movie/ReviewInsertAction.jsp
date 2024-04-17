<%@page import="data.user.member.MemberDao"%>
<%@page import="data.movie.review.ReviewInfoDao"%>
<%@page import="data.movie.review.ReviewInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>

<%
	String movieId = request.getParameter("movieId");
	String reviewContent = request.getParameter("reviewContent");
	double rating = Double.parseDouble(request.getParameter("rating"));
	String memberId = request.getParameter("memberId");
	
	ReviewInfoDto dto = new ReviewInfoDto();
	dto.setId(memberId);
	dto.setMovieId(movieId);
	dto.setReviewContent(reviewContent);
	dto.setRating(rating);
	
	ReviewInfoDao dao = new ReviewInfoDao();
	dao.insertReview(dto);
	

	
%>
</body>
</html>