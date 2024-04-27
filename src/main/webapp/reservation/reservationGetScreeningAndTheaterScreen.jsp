<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.movie.screening.ScreeningDto"%>
<%@page import="java.util.List"%>
<%@page import="data.movie.screening.ScreeningDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy.MM.dd(E¿äÀÏ)");
	SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
	String branch = request.getParameter("branch");
	String movieId = request.getParameter("movieId");
	
	ScreeningDao dao = new ScreeningDao();
	List<ScreeningDto> screenList = dao.getScreeningAndTheaterScreen(branch, movieId);
	System.out.println(screenList.toString());
	
	JSONArray arr = new JSONArray();
	for(ScreeningDto screen : screenList){
		JSONObject ob = new JSONObject();
		ob.put("screeningInfoId", screen.getScreeningInfoId());
		ob.put("screeningDate", sdf1.format(screen.getScreeningDate()));
		ob.put("screeningTime", sdf2.format(screen.getScreeningTime()));
		ob.put("screenInfo", screen.getScreenInfo());
		ob.put("screenName", screen.getScreenName());
		
		arr.add(ob);
	}

%>
<%=arr.toString() %>