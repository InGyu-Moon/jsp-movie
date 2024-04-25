<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.theater.info.TheaterDto"%>
<%@page import="data.theater.info.TheaterDao"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String branch = request.getParameter("branch");
String screeningDate = request.getParameter("screeningDate");

TheaterDao dao = new TheaterDao();
List<TheaterDto> tmlist = dao.theaterMovieList(branch, screeningDate);

JSONArray arr=new JSONArray();
//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

for(TheaterDto dto:tmlist)
{
   JSONObject ob=new JSONObject();
   ob.put("branch", dto.getBranch());
   ob.put("screeningDate", dto.getScreeningDate().toString());
   ob.put("movieTitle", dto.getMovieTitle());
   ob.put("genre", dto.getGenre());
   ob.put("runnungTime", dto.getRunningTime());
   ob.put("viewingRating", dto.getViewingRating());
   ob.put("releaseDate", dto.getReleaseDate().toString());

   arr.add(ob);
}

%>
<%=arr.toString()%>
