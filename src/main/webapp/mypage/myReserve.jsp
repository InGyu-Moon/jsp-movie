<%@page import="data.inform.inquiry.InquiryDao"%>
<%@page import="data.inform.inquiry.InquiryDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.user.member.MemberDto"%>
<%@page import="data.user.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<title>마이페이지 | 영화 그 이상의 감동</title>
<%
String username = (String) session.getAttribute("username");
MemberDao mdao = new MemberDao();
InquiryDao idao = new InquiryDao();
int memberId = mdao.getMemberIdByUsername(username);
MemberDto dto = mdao.getMemberById(memberId);

//전체갯수
int totalCount = idao.getTotalCount(memberId);
int perPage = 5; //한페이지당 보여질 글의 갯수
int perBlock = 5; //한블럭당 보여질 페이지 갯수
int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이0번,오라클은 1번);
int startPage; //각블럭당 보여질 시작페이지
int endPage; //각블럭당 보여질 끝페이지
int currentPage; //현재페이지
int totalPage; //총페이지수
int no; //각페이지당 출력할 시작번호

//현재페이지 읽는데 단 null일경우는 1페이지로 준다
if (request.getParameter("currentPage") == null)
	currentPage = 1;
else
	currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총페이지수 구한다
//총글갯수/한페이지당보여질갯수로 나눔(7/5=1)
//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

//각블럭당 보여질 시작페이지
//perBlock=5일경우 현재페이지가 1~5일경우 시작페이지가 5,끝페이지가 1
//현재가 13일경우 시작:15 끝:11
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;

//총페이지가 23일경우 마지막블럭은 끝페이지가 1
if (endPage > totalPage)
	endPage = totalPage;

//각페이지에서 보여질 시작번호
//1페이지:0, 2페이지:5 3페이지: 10.....
startNum = (currentPage - 1) * perPage;

//각페이지당 출력할 시작번호 구하기
//총글개수가 23  , 1페이지:23 2페이지:18  3페이지:13
no = totalCount - (currentPage - 1) * perPage;

//페이지에서 보여질 글만 가져오기
List<InquiryDto> list = idao.selectMemberInquity(memberId, startNum, perPage);

/*마지막 페이지의 단 한개 남은 글을 삭제시 빈페이지가 남는다 그러므로 해결책은 그이전페이지로 가면 된다  */
if (list.size() == 0 && currentPage != 1) {
%>
<script type="text/javascript">
	location.href="index.jsp?main=smartboard/boardlist.jsp?currentPge=<%=currentPage - 1%>
	";
</script>
<%
}

SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
%>
<body>
	<div id="wrap">
		<div class="center">
			<div id="myhome" class="myreserve">
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
											style="color: #fb4357; font-weight: bold;">1</a>개의 영화를
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
								<li class="on"><a href="myReserve.jsp">나의 예매내역 <i></i></a>
									<ul>
										<li><a href="myReserve.jsp" style="color: #fb4357;">예매내역
												확인</a></li>
									</ul></li>
								<li><a href="myInfoEdit.jsp">회원정보<i></i></a>
									<ul>
										<li><a href="myInfoEdit.jsp">개인정보 변경</a></li>
										<li><a href="myInfoLeave.jsp">회원탈퇴</a></li>
									</ul></li>
								<li><a href="myProfileEdit.jsp">프로필 관리<i></i></a></li>
								<li><a href="myInquiry.jsp">나의 문의내역 <i></i></a>
									<ul>
										<li class="onli"><a href="myInquiry.jsp">1:1 문의</a></li>
									</ul></li>
								<li class="my-movie"><a href="javascript:;">내가
										본 영화<span style="margin-left: 38px;">↗️</span>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="col-detail" id="mycgv_contents">
						<div class="tit-mycgv type2">
							<h3>나의 예매내역</h3>
							<p>
								지난 <em>1개월</em>까지의 예매내역을 확인하실 수 있으며, 영수증은 <em>신용카드 결제 내역</em>만
								출력 가능합니다.
							</p>
							<a href="/user/movielog/watched.aspx" class="round inblack"><span>내가
									본 영화</span></a>
						</div>
						<div style="display: none;"></div>
						<div class="cols-mycgv-booking">
							<div class="sect-register booking">
								<p>
									<strong>현장에서 발권하실 경우 꼭 <em>예매번호</em>를 확인하세요.
									</strong> <span>티켓판매기에서 예매번호를 입력하면 티켓을 발급받을 수 있습니다.</span>
								</p>
							</div>
							<div class="lst-item">
								<div class="box-set-info">
									<div class="box-number">
										<em>예매번호</em> <strong>0260-<i>0425-3748-559</i></strong>
									</div>
									<div class="box-info">
										<div class="box-image">
											<a href="/movies/detail-view/?midx=88104"> <span
												class="thumb-image"> <img
													src="../img/movie_img/detgle/detgle.jpg"
													onerror="errorImage(this)"> <img alt="영상물 등급"
													src="../img/movie_img/vrating/15세 이용가.png">
											</span>
											</a>
										</div>

										<div class="detail-area">
											<div class="reservation-info-wrap">
												<h2 class="box-contents artHouse">
													<a href="#" class="res-title">댓글부대</a> <span
														class="res-price">28,000원</span>
												</h2>
												<ul class="reservation-mv-info">
													<li>
														<dl>
															<dt>관람극장</dt>
															<dd>CGV 강남</dd>
														</dl>
													</li>
													<li>
														<dl>
															<dt>관람인원</dt>
															<dd>일반 2</dd>
														</dl>
													</li>
													<li>
														<dl>
															<dt>관람일시</dt>
															<dd class="txt-red">2024.04.25(목) 14:10</dd>
														</dl>
													</li>
													<li>
														<dl>
															<dt>관람좌석</dt>
															<dd>H 12,H 13</dd>
														</dl>
													</li>
													<li>
														<dl>
															<dt>상영관</dt>
															<dd>1관</dd>
														</dl>
													</li>
													<li>
														<dl>
															<dt>매수</dt>
															<dd>2매</dd>
														</dl>
													</li>
												</ul>
											</div>

											<div class="reservation-info-wrap store-history"
												style="display: none;">
												<h2>
													<span class="res-title">


														<button type="button" class="all-goods-btn"
															title="상품모두 열기/닫기"
															onclick="fn_SnackVisible(this, '0260202404253748553')">
															<span>전체상품보기버튼</span>
														</button>
													</span> <span class="res-price"> 원</span>
												</h2>
												<ul class="store-goods-list"
													id="divSnackList0260202404253748553">
												</ul>
											</div>
										</div>
									</div>
									<div class="resevation-payment-info">
										<h2>결제내역</h2>
										<div class="resevation-payment">
											<p class="resevation-payment-total">
												<span class="totel-title">총 결제금액</span> <span
													class="res-price"> 28,000원</span>
											</p>
											<p class="resevation-payment-part">
												<span>카카오페이</span><span class="part-price">28,000원</span>
											</p>
											<div class="income-deduction_wrap">
												<a href="#none" class="btn_incomeDeduction">* 영화관람료 소득공제
													대상 <i class="cgvIcon system arrow_up">ARROW</i>
												</a>
												<div class="income-deduction-content">
													<p>본 콘텐츠는 영화관람료 소득공제 대상 상품입니다.</p>
													<p>문화비소득공제는 자동 적용되며, 결제완료 후 변경이 불가합니다.</p>
													<ol>
														<li><strong>1. 영화 관람료 소득공제란?</strong>
															<p>2023년 7월 1일 결제분 부터 영화 관람료에 대해 문화비 소득공제가 적용됩니다.</p>
															<ul>
																<li>총급여 7천만 원 이하 근로자 중 신용카드 등 사용액이 총급여액의 25 % 가 넘는
																	근로소득자를 대상으로 적용됩니다.</li>
																<li>공제율은 30%, 공제한도는 전통시장 사용분, 대중교통 사용분, 문화비 사용분에 대한
																	소득공제를 합해 총 300만원 입니다.</li>
															</ul></li>
														<li><strong>2. 영화 관람료 소득공제 대상</strong>
															<ul>
																<li>영화 및 공연상품 (단, 영화와 매점(패스트오더) 상품 통합결제 시 대상 제외 /
																	스포츠 중계, 게임 중계, 강연 등 일부 콘텐츠 제외)</li>
															</ul></li>
														<li><strong>3. 영화 관람료 소득공제 제외 대상</strong>
															<ul>
																<li>매점(패스트오더), 씨네샵, 포토티켓 등 영화와 무관한 상품 제외</li>
																<li>비상설상영관 등 일부 상영관 제외<!-- li-->
																</li>
															</ul></li>
														<li><strong>4. 영화 관람료 소득공제 가능 결제수단</strong>
															<ul>
																<li>카드결제: 신용카드(법인카드 불가, 개인카드에 한함)</li>
																<li>현금결제: 관람권, 포인트 등 현금영수증 처리가 가능한 결제수단</li>
																<li>간편결제: 네이버페이, 카카오페이, Payco, 토스페이</li>
																<li>휴대폰결제</li>
															</ul></li>
														<li><strong>5. 영화 관람료 소득공제 제외 결제수단</strong>
															<ul>
																<li>현금영수증 처리가 불가한 제휴 결제수단</li>
																<li>그 외 OK캐쉬백 등 일부 결제수단</li>
															</ul></li>
													</ol>
												</div>
											</div>
										</div>
									</div>
									<div class="set-btn">
										<div class="col-edit"></div>
										<div class="col-print">
											<button type="button" data-status="94"
												onclick="noshowYN('N', '20240425', '00', '01', '742.37913071', '', '' )"
												class="round black cancel">
												<span>예매취소</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- CGV 예매 관련 정책 안내 Box Type -->
						<div class="sect-box-descri">
							<h4>CGV 예매 관련 정책 안내</h4>
							<!-- Box Moudle -->
							<div class="box-polaroid">
								<div class="box-inner">
									<ul>
										<li>
											<dl>
												<dt>이용안내</dt>
												<dd>
													<ul>
														<li>예매 변경은 불가능하며, 취소 후 재 예매를 하셔야만 합니다.</li>
														<li>영수증은 상영 시간 전까지 My CGV 에서 출력하실 수 있습니다. 단, 신용카드로
															예매하신 경우만 한합니다.</li>
														<li>상영 시간 이후 관람하신 영화의 영수증 출력을 원하실 경우, 1544-1122로 문의
															주시기 바랍니다.</li>
														<li>취소하신 내역이 나타나지 않거나 궁금하신 사항이 있으시면, 고객센터로 문의해 주시기
															바랍니다.</li>
													</ul>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>티켓 교환방법</dt>
												<dd>
													<ul>
														<li>
															<p>
																<strong>티켓판매기(ATM)에서 발권하실 경우</strong><br>예매번호 또는
																고객인증번호 (법정생년월일 6자리 + 휴대폰번호 뒷 7~8자리)를 입력하시면 티켓을 편하게 발권하실
																수 있습니다.
															</p>
														</li>
														<li>
															<p>
																<strong>매표소에서 발권하실 경우</strong><br>티켓교환권을 출력하여 매표소에
																방문하시면 티켓으로 교환하실 수 있습니다.<br> (티켓교환권 출력이 어려운 경우,
																예매번호와 신분증을 지참하시면 매표소에서 티켓을 수령하실 수 있습니다.)
															</p>
														</li>
													</ul>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>예매 취소 안내</dt>
												<dd>
													<ul>

														<li>
															<p>
																<strong>신용카드</strong><br> 결제 후 3일 이내 취소 시 승인 취소 가능,
																3일 이후 매입 취소시 영업일 기준 3~5일 소요
															</p>
														</li>
														<li>
															<p>
																<strong>체크카드</strong><br>결제 후 3일 이내 취소 시 당일 카드사에서
																환불처리. 3일 이후 매입 취소 시 카드사에 따라 3~10일 이내 카드사에서 환불
															</p>
														</li>
														<li>
															<p>
																<strong>휴대폰 결제</strong><br> 결제 일자 기준 당월(1~말일)취소만
																가능. 익월 취소 관련 문의는 CGV고객센터(1544-1122) 연락 요망<br> 예매취소
																후 당일 환불이 원칙이나 현장 취소 시 경우에 따라 익일 처리 될 수 있음.
															</p>
														</li>
														<li>
															<p>
																<strong>카카오페이</strong><br> 카카오페이머니나 카카오포인트를 사용하신 경우
																각각의 잔액으로 원복되며, 카드 결제를 하신 경우는 카드사 정책에 따라 승인취소가 진행되며 3일 이후
																매입 취소시 영업일 기준 3~10일 소요됩니다.
															</p>
														</li>
														<li>
															<p>
																<strong>PAYCO</strong><br> PAYCO 쿠폰/포인트를 사용하신 경우
																각각의 쿠폰/포인트로 원복되며 쿠폰의 경우 조건에 따라 재사용이 불가 할 수 있습니다. 카드
																결제금액은&nbsp;카드사 정책에 따라 승인취소가 진행되며&nbsp;3일 이후 매입 취소시 영업일
																기준 3~10일 소요됩니다.
															</p>
														</li>
														<li>
															<p>
																<strong>스마일페이</strong><br> 스마일캐시를 사용하신 경우 스마일캐시로
																원복되며, 카드 결제금액은 카드사 정책에 따라 승인취소가 진행되며 3일 이후 매입취소 시 영업일 기준
																3~10일 소요됩니다.
															</p>
														</li>
														<li>
															<p>
																<strong>NAVER Pay</strong><br> NAVER Pay 포인트를 사용하신
																경우 NAVER Pay 포인트로 원복되며, 카드사 결제를 하신 경우는 카드사 정책에 따라 승인취소가
																진행되며 3일 이후 매입 취소시 영업일 기준 3~10일 소요됩니다.
															</p>
														</li>
														<li>
															<p>
																<strong>카카오톡 선물하기 복합상품</strong><br> 카카오톡 선물하기 복합상품
																(2인 PKG / 1인 PKG)은 매점쿠폰 사용 시, 예매 티켓 환불 불가.<br> ※ 단,
																매점 쿠폰 미 사용 시, 예매 티켓 환불 가능하며 재 예매 시, 새로운 매점 쿠폰 발급.
															</p>
														</li>
														<li>
															<p>
																<strong>계좌이체</strong><br> 1. 예매일 이후 7일 이내 취소 시<br>
																- 자동 환불 은행: 취소 후 즉시 처리가능<br> - 조흥, 신한, 외한, 한미, 우리,
																우체국, 전북, 경남, 광주, 대구, 새마을, 제주<br> - 우리은행의 경우 당일 취소분만
																즉시 처리 가능<br> - 수동 환불 은행: 농협(취소 후 2~3일 이내 입금),
																부산/제일/우리(취소 후 3~5일 이내 입금)<br> <br> 2. 예매 7일
																이후~상영시간 30분 전 취소 시(단, 일부 당일 취소 불가 행사의 경우 전일 취소 시)<br>
																- 환불은 환불 요청일로부터 7일 이상 소요됨<br> <br> ※ 기타 환불 관련
																문의는 CGV고객센터 1544-1122로 연락바랍니다.
															</p>
														</li>
													</ul>
												</dd>
											</dl>
										</li>

										<li>
											<dl>
												<dt>환불 규정 안내</dt>
												<dd>
													<ul>
														<li>
															<p>
																<strong>현장 취소를 하는 경우</strong><br>상영시간 이전까지만 가능하며,
																상영시간 이후 취소나 환불은 되지 않습니다.
															</p>

														</li>
														<li>
															<p>
																<strong>홈페이지에서 예매 취소할 경우</strong><br> 부분 취소는
																불가능합니다. (ex. 4장을 인터넷으로 예매한 경우 4장 모두 취소만 가능)<br>
																홈페이지 예매 취소는 상영시간 20분전까지 가능합니다.<br> <em
																	style="color: #0000FF";="">(단, 씨네&amp;포레관,
																	씨네&amp;리빙룸, SUITE CINEMA 제외)</em><br> 상영시간 이후 취소나 환불은
																되지 않습니다
															</p>
														</li>
														<li>
															<p>
																<strong>모바일 앱/웹(m.cgv.co.kr)에서 예매 취소할 경우</strong><br>
																부분 취소는 불가합니다.(ex. 4장을 인터넷으로 예매한 경우 4장 모두 취소만 가능)<br>
																모바일 앱/웹 예매 취소는 상영시간 15분전까지 가능합니다.<br> <em
																	style="color: #0000FF";="">(단, 씨네&amp;포레관,
																	씨네&amp;리빙룸, SUITE CINEMA 제외)</em><br> 상영시간 이후 취소나 환불은
																되지 않습니다.
															</p>
														</li>
														<li>
															<p>
																<strong>단, 일부 행사의 경우 행사 당일 취소, 변경 불가 합니다.</strong>
															</p>
														</li>
													</ul>
												</dd>
											</dl>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<form name="targetform" id="targetform" method="post"
							novalidate="novalidate">
							<input type="hidden" name="reverse_no" id="reverse_no"> <input
								type="hidden" name="theater_code" id="theater_code">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.html"></jsp:include>
</body>
</html>