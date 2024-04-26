<%@page import="data.user.member.Gender"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="data.user.member.MemberDto"%>
<%@page import="data.user.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<title>마이페이지 | 영화 그 이상의 감동</title>
<%
String username = (String) session.getAttribute("username");
MemberDao mdao = new MemberDao();
int memberId = mdao.getMemberIdByUsername(username);
MemberDto dto = mdao.getMemberById(memberId);
%>
<body>
	<div id="wrap">
		<div class="center">
			<div id="myhome" class="myinfoedit">
				<!-- 컨텐츠 시작 -->
				<div class="set-common">
					<div class="my-info-wrap">
						<div class="set-person-info">
							<div class="box-image">
								<span class="thumb-image"> <img
									src="<%=dto.getUserPhoto()%>"> <span class="profile-mask"></span>
								</span>
							</div>
							<div class="box-contents newtype">
								<div class="person-info">
									<strong> <!-- 로그인한 유저 NAME--><%=dto.getName()%><span>님</span>
									</strong> <em> <!-- 로그인한 유저 USERNAME --><%=username%></em>
									<button id="go_edit_page" type="button"
										onclick="location.href='myProfileEdit.jsp'">나의 정보 변경</button>
								</div>
								<div class="grade-info">
									<p>
										고객님은 총 <a href="myReserve.jsp"
											style="color: #fb4357; font-weight: bold;">0</a>개의 영화를
										예매했습니다.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="cols-content" id="menu">
					<div class="col-aside">
						<div class="snb">
							<ul>
								<li><a href="myHome.jsp">MY HOME<i></i></a></li>
								<li><a href="myReserve.jsp">나의 예매내역 <i></i></a>
									<ul>
										<li><a href="myReserve.jsp">예매내역 확인</a></li>
									</ul></li>
								<li class="on"><a href="myInfoEdit.jsp">회원정보<i></i></a>
									<ul>
										<li><a href="myInfoEdit.jsp" style="color: #fb4357;">개인정보
												변경</a></li>
										<li><a href="myInfoLeave.jsp">회원탈퇴</a></li>
									</ul></li>
								<li><a href="myProfileEdit.jsp">프로필 관리<i></i></a></li>
								<li><a href="myInquiry.jsp">나의 문의내역 <i></i></a>
									<ul>
										<li><a href="myInquiry.jsp">1:1 문의</a></li>
									</ul></li>
								<li class="my-movie"><a href="javascript:;">내가 본 영화<span
										style="margin-left: 38px;">↗️</span>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="col-detail" id="mycgv_contents">
						<div class="tit-mycgv">
							<h3>회원정보 수정</h3>
						</div>
						<div class="tit-mycgv">
							<h4>회원님의 소중한 정보를 안전하게 관리하세요.</h4>
						</div>
						<form name="aspnetForm" method="post" action="updateMyInfo.jsp"
							id="aspnetForm">
							<div class="tbl-form">
								<table>
									<colgroup>
										<col width="19%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">이름</th>
											<td><input type="text" name="name" required="required"
												placeholder="이름" value="<%=dto.getName()%>"></td>
										</tr>
										<tr>
											<th scope="row"><label for="nick_name">아이디</label></th>
											<td class="td_id"><input type="hidden" id="memberId"
												name="memberId" value="<%=memberId%>"> <input
												type="hidden" id="old_nick_name" name="old_nick_name"
												value="<%=username%>"> <input type="text"
												id="nick_name" name="nick_name" value="<%=username%>"
												required="required" maxlength="10" class="s-medium">
												<p class="id_text">한글, 영문, 숫자 혼용 가능 (한글 기준 10자 이내)</p>
												<button id="check_duplication" type="button"
													class="round gray">
													<span>중복확인</span>
												</button></td>
										</tr>
										<tr>
											<th scope="row">비밀번호</th>
											<td><input type="password" name="password" id="password"
												oninput="pwCheck()" required="required"
												placeholder="비밀번호 입력" value="<%=dto.getPassword()%>">
											</td>
										</tr>
										<tr>
											<th scope="row">비밀번호 확인</th>
											<td><input type="password" name="ckeck_password"
												id="ckeck_password" oninput="pwCheck()" required="required"
												placeholder="비밀번호 확인"> <span id="pwConfirm">비밀번호를
													입력하세요</span></td>
										</tr>
										<tr>
											<th scope="row">생년월일 / 성별</th>
											<td class="td_day"><input type="date" name="birthdate"
												value="<%=dto.getBirthdate()%>"> <input type="radio"
												name="gender" value="Male"
												<%=dto.getGender() == Gender.Male ? "checked" : ""%>
												class="radio">남성&nbsp; <input type="radio"
												name="gender" value="Female"
												<%=dto.getGender() == Gender.Female ? "checked" : ""%>
												class="radio">여성&nbsp; <input type="radio"
												name="gender" value="Other"
												<%=dto.getGender() == Gender.Other ? "checked" : ""%>
												class="radio">비공개</td>
										</tr>
										<tr>
											<th scope="row">휴대전화번호</th>
											<td>
												<%
												//하이픈(-)을 구분자로 분리
												StringTokenizer st = new StringTokenizer(dto.getPhoneNumber(), "-");
												String hp1 = st.nextToken();
												String hp2 = st.nextToken();
												String hp3 = st.nextToken();
												%> <select name="phone_number1">
													<%
													String[] strHp = {"010", "011", "017"};
													for (int i = 0; i < strHp.length; i++) {
														if (hp1.equals(strHp[i])) {
													%>
													<option value="<%=strHp[i]%>" selected="selected"><%=strHp[i]%></option>
													<%
													} else {
													%>
													<option value="<%=strHp[i]%>"><%=strHp[i]%></option>
													<%
													}
													}
													%>
											</select> - <input type="text" name="phone_number2"
												required="required" value="<%=hp2%>"> - <input
												type="text" name="phone_number3" required="required"
												value="<%=hp3%>">
											</td>
										</tr>
										<tr>
											<th scope="row">이메일</th>
											<td>
												<%
												StringTokenizer st2 = new StringTokenizer(dto.getEmail(), "@");
												String email1 = st2.nextToken();
												String email2 = st2.nextToken();
												%> <input type="text" name="email1" placeholder="이메일"
												required="required" value="<%=email1%>"> @ <input
												type="text" name="email2" value="<%=email2%>"> <select
												id="email_selected">
													<option class="select" value=""
														<%=dto.getEmail().equals("") ? "selected" : ""%>>선택</option>
													<option class="select" value="naver.com"
														<%=dto.getEmail().equals("naver.com") ? "selected" : ""%>>네이버</option>
													<option class="select" value="daum.net"
														<%=dto.getEmail().equals("daum.net") ? "selected" : ""%>>다음</option>
													<option class="select" value="gmail.com"
														<%=dto.getEmail().equals("gmail.com") ? "selected" : ""%>>구글</option>
													<option class="select" value="직접입력"
														<%=!(dto.getEmail().equals("naver.com") || dto.getEmail().equals("daum.net") || dto.getEmail().equals("gmail.com"))
				? "selected"
				: ""%>>직접입력</option>
											</select>
											</td>
										</tr>
										<tr>
											<th scope="row">우편번호</th>
											<td>
												<%-- <%
											StringTokenizer st3 = new StringTokenizer(dto.getAddress()," ");
											String address0 = st3.nextToken();
											String address1 = st3.nextToken();
											String address2 = st3.nextToken();
											String address3 = st3.nextToken();
											%> --%> <input type="text" id="sample6_postcode"
												name="address0" required="required" placeholder="우편번호"<%-- value="<%=address0%>" --%>>
												<input type="button" onclick="sample6_execDaumPostcode()"
												value="우편번호 찾기"><br> <input type="text"
												id="sample6_address" placeholder="주소" name="address1"<%-- value="<%=address1%>" --%>><br>
												<input type="text" id="sample6_detailAddress"
												name="address2" placeholder="상세주소"<%-- value="<%=address2%>" --%>>
												<input type="text" id="sample6_extraAddress" name="address3"
												placeholder="참고항목"<%-- value="<%=address3%>" --%>>
											</td>
										</tr>

									</tbody>
								</table>
							</div>
							<div class="set-btn aright">
								<button type="submit" id="set_profile" class="round inred on">
									<span>수정</span>
								</button>
								<button type="button" id="set_profile" class="round inblack on"
									onclick="location.href='myHome.jsp'">
									<span>취소</span>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	<jsp:include page="../include/footer.html"></jsp:include>
</body>
<script type="text/javascript">
	//username 중복체크
	$("#check_duplication").click(function() {

		// 아이디 읽기
		var username = $("#nick_name").val();
		//alert(username);
		$.ajax({
			type : "get",
			url : "userNameCkeck.jsp",
			dataType : "json",
			data : {
				"username" : username
			},
			success : function(data) {

				if (data.count == 1) {
					alert("입력하신 닉네임 정보는 이미 사용중 입니다.\n다른 닉네임 정보를 입력해 주세요.");
				} else {
					alert("입력하신 닉네임 정보는 사용가능한 정보 입니다.");
				}
			}
		})
	});

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
								$("input[name='email2']")
										.prop("readonly", true).val(
												selectedValue); // value 속성 변경
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
</html>