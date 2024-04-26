<%@page import="data.inform.inquiry.InquiryDao"%>
<%@page import="data.inform.inquiry.InquiryDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.user.member.MemberDto"%>
<%@page import="data.user.member.MemberDao"%>
<%@ page import="data.reservation.ReservationInfoDto" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="data.reservation.ReservationDao" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Map" %>
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
<%
	String sessionMemberId = (String)session.getAttribute("memberId");
	ReservationDao dao = new ReservationDao();
	List<String> movieList = dao.getReservedMovieListByMemberId(sessionMemberId);
	int totalPrice = 0;
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy년 MM월 dd일");
	SimpleDateFormat sdf2 = new SimpleDateFormat("HH시 mm분");
	SimpleDateFormat year = new SimpleDateFormat("yyyy");
	DecimalFormat decimalFormat = new DecimalFormat("###,###,###원");

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
								<li class="my-movie"><a href="javascript:;">내가 본 영화<span
										style="margin-left: 38px;">↗️</span>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="col-detail" id="mycgv_contents">
						<div class="tit-mycgv type2">
							<div class="text">
								<h3>나의 예매내역</h3>
								<p>
									지난 <span>1개월</span>까지의 예매내역을 확인하실 수 있으며, 영수증은 <span>신용카드
										결제 내역</span>만 출력 가능합니다.
								</p>
							</div>

							<a href="javascript:;" class="round inblack"><span>내가
									본 영화</span></a>
						</div>
						<div style="display: none;"></div>
						<div class="cols-mycgv-booking">
							<div class="sect-register booking">
								<p>
									<strong>현장에서 발권하실 경우 꼭 <span>예매번호</span>를 확인하세요.
									</strong> <span>티켓판매기에서 예매번호를 입력하면 티켓을 발급받을 수 있습니다.</span>
								</p>
							</div>


							<div class="lst-item">
								<%
									for(String screeningInfoId : movieList){
										ReservationInfoDto reservationInfoDto = dao.getReservationInfoByMemberIdAndScreenInfoId(sessionMemberId,screeningInfoId);
										HashMap<String,Integer> map = dao.getSeatInfoByMemberIdAndScreenInfoId(sessionMemberId,screeningInfoId);
										Timestamp timestamp = reservationInfoDto.getScreeningDate();
										Date date = new Date(timestamp.getTime());
										Calendar calendar = Calendar.getInstance();
										calendar.setTime(date);
										int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
										String[] days = {"일", "월", "화", "수", "목", "금", "토"};
										String dayOfWeekString = days[dayOfWeek - 1];

								%>
								<div class="box-set-info">
									<div class="box-number">
										<em>예매번호</em>
										<strong>0260-<i><%=year.format(reservationInfoDto.getScreeningDate())%>-
											<%=String.format("%04d", Integer.parseInt(sessionMemberId))%>
											-<%=String.format("%04d", Integer.parseInt(reservationInfoDto.getScreeningInfoId()))%></i>
										</strong>
									</div>
									<div class="box-info">
										<div class="box-image">
											<a href="/movies/detail-view/?midx=88104"> <span
												class="thumb-image"> <img
													src=<%=reservationInfoDto.getMovieImg()%>
													onerror="errorImage(this)"> <img alt="영상물 등급"
													src="../img/movie_img/vrating/15세 이용가.png" class="grade">
											</span>
											</a>
										</div>

										<div class="detail-area">
											<div class="reservation-info-wrap">
												<h2 class="box-contents artHouse">
													<a href="#" class="res-title"><%=reservationInfoDto.getMovieTitle()%></a> <span
														class="res-price"><%=decimalFormat.format(totalPrice)%></span>
												</h2>
												<ul class="reservation-mv-info">
													<li>
														<dl>
															<dt>관람극장</dt>
															<dd>CGV <%=reservationInfoDto.getBranch()%></dd>
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
															<dd class="txt-red">
																<%=sdf1.format(reservationInfoDto.getScreeningDate())%>
																(<%=dayOfWeekString%>)
																<%=sdf2.format(reservationInfoDto.getScreeningTime())%>
															</dd>
														</dl>
													</li>
													<li>
														<dl>
															<dt>관람좌석&nbsp;</dt>
															<%
																for(Map.Entry<String, Integer> entry : map.entrySet()){
																	totalPrice+=entry.getValue();
															%>
															<%=entry.getKey()%>&nbsp;
															<%}
															%>
														</dl>
													</li>
													<li>
														<dl>
															<dt>상영관</dt>
															<dd><%=reservationInfoDto.getScreenName()%></dd>
														</dl>
													</li>
													<li>
														<dl>
															<dt>매수</dt>
															<dd><%=map.size()%>매</dd>
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
													class="res-price"> <%=decimalFormat.format(totalPrice)%></span>
											</p>
											<p class="resevation-payment-part">
												<span>
													<%
														String str="페이";
														if(reservationInfoDto.getPaymentMethod().equals("Credit_Card")){
															str = "신용카드";
														}else if(reservationInfoDto.getPaymentMethod().equals("Phone")){
															str = "휴대폰";
														}else if(reservationInfoDto.getPaymentMethod().equals("KAKAO")){
															str = "카카오페이";
														}else if(reservationInfoDto.getPaymentMethod().equals("NAVER")){
															str = "네이버페이";
														}else if(reservationInfoDto.getPaymentMethod().equals("SSG")){
															str = "SSG페이";
														}
													%>
													<%=str%>
												</span><span class="part-price"><%=decimalFormat.format(totalPrice)%></span>
											</p>
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
								<%
									}
								%>
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