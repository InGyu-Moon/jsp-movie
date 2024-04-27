<%@page import="data.theater.info.TheaterDto"%>
<%@page import="data.theater.info.TheaterDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String region = request.getParameter("region");
System.out.println("test"+region);
//System.out.println(branch);
TheaterDao dao = new TheaterDao();
TheaterDto dto = new TheaterDto();

List<String> addresses = dao.addressList(region);
// JSON 형식으로 데이터 반환
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");
// JSON 데이터 생성
StringBuilder json = new StringBuilder();
json.append("{\"addresses\": [");
for (int i = 0; i < addresses.size(); i++) {
	json.append("\"").append(addresses.get(i)).append("\"");
	if (i < addresses.size() - 1) {
		json.append(",");
	}
}
json.append("]}");
// JSON 데이터 전송
out.print(json.toString());
%>