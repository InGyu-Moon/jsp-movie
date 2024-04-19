<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<title>비회원예매 | 영화 그 이상의 감동</title>
<body>
	<div id="wrap">
		<div class="log nonReservationForm">
			<div class="center">
				<form action="nonReservationAction.jsp" method="post" id="loginForm">
					<div class="log_nav_box">
						<span onclick="location.href='loginForm.jsp'" class="log_nav"
							style="background-color: #8c8c8c; color: white;">로그인</span> <span
							onclick="location.href='nonLoginForm.jsp'" class="log_nav"
							style="background-color: #f04848; color: white;">비회원 예매</span> <span
							onclick="location.href='#'" class="log_nav"
							style="background-color: #8c8c8c; color: white;">비회원 예매확인</span>
					</div>
					<hr>
					<div class="nonReservation_box">
						<div class="block agreement">
							<h4 class="title_h4">
								<span>STEP 1</span> 개인정보 수집 및 이용동의
							</h4>
							<p class="explanation">비회원 예매 고객계서는 먼저 개인정보 수집 및 이용 동의 정책에
								동의해 주셔야 합니다.</p>
							<table>
								<tr>
									<th>항목</th>
									<th>이용약관</th>
									<th>보유기간</th>
									<th>동의여부</th>
								</tr>
								<tr>
									<td class="bk">법적생년월일,<br> 휴대폰번호,<br> 비밀번호
									</td>
									<td>∙비회원 예매서비스 제공<br>∙이용자식별, 요금정산, 추심,<br> 신규서비스
										개발, 접속빈도 파악 등
									</td>
									<td>수집일로부터 5년</td>
									<td>
										<p class="check">
											<input type="radio" name="nonCheck" value="동의함"><label>동의함</label>
										</p>
										<p class="check">
											<input type="radio" name="nonCheck" value="동의안함" checked><label>동의안함</label>
										</p>

									</td>
								</tr>
							</table>
						</div>
						<div class="block input">
							<h4 class="title_h4">
								<span>STEP 2</span> 개인정보 입력
							</h4>

							<p class="explanation">개인정보를 잘못 입력하시면 예매내역 확인/취소 및 티켓 발권이 어려울
								수 있으므로 입력하신 정보를 다시 한 번 확인해주시기 바랍니다.</p>
							<br>
							<h5 class="gray_bg">개인정보 입력</h5>
							<div class="list">
								<p class="small">
									<small>모든 항목은 필수 입력사항입니다.</small>
								</p>
								<div class="input">
									<label>법적생년월일(8자리)</label><input type="text" name="birthdate"><span
										id="birthdate_check"></span>
								</div>
								<div class="input">
									<label>휴대폰 번호</label><select name="phone_number1">
										<option value="010" selected>010</option>
										<option value="010">011</option>
										<option value="010">017</option>
									</select> &nbsp;-&nbsp; <input type="text" name="phone_number2"
										required="required"> &nbsp;-&nbsp; <input type="text"
										name="phone_number3" required="required">

									<button type="button" id="code_get">인증번호 받기</button>
								</div>

								<div class="input">
									<label>인증번호</label><input type="text" name="verification_code">
									<button type="button" id="code_check">인증 확인</button>
								</div>
								<div class="input">
									<label>비밀번호 (4자리)</label><input type="text" name="password"
										id="password" oninput="pwCheck()"><span
										id="password_length_check"></span>
								</div>
								<div class="input">
									<label>비밀번호 확인</label> <input type="text" name="password_check"
										id="password_check" oninput="pwCheck()"><span
										id="pwConfirm"></span><input type="submit" value="비회원 예매하기"
										id="btn">
								</div>

							</div>

						</div>
						<div class="block reference">
							<div class="div">
								<div class="div_inner">
									<p class="p" id="first_p">비회원 예매 시 참고하세요!</p>

								</div>
								<div class="div_inner" id="var"></div>
								<div class="div_inner main">
									<p class="p" id="inner_p">
										<small> 1. 위 정보 수집 및 이용에 동의하지 않을 경우, 비회원 예매 서비스를 이용하실
											수 없습니다.<br> 2. 비회원 예매 시 청소년 관람불가 영환는 예매가 제한됩니다.<br>
											3. 만 14세 미만 고객은 비회원으로 예매하실 수 없습니다.<br> 4. 비회원 예매 결제수단은
											신용카드만 가능하며 모든 제휴상품권, 쿠폰, 영화예매권 등은 회원 예매 서비스 이용시 사용 가능합니다.<br>
											5. ARS에서는 취소가 불가능하며, 홈페이지/모바일을 이용하여 취소 처리하실 수 있습니다.<br>
											6. 비회원 예매 및 확인/취소 메뉴만 이용 가능합니다. 그 외 서비스는 회원 가입 후 이용해 주십시오.<br>
											7. 문의 사항은 MOVIE고객센터(1544-0000)로 문의해 주시기 바랍니다.(평일 9:00~18:00)
										</small>
									</p>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../include/footer.html"></jsp:include>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							// 법적생년월일 입력란의 값이 변경될 때마다 호출되는 함수
							$('input[name="birthdate"]').on(
									'input',
									function() {
										// 입력된 법적생년월일의 길이를 확인
										var birthdate = $(this).val();
										if (birthdate.length !== 8) {
											// 경고 메시지를 표시
											$('#birthdate_check').text(
													'법적생년월일을 8자리로 입력해주세요.')
													.css('color', 'red');
										} else {
											// 입력값이 8자리인 경우 경고 메시지를 삭제
											$('#birthdate_check').text('');
										}
									});

							// 비밀번호 입력란의 값이 변경될 때마다 호출되는 함수
							$('input[name="password"]').on(
									'input',
									function() {
										// 입력된 법적생년월일의 길이를 확인
										var password = $(this).val();
										if (password.length !== 4) {
											// 경고 메시지를 표시
											$('#password_length_check').text(
													'비밀번호를 4자리로 입력해주세요.').css(
													'color', 'red');
										} else {
											// 입력값이 8자리인 경우 경고 메시지를 삭제
											$('#password_length_check')
													.text('');
										}
									});

							var randomCode; // 랜덤 숫자를 저장할 변수

							// 인증번호 받기 버튼
							$('#code_get')
									.click(
											function() {
												// "인증번호 받기" 버튼 클릭 시 랜덤 숫자 생성 및 출력
												randomCode = Math
														.floor(1000 + Math
																.random() * 9000); // 1000부터 9999 사이의 랜덤한 숫자 생성
												alert("인증번호가 발송되었습니다. : "
														+ randomCode); // 생성된 랜덤 숫자를 알림창에 표시
											});
							// 인증번호 확인 버튼
							$('#code_check')
									.click(
											function() {
												// "인증확인" 버튼 클릭 시 입력된 인증번호와 이전에 받은 랜덤 숫자 비교
												var inputCode = $(
														'input[name="verification_code"]')
														.val(); // 입력된 인증번호 가져오기
												if (inputCode == randomCode) {
													// 입력된 인증번호와 이전에 받은 랜덤 숫자가 일치할 경우
													alert("인증되었습니다."); // 인증 완료 알림
													// 입력란 비활성화
													$(
															'input[name="verification_code"]')
															.prop('readonly',
																	true);
													$('#verification_code')
															.val(inputCode);
												} else {
													// 일치하지 않을 경우
													alert("인증번호가 일치하지 않습니다. 다시 시도해주세요."); // 인증 실패 알림
												}
											});
							// 비회원 예매하기 버튼
							$('#btn')
									.click(
											function() {

												// 각 필수 입력란에 대한 값을 가져와 변수에 할당
												var birthdate = $(
														'input[name="birthdate"]')
														.val();
												var phone_number2 = $(
														'input[name="phone_number2"]')
														.val();
												var phone_number3 = $(
														'input[name="phone_number3"]')
														.val();
												var verification_code = $(
														'input[name="verification_code"]')
														.val();
												var password = $(
														'input[name="password"]')
														.val();
												var password_check = $(
														'input[name="password_check"]')
														.val();

												// 필수 입력란 중 하나라도 작성되지 않은 경우
												if (birthdate === ''
														|| phone_number2 === ''
														|| phone_number3 === ''
														|| verification_code === ''
														|| password === ''
														|| password_check === '') {
													alert('모든 항목을 입력해주세요.');
													return false; // 기본 이벤트 중지
												}

												// 동의 여부 확인
												var nonCheckValue = $(
														'input[name="nonCheck"]:checked')
														.val();
												if (nonCheckValue !== '동의함') {
													alert('개인정보 수집 및 이용동의에 동의해주세요.');
													return false; // 기본 이벤트 중지 => action으로 진행 못하게 막음
												}

											});
						});

		function pwCheck() {
			if ($('#password').val() === $('#password_check').val()) {
				$('#pwConfirm').text('비밀번호 일치').css('color', 'green')
				$("#pwConfirm").show();
			} else {
				$('#pwConfirm').text('비밀번호 불일치').css('color', 'red')
				$("#pwConfirm").show();
			}
		}

	</script>
</body>
</html>