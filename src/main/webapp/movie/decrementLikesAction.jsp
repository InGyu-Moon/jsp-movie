<%@page import="data.movie.review.ReviewLikeDto"%>
<%@page import="data.movie.review.ReviewLikeDao"%>
<%@page import="data.movie.review.ReviewInfoDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String reviewId=request.getParameter("reviewId");
	String memberId =request.getParameter("memberId");

	ReviewLikeDao ldao = new ReviewLikeDao();
	ReviewInfoDao dao=new ReviewInfoDao();
	dao.decrementLikes(reviewId);
	ldao.likeDelete(reviewId, memberId);

	int likes=dao.getLikesCount(reviewId);
	JSONObject ob=new JSONObject();
	boolean ok = ldao.getLikeData(reviewId, memberId);
			
	if(ok){
		ob.put("likes", likes);		
	}else{
		ob.put("likes", likes);
		ob.put("reviewId", reviewId);
	}
	
%>
<%=ob.toString()%>