<%@page import="data.admin.theater.TheaterDao"%>
<%@page import="data.admin.theater.TheaterDto"%>
<%@page import="data.admin.theater.Region"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("utf-8");
	String regionStr = request.getParameter("region");
	Region region=null;
	try {
		region = Region.valueOf(regionStr);
	} catch (IllegalArgumentException e) {
	    
	}
	
	String branch = request.getParameter("branch");
	String numberOfScreens = request.getParameter("numberOfScreens");
	String totalTheaterSeats = request.getParameter("totalTheaterSeats");
	String theaterPhoneNumber = request.getParameter("theaterPhoneNumber");
	String address = "";
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	address = address1+" "+address2+" "+address3;
	
	String is4D = request.getParameter("is_4D");
	String isIMAX = request.getParameter("is_IMAX");
	int is_4D = 0;
	int is_IMAX = 0;

	if (is4D != null && is4D.equals("on")) {
	    is_4D = 1;
	}
	if (isIMAX != null && isIMAX.equals("on")) {
	    is_IMAX = 1;
	}
	
	TheaterDto dto = new TheaterDto();
	dto.setRegion(region);
	dto.setBranch(branch);
	dto.setNumberOfScreens(numberOfScreens);
	dto.setTotalTheaterScreens(totalTheaterSeats);
	dto.setTheaterPhoneNumber(theaterPhoneNumber);
	dto.setAddress(address);
	dto.setIs4D(is_4D);
	dto.setIsIMAX(is_IMAX);
	
	TheaterDao dao = new TheaterDao();
	dao.insertTheater(dto);
	response.sendRedirect("../adminMainPage.jsp?curr=theater/theaterMain.jsp");
	
	
%>
