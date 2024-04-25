<%@page import="data.inform.inquiry.InquiryDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.inform.inquiry.InquiryDto"%>
<%@page import="java.util.List"%>
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
			<div id="myhome" class="myhome">
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
									<strong>
										<!-- 로그인한 유저 NAME--><%=dto.getName()%><span>님</span>
									</strong> <em>
										<!-- 로그인한 유저 USERNAME --><%=username%></em>
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
								<li class="on"><a href="myHome.jsp">MY HOME<i></i></a></li>
								<li><a href="myReserve.jsp">나의 예매내역 <i></i></a>
									<ul>
										<li><a href="myReserve.jsp">예매내역 확인</a></li>
									</ul></li>
								<li><a href="myInfoEdit.jsp">회원정보<i></i></a>
									<ul>
										<li><a href="myInfoEdit.jsp">개인정보 변경</a></li>
										<li><a href="myInfoLeave.jsp">회원탈퇴</a></li>
									</ul></li>
								<li><a href="myProfileEdit.jsp">프로필 관리<i></i></a></li>
								<li><a href="myInquiry.jsp">나의 문의내역 <i></i></a>
									<ul>
										<li><a href="myInquiry.jsp">1:1 문의</a></li>
									</ul></li>
								<li class="my-movie"><a href="javascript:;">내가
										본 영화<span style="margin-left: 38px;">↗️</span>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="col-detail" id="my_contents">
						<div class="set-my-reserve movielog col2">
							<div class="box-polaroid">
								<div class="box-inner watched">
									<a href="myMovieLogWatched.jsp" title="내가 본 영화">
										<h3>내가 본 영화</h3> <span>관람한 영화들을 한번에 <br>모아 보고 싶다면?
									</span>
									</a>
								</div>
								<div class="box-inner mvdiary">
									<a href="myMovieLogReview.jsp" title="내가 쓴 평점">
										<h3>내가 쓴 평점</h3> <span>관람 후 내 감상평을 적어 <br>추억하고
											싶다면?
									</span>
									</a>
								</div>
							</div>
						</div>
						<div class="tit-my">
							<h3>MY 예매내역</h3>
							<p>
								<em>0건</em> <a href="myReserve.jsp">예매내역 더보기</a>
							</p>
							<span>예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</span>
						</div>

						<form name="aspnetForm" method="post" action="./?g=1"
							id="aspnetForm" novalidate="novalidate">
							<div></div>

							<div></div>
							<!-- MY 예매내역 -->
							<div class="set-base-booking">
								<div class="box-polaroid">
									<div class="box-inner">
										<div class="lst-item">고객님의 최근 예매내역이 존재하지 않습니다.</div>
									</div>
								</div>
							</div>
						</form>
						<!-- //MY 예매내역 -->
						<!-- MY 문의이력 -->
						<div class="set-my-part">
							<div class="box-polaroid type1">
								<div class="box-inner">
									<div class="tit-my">
										<h3>MY Q&amp;A</h3>
										<p>
											<em><span class="ii"><%=totalCount%></span>건</em> <a
												href="myInquiry.jsp">MY Q&amp;A 더보기</a>
										</p>
									</div>
									<div class="col-myqna">
										<%
										if (totalCount == 0) {
										%>
										<ul>
											<li>고객님의 1:1 문의내역이 존재하지 않습니다.</li>
										</ul>
										<%
										} else {
										for (int i = 0; i < list.size(); i++) {
											InquiryDto idto = list.get(i);
										%>
										<ul>
											<li><em><%=idto.getOption()%></em> <a
												href="inquiryDetail.jsp?num=<%=idto.getInquiryId()%>&currentPage=<%=currentPage%>">
													<strong><%=idto.getTitle()%></strong>
											</a> <%
 String answervalue = idto.getAnswer() != null ? idto.getAnswer() : "";
 %> <span
												class="round <%=answervalue != "" ? "red" : "gray"%> on"
												value="<%=answervalue%>"> <i><%=answervalue != "" ? "답변완료" : "답변 중"%></i>
											</span></li>
										</ul>
										<%
										}
										}
										%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.html"></jsp:include>
</body>
</html>