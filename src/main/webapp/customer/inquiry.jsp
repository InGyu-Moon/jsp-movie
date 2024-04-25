<%@page import="data.user.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<title>고객센터 | 영화 그 이상의 감동</title>
<%
String username = (String) session.getAttribute("username");
MemberDao mdao = new MemberDao();
int memberId = mdao.getMemberIdByUsername(username);
%>
<body>
	<div id="wrap">
		<div id="inquiry" class="customer">
			<div class="center">
				<div class="head">
					<p>고객센터</p>
				</div>
				<div class="main">
					<div class="category">
						<ul>
							<li><a href="faq.jsp">FAQ</a></li>
							<li><a href="notice.jsp">NOTICE</a></li>
							<li class="active"><a href="inquiry.jsp">INQUIRY</a></li>
						</ul>
					</div>
					<div class="bg_gray">
						<div>
							<div class="title">
								<p>FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수 있습니다.</p>
							</div>
							<ul>
								<li>1:1 문의글 답변 운영시간 : 평일 09:00~18:00</li>
								<li>주말/공휴일 미운영하며, 영업시간 내 순차적 답변 처리됩니다.</li>
							</ul>
						</div>
					</div>
					<div class="head_text">
						<p class="title">
							고객님의 문의에 <span>답변하는 직원은 고객 여러분의 가족 중 한 사람</span>일 수 있습니다.
						</p>
						<p class="gray">고객의 언어폭력(비하, 욕설, 반말, 성희롱 등)으로부터 직원을 보호하기 위해 관련
							법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.</p>
					</div>
					<div class="form">
						<div class="head">
							<div class="title">
								<span>문의내용</span>
							</div>
							<div class="essential">
								<span>*필수입력</span>
							</div>
						</div>

						<form action="inquiry_action.jsp" id="form" method="post">
							<div class="block">
								<div class="box category">
									<label>분류</label>
									<div class="input">
										<select id="category" name="category" required="required">
											<option value="기타">분류선택</option>
											<option value="영화관">영화관</option>
											<option value="영화">영화</option>
											<option value="예매/결제">예매/결제</option>
											<option value="이벤트">이벤트</option>
											<option value="개인정보">개인정보</option>
										</select>
									</div>
								</div>
								<div class="box title">
									<label>제목</label>
									<div class="input">
										<div>
											<input type="text" id="title" name="title"
												placeholder="제목을 입력해주세요" required="required">
											<div class="number">
												<p>
													 <span id="titleCount">0</span>/한글 50자
												</p>
											</div>
										</div>

									</div>
								</div>
								<div class="box content">
									<label>내용</label>
									<div class="input">
										<textarea rows="" cols="" id="content" name="content"
											placeholder="내용 및 첨부파일에 개인정보(카드번호, 계좌번호, 주민번호)가 포함되지 않도록 유의하여 입력해주세요." required="required"></textarea>
										<div class="text">
											<div class="red">
												<p>
													현재 페이지 내 ‘클릭/타이핑’ 없이 머무르는 경우, <br> 20분 후 접속이 자동 종료되며
													작업한 내용은 저장이 되지 않습니다.
												</p>
											</div>
											<div class="number">
												<p>
													<span id="titleCount2">0</span>/한글 2000자
												</p>
											</div>
										</div>
									</div>
								</div>
							 	<div class="box file">
									<label>첨부파일</label>
									<div class="input">
										<div class="file_box">
											<div>
												<input type="file" name="file" id="file" value="">
												<div class="btn_file">파일선택</div>
												<span class="file_val"></span>
											</div>
											<div class="text">
												<p>첨부 파일형식 : jpg / jpeg / png / bmp / gif / pdf (5MB X
													1개)</p>
											</div>
										</div>
									</div>
								</div> 
							</div>
							<div class="agreement">
								<div class="top">
									<div class="title">
										<p>개인정보 수집에 대한 동의</p>
									</div>
									<div class="text">
										<p>문의를 통해 아래의 개인정보를 수집합니다. 수집된 개인정보는 문의 외 목적으로 사용하지 않습니다.
										</p>
									</div>
								</div>
								<div class="body">
									<pre>
개인정보의 수집목적 및 항목
① 수집 목적 : 원활한 고객 상담, 불편사항 및 문의사항 관련 의사소통 경로 확보
② 수집 항목
*필수입력사항
- 이용자 식별을 위한 항목 : 성명, 연락처, 이메일, 아이디(로그인 시 수집)

