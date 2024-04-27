<%@page import="java.text.ParseException"%>
<%@page import="java.sql.Date"%>
<%@page import="data.movie.screening.ScreeningDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="data.movie.screening.ScreeningDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    request.setCharacterEncoding("utf-8");
    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
    SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
    String branch = request.getParameter("branch");
    String movieId = request.getParameter("movieId");
    String screeningDateString = request.getParameter("screeningDate");
    
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
    
    ScreeningDao dao = new ScreeningDao();
    List<ScreeningDto> screenList = dao.getScreeningTime(movieId, branch, screeningDate);
    System.out.println(screenList.toString());
    
    JSONArray arr = new JSONArray();
    for(ScreeningDto screen : screenList){
        JSONObject ob = new JSONObject();
        ob.put("screeningInfoId", screen.getScreeningInfoId());
        ob.put("screeningTime", sdf.format(screen.getScreeningTime()));
        ob.put("screenInfo", screen.getScreenInfo());
        ob.put("screenName", screen.getScreenName());
        
        arr.add(ob);
    }

%>
<%=arr.toString() %>
