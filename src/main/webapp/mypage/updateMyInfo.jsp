<%@page import="data.user.member.MemberDao"%>
<%@page import="data.user.member.Gender"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="data.user.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 post</title>
</head>
<body>

<%
	response.setCharacterEncoding("utf-8");
	int memberId = Integer.parseInt(request.getParameter("memberId"));
	String userName = request.getParameter("nick_name");
	String password = request.getParameter("password");
	String ckeck_password = request.getParameter("ckeck_password");
	String name = request.getParameter("name");
	String birthdateStr = request.getParameter("birthdate"); // 넘오는건 String 형식임
	Date birthdate = null;
	try {
	    // 문자열의 날짜 형식을 지정
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    // 문자열을 Date 타입으로 파싱
	    java.util.Date utilDate  = sdf.parse(birthdateStr); // Util로 사용
	 	// java.util.Date를 java.sql.Date로 변환
	    birthdate = new java.sql.Date(utilDate.getTime()); // sql로 사용
	    
	} catch (Exception e) {
	    // 날짜 파싱 중 에러 처리
	    e.printStackTrace();
	}
	
	String genderString = request.getParameter("gender");
	Gender gender = null;

	if (genderString != null && !genderString.isEmpty()) {
		 // 첫 글자를 대문자로 변환. 나머진 소문자
	    genderString = genderString.substring(0, 1).toUpperCase() + genderString.substring(1).toLowerCase();
	    try {
	        gender = Gender.valueOf(genderString);
	    } catch (IllegalArgumentException e) {
	        // 예외 처리: 올바르지 않은 성별 값 처리
	    }
	}

	String number1 = request.getParameter("phone_number1");
	String number2 = request.getParameter("phone_number2");
	String number3 = request.getParameter("phone_number3");
	String phoneNumber = number1+"-"+number2+"-"+number3;
	
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1+"@"+email2;
	
	String postCode = request.getParameter("address0");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	String address = address1+" "+address2+" "+address3;
	

	MemberDao dao = new MemberDao();
	MemberDto member = new MemberDto();
	member.setId(memberId);
	member.setUserName(userName);
	member.setPassword(password);
	member.setName(name);
	member.setBirthdate(birthdate);
	member.setGender(gender);
	member.setPhoneNumber(phoneNumber);
	member.setEmail(email);
	member.setAddress(address);
	
	dao.updateMember(member);
	
	response.sendRedirect("myHome.jsp");

%>
</body>
</html>