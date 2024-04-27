<%@page import="data.user.member.MemberDao"%>
<%@page import="data.movie.review.ReviewInfoDao"%>
<%@page import="data.movie.review.ReviewInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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