개인정보의 보유 및 이용기간
입력하신 개인정보는 소비자 보호에 관한 법률 등 관계 법률에 의해 다음과 같이 보유합니다.
보유기간 : 문의접수 후 처리 완료시점으로 부터 3년

※ 1:1문의 서비스 제공을 위한 최소한의 개인정보이며 거부할 수 있습니다. 다만, 수집에 동의하지 않을 경우 서비스 이용이 제한됩니다.
								
								</pre>
								</div>

								<div class="bx_inp">
									<input type="radio" name="rdo01" id="radio10"
										class="iDrdoAgreeY"><label for="radio10">동의 </label><input
										type="radio" name="rdo01" id="radio11" checked=""><label
										for="radio11">동의하지않음</label>
								</div>

							</div>
							<div class="btn">
								<input type="button" value="취소" id="cancellation"> <input
									type="submit" value="확인" id="submit">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.html"></jsp:include>
	<script>
		//셀렉트 박스 스타일
		$('select').niceSelect();

		//취소 버튼 눌렀을 때
		$("#cancellation").click(function() {
			var main_link = confirm("취소하시겠습니까?");
			if (main_link) {
				location.href = '../index.jsp';
			}
		});
		
		
		//전송 버튼을 눌렀을 때
		$("#submit").click(function(event) {
		    var username = '<%=username%>';
		    var agreeCheckbox = $("#radio10");

		    // 사용자가 동의 체크박스를 체크하지 않은 경우
		    if (!agreeCheckbox.is(":checked")) {
		        // 경고 메시지 표시
		        alert("개인정보 수집에 대한 동의를 확인해주세요.");
		        // 폼 전송 방지
		        event.preventDefault();
		    } else {
		        // 동의 체크박스가 체크되어 있고, 사용자가 로그인되어 있는 경우 폼 제출
		        if (username === 'null' || username === '') {
		            if (confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")) {
		                window.location.href = "../log/loginForm.jsp";
		            }
		            // 폼 제출 방지
		            event.preventDefault();
		        } else {
		            // 폼 제출
		            $("#form").submit();
		        }
		    }
		});

		//파일 버튼을 눌렀을 때
	 	$(".btn_file").click(function() {
			$("#file").click();
			const fileInput = document.querySelector("#file");
		});
		
		
		$("#file").change(function() {
		    const fileName = $(this).val().split('\\').pop();
		    $("span.file_val").text(fileName);
		}); 
		
		
	    // 텍스트 입력 필드의 글자수를 세는 함수
	    function countCharacters() {
	        var text = $("#title").val(); // #title 인풋 필드의 값 가져오기
	        var length = text.length; // 글자수 계산
	        
	        // 입력된 글자수가 50자를 넘으면
	        if (length > 50) {
	            // 50자로 자름
	            $("#title").val(text.substring(0, 50));
	        }
	        
	        // 글자수를 화면에 업데이트
	        $("#titleCount").text($("#title").val().length);
	    }

	    // 페이지 로드시 한번 호출하여 초기값 설정
	    countCharacters();

	    // input 이벤트 리스너를 사용하여 텍스트 입력시마다 호출
	    $("#title").on("input", function() {
	        countCharacters(); // 텍스트 입력시마다 글자수 업데이트
	    });
	    
	    
	    
	    
	    // 텍스트 입력 필드의 글자수를 세는 함수
	    function countCharacters2() {
	        var text2 = $("#content").val(); // #content 인풋 필드의 값 가져오기
	        var length2 = text2.length; // 글자수 계산
	        
	        // 입력된 글자수가 500자를 넘으면
	        if (length2 > 2000) {
	            // 500자로 자름
	            $("#content").val(text2.substring(0, 2000));
	        }
	        
	        // 글자수를 화면에 업데이트
	        $("#titleCount2").text(length2);
	    }

	    // 페이지 로드시 한번 호출하여 초기값 설정
	    countCharacters2();

	    // input 이벤트 리스너를 사용하여 텍스트 입력시마다 호출
	    $("#content").on("input", function() {
	        countCharacters2(); // 텍스트 입력시마다 글자수 업데이트
	    });


	</script>
</body>
</html>