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
//System.out.println(memberId);
%>
<style>
#myhome .cols-content .col-detail {
    position: relative;
    width: 100%;
}

.myinfoleave .col-detail .tit-my > h3{
    height: 34px;
    margin: 0;
    background-image: none;
    color: #222;
    font-weight: 500;
    font-size: 20px;
    line-height: 34px;
    text-align: left;
}

.myinfoleave .col-detail .tit-my > h4{
	height: 34px;
    margin: 0;
    background-image: none;
    color: #222;
    font-weight: 500;
    font-size: 17px;
    line-height: 34px;
    text-align: left;
}

.myinfoleave .txt-red {
    color: #fb4357 !important;
}

.myinfoleave .set-register.cgv {
    margin: 0;
    padding: 40px 0;
    border-top: 1px solid #b8b6aa;
    border-bottom: 1px solid #b8b6aa;
    text-align: center;
    font-size: 16pt;
}

.myinfoleave strong {
    font-weight: 500;
    line-height: 1.2em;
}

.myinfoleave .round.inred.on{
	font-size: 14px;
    background-color: #fb4357;
    padding: 10px 20px;
    color: #fff;
    border-radius: 100px;
    cursor: pointer;
}

.myinfoleave .set-btn{
	padding-top: 30px;
	float: right;
}
</style>
<body>
	<div id="wrap">
		<div class="center">
			<div id="myhome" class="myinfoleave">
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
										<li><a href="myInfoEdit.jsp">개인정보 변경</a></li>
										<li><a href="myInfoLeave.jsp" style="color: #fb4357;">회원탈퇴</a>
										</li>
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

						<div class="tit-my">
							<h3>나의 정보</h3>
						</div>
						<div class="tit-my">
							<h4>회원탈퇴</h4>
						</div>

						<div class="set-register cgv">
							<p>
								<strong>회원 탈퇴 시&nbsp;&nbsp;<span class="txt-red">CGV 멤버십 서비스&nbsp;</span>를
									이용할 수 없습니다.<br>회원 탈퇴 하시겠습니까?
								</strong>
							</p>
						</div>
						<div class="set-btn">
							<a href=""
								class="round inred on"> <input type="hidden" id="memberId"
								name="memberId" value="<%=memberId%>"> <span>
									회원탈퇴</span>
							</a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.html"></jsp:include>
</body>

<script type="text/javascript">

	$(".set-btn").click(
			function() {
				var s = confirm("정말 탈퇴하시겠습니까?");

				if (s) {
					$("a").attr("href",
							"deleteMyInfo.jsp?memberId=<%=memberId%>");
				}

			});
</script>
</html>