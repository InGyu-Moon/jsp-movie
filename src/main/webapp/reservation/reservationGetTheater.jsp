<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.theater.info.TheaterDto"%>
<%@page import="data.theater.info.TheaterDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	String movieId = request.getParameter("movieId");
	String theaterId = request.getParameter("theaterId");
	
	TheaterDao dao = new TheaterDao();
	List<TheaterDto> theaterList = dao.getBranchListByRegion(movieId);
	System.out.println(theaterList.toString());
	
	JSONArray arr = new JSONArray();
	for(TheaterDto theater : theaterList){
		JSONObject ob = new JSONObject();
		ob.put("branch", theater.getBranch());
		ob.put("theaterId", theater.getTheater_id());
		
		arr.add(ob);
	}

%>
<%=arr.toString() %>
