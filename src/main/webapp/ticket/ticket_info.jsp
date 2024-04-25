
<%@page import="data.theater.info.TheaterDto"%>
<%@page import="data.theater.info.TheaterDao"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String branch = request.getParameter("branch");

TheaterDao dao = new TheaterDao();
TheaterDto dto = dao.theaterList(branch);

String address = dto.getAddress();
String phone = dto.getTheaterPhoneNumber();
String img = dto.getImg();
String screens = dto.getNumberOfScreens();
String seat = dto.getTotalTheaterSeats();
int theater_4d = dto.getIs4D();
int theater_imax = dto.getIsIMAX();
JSONObject ob = new JSONObject();

ob.put("branch", branch);
ob.put("address", address);
ob.put("phone", phone);
ob.put("screens", screens);
ob.put("seat", seat);
ob.put("img", img);
ob.put("theater_4d", theater_4d);
ob.put("theater_imax", theater_imax);
%>
<%=ob.toString()%>
