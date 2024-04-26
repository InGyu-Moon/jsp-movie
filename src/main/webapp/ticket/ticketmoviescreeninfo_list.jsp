<%@page import="data.movie.screening.ScreeningDao"%>
<%@page import="data.movie.screening.ScreeningDto"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.sql.Date"%>
<%@page import="data.movie.theaterscreen.TheaterScreenDto"%>
<%@page import="data.movie.theaterscreen.TheaterScreenDao"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.util.List" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	System.out.println("======== ticketmoviescreeninfo_list.jsp ========");
	SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm");
	
	String branch = request.getParameter("branch");
	String screeningDateString = request.getParameter("screeningDate");
	System.out.println("branch "+ branch);
	System.out.println("screeningDateString "+ screeningDateString);
	Date screeningDate = null;
	try {
		if (screeningDateString != null && !screeningDateString.isEmpty()) {
	        // java.util.Date를 java.sql.Date로 변환
	        java.util.Date utilDate = sdfDate.parse(screeningDateString);
	        screeningDate = new java.sql.Date(utilDate.getTime());
	    }
	} catch (ParseException e) {
	    e.printStackTrace();
	}
	System.out.println("screeningDate "+ screeningDate);
	
	// JSON 데이터를 받기 위한 BufferedReader 생성
    BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
	
	// movieTitle을 배열로 변환
	String movieTitles = request.getParameter("movieTitle");
	String[] movieTitleArray = movieTitles.split(",");
	System.out.println("movieTitles "+ movieTitles);
	for(String m : movieTitleArray)
		System.out.println("movieTitleArray "+m);
		
	ScreeningDao dao = new ScreeningDao();
	JSONArray arr = new JSONArray();
	
	
    // 각각의 movieTitle에 대한 정보를 가져와서 JSONArray에 추가
    for (String movieTitle : movieTitleArray) {
    	//System.out.println(movieTitle);
    	List<ScreeningDto> slist = dao.getTheaterScreenAndScreenId(movieTitle, branch, screeningDate);
    	for(ScreeningDto s : slist) {
	    	System.out.println("slist toString  "+s.toString());
    	    JSONObject ob = new JSONObject();
    	    ob.put("movieTitle", movieTitle);
    	    ob.put("sreeningInfoId", s.getScreeningInfoId());
    	    ob.put("theaterScreenId", s.getTheaterScreenId());
    	    ob.put("theaterId", s.getTheaterId());
    	    ob.put("screeningDate", s.getScreeningDate().toString());
    	    ob.put("screeningTime", sdfTime.format(s.getScreeningTime()));
    	    ob.put("theaterScreenId", s.getTheaterScreenId());
    	    ob.put("movieId", s.getMovieId());
    	    ob.put("totalSeats", s.getTotalSeats());
    	    ob.put("screenInfo", s.getScreenInfo());
    	    ob.put("screenName", s.getScreenName());
    	    
    	    arr.add(ob);
    	    
   	    }
    }
	
%>
<%=arr.toString()%>
