<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<title>회원가입 | 영화 그 이상의 감동</title>
<body>

	<div id="wrap">
		<div id="join_form">
			<div class="center">
				<div class="head_title">
					<span>회원가입</span>
				</div>
				<form action="joinAction.jsp" method="post">
					<div class="block">
						<label>아이디</label> <input type="text" name="username"
							id="username" required="required" placeholder="아이디 입력">
						<button type="button" id="btnIdCheck">중복체크</button>
						<span class="idsuccess"></span>
					</div>
					<div class="block">
						<label>비밀번호</label><input type="password" name="password"
							id="password" oninput="pwCheck()" required="required"
							placeholder="비밀번호 입력"> <span id="pwConfirm">비밀번호를
							입력하세요</span>
					</div>
					<div class="block">
						<label>비밀번호 확인</label><input type="password" name="ckeck_password"
							id="ckeck_password" oninput="pwCheck()" required="required"
							placeholder="비밀번호 확인">
					</div>
					<div class="block">
						<label>회원 이름</label><input type="text" name="name"
							required="required" placeholder="이름">
					</div>
					<div class="block day">
						<label>생년월일 / 성별</label><input type="date" name="birthdate">
						<div class="day_radio">
							<input type="radio" name="gender" value="Male" class="radio"
								checked><label>남성</label> <input type="radio"
								name="gender" value="Female" class="radio"><label>여성</label><input
								type="radio" name="gender" value="Other" class="radio"><label>비공개</label>
						</div>

					</div>
					<div class="block phone">
						<label>휴대폰 번호</label><select name="phone_number1">
							<option value="010" selected>010</option>
							<option value="010">011</option>
							<option value="010">017</option>
						</select> - <input type="text" name="phone_number2" required="required"
							class="phone1"> - <input type="text" name="phone_number3"
							required="required" class="phone2">
					</div>
					<div class="block email">
						<label>이메일</label><input type="text" name="email1"
							placeholder="이메일" required="required" class="email1"> @ <input
							type="text" name="email2" value="" class="email2"> <select
							id="email_selected">
							<option class="select" value="" selected>선택</option>
							<option class="select" value="naver.com">네이버</option>
							<option class="select" value="daum.net">다음</option>
							<option class="select" value="gmail.com">구글</option>
							<option class="select" value="직접입력">직접입력</option>
						</select>
					</div>
					<div class="block post">
						<label>우편번호</label><input type="text" id="sample6_postcode"
							name="address0" required="required" placeholder="우편번호"> <input
							type="button" onclick="sample6_execDaumPostcode()"
							value="우편번호 찾기" class="search"><input type="text"
							id="sample6_address" placeholder="주소" name="address1">
					</div>
					<div class="block address">
						<label>상세주소</label> <input type="text" id="sample6_detailAddress"
							name="address2" placeholder="상세주소"> <input type="text"
							id="sample6_extraAddress" name="address3" placeholder="참고항목">
					</div>
					<input type="hidden" name="user_photo" value="../img/회원.png">

					<div class="sign_up_btn">
						<input type="submit" value="회원가입">
					</div>

				</form>
			</div>
		</div>
	</div>



	<jsp:include page="../include/footer.html"></jsp:include>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		$(function() {
			//아이디 중복체크
			$("#btnIdCheck").click(
					function() {

						// 아이디 읽기
						var username = $("#username").val();
						//alert(username);
						$.ajax({
							type : "get",
							url : "idCkeck.jsp",
							dataType : "json",
							data : {
								"username" : username
							},
							success : function(data) {

								//alert(data.count);
								if (data.count == 1) {
									//alert("이미 가입된 아이디입니다\n다시입력해 주세요");
									$("span.idsuccess").text("아이디 중복").css(
											"color", "red");
									$("#username").val("");
								} else {
									//alert("가입이 가능한 아이디입니다");
									$("span.idsuccess").text("아이디 사용가능").css(
											"color", "green");
								}
							}
						})
					});
		})

		$(document).ready(
				function() {
					// email_selected select 요소의 값이 변경될 때 이벤트 처리
					$("#email_selected").change(
							function() {
								// 선택된 option의 값(value) 가져오기
								var selectedValue = $(this).val();

								// 만약 선택된 값이 "직접입력"이라면
								if (selectedValue === "직접입력") {
									// email2 input 요소를 활성화하여 수정 가능하도록 변경
									// disabled 속성이 적용된 input 요소는 폼 데이터로 전송되지 않음
									$("input[name='email2']").prop("readonly",
											false).val(""); // value 속성 변경
								} else {
									// 선택된 값이 "직접입력"이 아니라면
									// email2 input 요소를 비활성화하고, 빈 값으로 설정
									// disabled 속성이 적용된 input 요소는 폼 데이터로 전송되지 않음
									$("input[name='email2']").prop("readonly",
											true).val(selectedValue); // value 속성 변경
								}
							});
				});

		$(document).ready(function() {
			// pwConfirm 요소를 숨김
			$("#pwConfirm").hide();
		});
		function pwCheck() {

			if ($('#password').val() == $('#ckeck_password').val()) {
				$('#pwConfirm').text('비밀번호 일치').css('color', 'green')
				$("#pwConfirm").show();
			} else {
				$('#pwConfirm').text('비밀번호 불일치').css('color', 'red')
				$("#pwConfirm").show();
			}
		}
	</script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>
</body>
</html>