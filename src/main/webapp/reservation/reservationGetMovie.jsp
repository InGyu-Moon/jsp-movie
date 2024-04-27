<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.movie.chart.MovieInfoDto"%>
<%@page import="data.movie.chart.MovieInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String movieId = request.getParameter("movieId");

	MovieInfoDao dao = new MovieInfoDao();
	MovieInfoDto movie = dao.getData(movieId);
	
	JSONObject ob = new JSONObject();
	ob.put("movieId", movie.getMovieId());
	ob.put("movieTitle", movie.getMovieTitle());
	ob.put("viewingRating", movie.getViewingRating());
	ob.put("movieImg", movie.getMovieImg());
%>
<%=ob.toString() %>