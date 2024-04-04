<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
	.nav{
		cursor: pointer;
		width: 80px;
		display: inline;
	}
	
</style>
<script type="text/javascript">
// 아이디 및 비번 입력 후 로그인하게 함 => html에 작성한 것보다 좀 더 보안에 좋음
$(document).ready(function(){
	  $("#loginForm").submit(function(event){
	  	var username = $("input[name='username']").val();
        var password = $("input[name='password']").val();
	   	// event.preventDefault(); // form의 실제 제출을 방지
	    
	    if(username === "") {
            alert("아이디를 입력해주세요.");
            return false;
        } else if(password === "") {
            alert("비밀번호를 입력해주세요.");
            return false;
        } else {
            // 모든 입력이 채워져 있을 경우, 폼을 제출합니다. 
            $("form").submit();
            
        }
	  });
	});
</script>

</head>
<%
	// 로그인 되어있으면 로그인 페이지에 올 필요가 없음
	
	Enumeration<String> attributeNames = session.getAttributeNames();
	boolean isLoggedIn = false; // 로그인 여부를 저장할 변수

	while (attributeNames.hasMoreElements()) {
	    String attributeName = attributeNames.nextElement();
	    if(attributeName.equals("username")){
	    	isLoggedIn = true; // 세션에 username 속성이 있다면 로그인 상태로 판단
	    	%>
			<script type="text/javascript">
				alert("로그아웃 후 로그인을 이용해주세요.");
				window.location.href = "../index.jsp"; // 로그아웃 페이지로 리다이렉트
			</script>
			<%
            break;
	    }
	    	
	}
	
%>
<body>
	<form action="loginAction.jsp" method="post" id="loginForm">
		<span onclick="location.href='loginForm.jsp'" class="nav" style="background-color: #f04848; color: white;">로그인</span>
		<span onclick="location.href='nonReservationForm.jsp'" class="nav" style="background-color: #8c8c8c; color: white;">비회원 예매</span>
		<span onclick="location.href='#'" class="nav" style="background-color: #8c8c8c; color: white;">비회원 예매확인</span>
		<hr width="400px" style="margin-left: 0;">
		<input type="text" name="username" placeholder="아이디" ><br>
		<input type="password" name="password" placeholder="비밀번호" >
		<input type="submit" value="로그인" id="btn">
	</form>
</body>
</html>