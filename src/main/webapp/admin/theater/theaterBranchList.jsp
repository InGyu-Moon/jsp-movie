<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="data.admin.theater.TheaterDto"%>
<%@page import="data.admin.theater.TheaterDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	//String region = request.getParameter("region");
	String branch = request.getParameter("branch");
	
	TheaterDao dao = new TheaterDao();
	List<TheaterDto> theaterRegionList = dao.searchBranch(branch);
			
	
	JSONArray jsons = new JSONArray();
	for (TheaterDto theater : theaterRegionList) {
		JSONObject ob = new JSONObject();
		ob.put("theaterId", theater.getTheaterId());
		ob.put("region", theater.getRegion());
		ob.put("branch", theater.getBranch());
		ob.put("numberOfScreens", theater.getNumberOfScreens());
		ob.put("totalTheaterSeats", theater.getTotalTheaterScreens());
		ob.put("address", theater.getAddress());
		ob.put("theaterPhoneNumber", theater.getTheaterPhoneNumber());
		ob.put("isIMAX", theater.getIsIMAX());
		ob.put("is4D", theater.getIs4D());
		ob.put("img", theater.getTheaterImg());
	
		jsons.add(ob);
	}
%>
<%=jsons.toString()%>