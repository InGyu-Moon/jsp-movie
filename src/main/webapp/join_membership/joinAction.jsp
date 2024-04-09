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
	
	String userName = request.getParameter("username");
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
	    gender = Gender.valueOf(genderString.toUpperCase());
	}

	String number1 = request.getParameter("phone_number1");
	String number2 = request.getParameter("phone_number2");
	String number3 = request.getParameter("phone_number3");
	String phoneNumber = number1+"-"+number2+"-"+number3;
	
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1+"@"+email2;
	
	String postCode = request.getParameter("address0"); // 우편번호
	String address1 = request.getParameter("address1"); // 우편번호
	String address2 = request.getParameter("address2"); // 우편번호
	String address3 = request.getParameter("address3"); // 우편번호
	String address = address1+" "+address2+" "+address3;
	
	String user_photo = request.getParameter("user_photo"); // 우편번호

	MemberDao dao = new MemberDao();
	MemberDto member = new MemberDto();
	member.setUserName(userName);
	member.setPassword(password);
	member.setName(name);
	member.setBirthdate(birthdate);
	member.setGender(gender);
	member.setPhoneNumber(phoneNumber);
	member.setEmail(email);
	member.setAddress(address);
	member.setUserPhoto(user_photo);
	
	dao.insertMember(member);
	
	response.sendRedirect("../log/loginForm.jsp");

%>
</body>
</html>