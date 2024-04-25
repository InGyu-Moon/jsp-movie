<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<title>비회원예매확인 | 영화 그 이상의 감동</title>
<body>
	<div id="wrap">
		<div class="log nonReservationForm">
			<div class="center">
				<form action="nonReservationCheckAction.jsp" method="post" id="loginForm">
					<div class="log_nav_box">
						<span onclick="location.href='loginForm.jsp'" class="log_nav"
							style="background-color: #8c8c8c; color: white;">로그인</span> <span
							onclick="location.href='nonReservationForm.jsp'" class="log_nav"
							style="background-color: #8c8c8c; color: white;">비회원 예매</span> <span
							onclick="location.href='nonReservationCheckForm.jsp'" class="log_nav"
							style="background-color: #f04848; color: white;">비회원 예매확인</span>
					</div>
					<hr>
					<div class="nonReservation_box">
						<!-- <div class="block agreement"> -->
						<div class="block input">
							<h4 class="title_h4">
								비회원 예매 확인
							</h4>
							<p class="explanation">
								비회원으로 예매하신 고객님은 개인정보(법정생년월일, 휴대폰 번호, 비밀번호(4자리)를 입력해 주세요.
							</p><br>
							<h5 class="gray_bg">비회원 예매확인</h5>
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

								</div>
								<div class="input">
									<label>비밀번호</label><input type="text" name="password"
										id="password" oninput="pwCheck()"><span
										id="password_length_check"></span>
								</div>
							<br>
							<button type="submit" id="nonmember_check">비회원 예매확인</button>
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

							// 비회원 예매하기 버튼
							$('#nonmember_check')
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
												var password = $(
														'input[name="password"]')
														.val();

												// 필수 입력란 중 하나라도 작성되지 않은 경우
												if (birthdate === ''
														|| phone_number2 === ''
														|| phone_number3 === ''
														|| password === '') {
													alert('모든 항목을 입력해주세요.');
													return false; // 기본 이벤트 중지
												}

											});
						});

	</script>
</body>
</html>