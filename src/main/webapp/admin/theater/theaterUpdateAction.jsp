<%@page import="data.admin.theater.Region"%>
<%@page import="data.admin.theater.TheaterDto"%>
<%@page import="data.admin.theater.TheaterDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<%
	request.setCharacterEncoding("utf-8");
	
	String theaterId = request.getParameter("theaterId");
	String region = request.getParameter("region");
	Region regionEnum=null;

	try {
		regionEnum = Region.valueOf(region);
	} catch (IllegalArgumentException e) {
	    
	}
	
	String branch = request.getParameter("branch");
	String numbarOfScreens = request.getParameter("numbarOfScreens");
	String total = request.getParameter("total");
	String address = request.getParameter("address");
	String phoneNumber = request.getParameter("phoneNumber");
	String is = request.getParameter("is");
	String[] tokens = is.split(", ");
	int is4d=0, isImax=0;
	if(tokens[0].equals("4D")) is4d=1;
	if(tokens[1].equals("IMAX")) isImax=1;
	
	System.out.println("theaterUpdateAction.jsp id = " + theaterId);
	
	TheaterDao dao = new TheaterDao();
	TheaterDto dto = new TheaterDto();
	dto.setTheaterId(theaterId);
	dto.setRegion(regionEnum);
	dto.setBranch(branch);
	dto.setNumberOfScreens(numbarOfScreens);
	dto.setTotalTheaterScreens(total);
	dto.setAddress(address);
	dto.setTheaterPhoneNumber(phoneNumber);
	dto.setIs4D(is4d);
	dto.setIsIMAX(isImax);
	
	dao.updateTheater(dto);
	
	response.sendRedirect("../adminMainPage.jsp?curr=theater/theaterMain.jsp");
%>
