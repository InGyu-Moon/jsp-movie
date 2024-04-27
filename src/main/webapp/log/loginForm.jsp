<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<title>로그인 | 영화 그 이상의 감동</title>
<body>
	<div id="wrap">
		<div class="log loginForm">
			<div class="center">
				<form action="loginAction.jsp" method="post" id="loginForm">
					<div class="log_nav_box">
						<span onclick="location.href='loginForm.jsp'" class="log_nav"
							style="background-color: #f04848; color: white;">로그인</span> <span
							onclick="location.href='nonReservationForm.jsp'" class="log_nav"
							style="background-color: #8c8c8c; color: white;">비회원 예매</span> <span
							onclick="location.href='nonReservationCheckForm.jsp'" class="log_nav"
							style="background-color: #8c8c8c; color: white;">비회원 예매확인</span>
					</div>


					<hr width="400px" style="margin-left: 0;">
					<div class="login_box">
						<div>
							<div class="title">
								<span>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</span>
							</div>
							<div class="input id">
								<input type="text" name="username" placeholder="아이디">
							</div>
							<div class="input pass">
								<input type="password" name="password" placeholder="비밀번호">
							</div>
							<div class="input btn">
								<input type="submit" value="로그인" id="btn">
							</div>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>


	<jsp:include page="../include/footer.html"></jsp:include>
	<script type="text/javascript">
		// 아이디 및 비번 입력 후 로그인하게 함 => html에 작성한 것보다 좀 더 보안에 좋음
		$(document).ready(function() {
			$("#loginForm").submit(function(event) {
				var username = $("input[name='username']").val();
				var password = $("input[name='password']").val();
				// event.preventDefault(); // form의 실제 제출을 방지

				if (username === "") {
					alert("아이디를 입력해주세요.");
					return false;
				} else if (password === "") {
					alert("비밀번호를 입력해주세요.");
					return false;
				} else {
					// 모든 입력이 채워져 있을 경우, 폼을 제출합니다. 
					$("form").submit();

				}
			});
		});
	</script>
	<%
	// 로그인 되어있으면 로그인 페이지에 올 필요가 없음

	Enumeration<String> attributeNames = session.getAttributeNames();
	boolean isLoggedIn = false; // 로그인 여부를 저장할 변수

	while (attributeNames.hasMoreElements()) {
		String attributeName = attributeNames.nextElement();
		if (attributeName.equals("username")) {
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
</body>
</html>