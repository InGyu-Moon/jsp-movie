<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="data.theater.info.TheaterDto" %>
<%@ page import="data.theater.info.TheaterDao" %>
<%@ page import="java.util.List" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String branch = request.getParameter("branch");
String screeningDate = request.getParameter("screeningDate");

// movieTitle을 배열로 변환
String[] movieTitles = request.getParameterValues("movieTitle");

TheaterDao dao = new TheaterDao();
JSONArray arr = new JSONArray();
// SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

// movieTitles가 null인지 확인하여 처리
if (movieTitles != null) {
    // 각각의 movieTitle에 대한 정보를 가져와서 JSONArray에 추가
    for (String movieTitle : movieTitles) {
        List<TheaterDto> tmlist = dao.theaterTheaterList(branch, screeningDate, movieTitle);
        for (TheaterDto dto : tmlist) {
            JSONObject ob = new JSONObject();
            ob.put("branch", dto.getBranch());
            ob.put("screeningDate", dto.getScreeningDate().toString());
            ob.put("movieTitle", dto.getMovieTitle());
            ob.put("screenInfo", dto.getScreenInfo());
            ob.put("screenName", dto.getScreenName());
            ob.put("totalSeats", dto.getTotalSeats());

            arr.add(ob);
        }
    }
}
%>
<%=arr.toString()%>
