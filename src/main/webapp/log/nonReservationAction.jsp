<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="user.nonmember.NonMemberDao"%>
<%@page import="user.nonmember.NonMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<title>비회원 예매 확인 중...</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String birthdateStr = request.getParameter("birthdate");
	String birth1 = birthdateStr.substring(0, 4);
	String birth2 = birthdateStr.substring(4, 6);
	String birth3 = birthdateStr.substring(6, 8);
	/* System.out.println("birth1 "+birth1);
	System.out.println("birth2 "+birth2);
	System.out.println("birth3 "+birth3); */
	birthdateStr = birth1+"-"+birth2+"-"+birth3;
	
	Date birthdate = null;
	try {
	    // 문자열의 날짜 형식을 지정
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    // 문자열을 Date 타입으로 파싱
	    java.util.Date utilDate  = sdf.parse(birthdateStr); // Util로 사용
	    /* System.out.println("sdf.parse(birthdateStr) : "+sdf.parse(birthdateStr));
	    System.out.println("utilDate : "+utilDate); */
	 	// java.util.Date를 java.sql.Date로 변환
	    birthdate = new java.sql.Date(utilDate.getTime()); // sql로 사용
	    
	} catch (Exception e) {
	    // 날짜 파싱 중 에러 처리
	    e.printStackTrace();
	}
	
	String phone_number1 = request.getParameter("phone_number1");
	String phone_number2 = request.getParameter("phone_number2");
	String phone_number3 = request.getParameter("phone_number3");
	String phoneNumber = phone_number1+"-"+phone_number2+"-"+phone_number3;
	
	int verificationCode = Integer.parseInt(request.getParameter("verification_code"));
	String password = request.getParameter("password");
	
	NonMemberDao dao = new NonMemberDao();
	NonMemberDto nonMember = new NonMemberDto();
	nonMember.setBirthdate(birthdate);
	nonMember.setPhoneNumber(phoneNumber);
	nonMember.setVerificationCode(verificationCode);
	nonMember.setPassword(password);
	
	boolean nonMemberOk = dao.insertNonMember(nonMember);
	if(nonMemberOk){
		// 비회원 예매 성공 시
		HttpSession loginSession = request.getSession(); // 세션 생성
		loginSession.setAttribute("verificationCode", verificationCode); // 인증코드 세션
		loginSession.setAttribute("nonPassword", password); // 비회원 비밀번호 세션
		
		loginSession.setMaxInactiveInterval(30*60); // 30분
		
		// 메인으로 이동
		response.sendRedirect("../index.jsp");
	} else{
		// 로그인 실패 시 메시지 출력
	%>
		<script>
			alert("로그인 실패. 아이디 또는 비밀번호를 확인하세요.");
			window.history.back(); // 이전 페이지로 이동
		</script>
	<%
	}
%>
</body>
</html>