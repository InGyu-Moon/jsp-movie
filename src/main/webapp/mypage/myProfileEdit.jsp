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
<style>
#myhome .cols-content .col-detail {
    position: relative;
    width: 100%;
}

.myprofile .cols-content .tit-my > h3{
    height: 34px;
    margin: 0;
    background-image: none;
    color: #222;
    font-weight: 500;
    font-size: 20px;
    line-height: 34px;
    text-align: left;
}

.myprofile .cols-content .tit-my > h4{
	height: 34px;
    margin: 0;
    background-image: none;
    color: #222;
    font-weight: 500;
    font-size: 17px;
    line-height: 34px;
    text-align: left;
}

.tbl-form table {
	margin-top:30px;
    border-bottom: 1px solid #999;
}

table {
    font-size: 15px;
    line-height: 1.2;
    color: #666;
    font-weight: 300;
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    unicode-bidi: isolate;
    border-color: inherit;
}

.tbl-form tbody td, .tbl-form tbody th {
    padding: 15px 0 15px 10px;
    border-top: 1px solid #dfded7;
    color: #222;
}

input[type='text']{
    display: inline-block;
    height: 25px;
    line-height: 22px;
    padding-left: 10px;
    border: 1px solid #b5b5b5;
}

.tbl-form tbody td input[type=text]+button[type=button] {
    margin-left: 10px;
}

.tbl-form tbody td input#profile_upload_file{
	margin-left: 10px;
}

.round.gray {
    border: 2px solid #7b7b7b;
    color: #7b7b7b;
    background: white;
}

.round {
    line-height: 23px;
    font-weight: 500;
    font-size: 12px;
    text-align: center;
    vertical-align: middle;
}

.tbl-form tbody td p.profile-info {
    margin-bottom: 15px;
    padding-bottom: 12px;
    border-bottom: 1px dashed #d1cdc4;
    line-height: 1.5em;
}

.set-profile-img .box-image {
    position: relative;
    width: 88px;
    height: 88px;
    margin-right: 30px;
}
.set-profile-img .box-image, .set-profile-img .box-contents {
    float: left;
}

.set-profile-img .box-image > .thumb-image > .btn-del {
    position: absolute;
    top: 0;
    right: -12px;
    width: 9px;
    height: 9px;
    background: white;
    font-weight: bold;
}

.set-profile-img .box-contents p {
	margin-left: 20px;
    margin: 10px;
}

.tbl-form tbody td input, .tbl-form tbody td label {
    vertical-align: middle;
    letter-spacing: -1px;
}

table.suzip{
    padding-top: 20px;
}

.tbl-breakdown-re table {
    border-bottom: 1px solid #b8b6aa;
}

table.suzip {
    font-size: 13px;
    line-height: 1.2;
    color: #666;
    font-weight: 400;
    vertical-align: middle;
    text-align: center;
}

table.suzip th{
	background: #e2e2e0;
}

table.suzip td{
	border-top: 2px dotted #b8b6aa;
}

p.marginT10{
	padding-top: 15px;
}

.round.inred.on{
	font-size: 14px;
    background-color: #fb4357;
    padding: 10px 20px;
    color: #fff;
    border-radius: 100px;
    cursor: pointer;
}

.aright{
	margin-top: 10px;
	float: right;
}

#rd_agree_profileInfo_Y, #rd_agree_profileInfo_N{
	margin-right: 5px;
}
</style>
<body>
	<div id="wrap">
		<div class="center">
			<div id="myhome" class="myprofile">
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
								<li><a href="myHome.jsp">MY HOME<i></i></a></li>
								<li><a href="myReserve.jsp">나의 예매내역 <i></i></a>
									<ul>
										<li><a href="myReserve.jsp">예매내역 확인</a></li>
									</ul></li>
								<li><a href="myInfoEdit.jsp">회원정보<i></i></a>
									<ul>
										<li><a href="myInfoEdit.jsp">개인정보 변경</a></li>
										<li><a href="myInfoLeave.jsp">회원탈퇴</a></li>
									</ul></li>
								<li class="on"><a href="myProfileEdit.jsp">프로필 관리<i></i></a>
								</li>
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
					<div class="col-detail" id="mycgv_contents">
						<div class="tit-my">
							<h3>나의 정보</h3>
						</div>
						<div class="tit-my">
							<h4>나의 프로필/정보</h4>
						</div>
						<form name="aspnetForm" method="post" action="updateProfile.jsp"
							id="aspnetForm" enctype="multipart/form-data"
							novalidate="novalidate">
							<div class="tbl-form">
								<table summary="나의프로필정보 이름,아이디, 닉네임,프로필이미지 표기">
									<colgroup>
										<col width="19%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">이름</th>
											<td><strong><%=dto.getName()%></strong></td>
										</tr>
										<tr>
											<th scope="row"><label for="nick_name">닉네임</label></th>
											<td>
												<p style="padding-bottom: 10px;">한글, 영문, 숫자 혼용 가능 (한글 기준 10자 이내)</p> <input type="hidden"
												id="memberId" name="memberId" value="<%=memberId%>">
												<input type="hidden" id="old_nick_name" name="old_nick_name"
												value="<%=username%>"> <input type="text"
												id="nick_name" name="nick_name" value="<%=username%>"
												required="required" maxlength="10" class="s-medium">
												<button id="check_duplication" type="button"
													class="round gray">
													<span style="padding-left: 10px; padding-right: 10px; font-weight: bold;">중복확인</span>
												</button>
											</td>
										</tr>

										<tr>
											<th scope="row">프로필이미지</th>
											<td>
												<p class="profile-info">
													각 서비스(이벤트, 매거진, 영화리뷰 등)의 리뷰 및 덧글작성시 등록하신 대표이미지가 노출됩니다.<br>프로필
													이미지 종류를 선택해 주세요.
												</p> <input type="hidden" id="user_image" name="user_image"
												value="<%=dto.getUserPhoto()%>"> <input
												type="hidden" id="user_small_image" name="user_small_image"
												value="<%=dto.getUserPhoto()%>">
												<div class="set-profile-img">
													<div class="box-image">
														<!-- display나중에 삭제 -->
														<span class="thumb-image"> <img
															id="img_userprofileimage" src="<%=dto.getUserPhoto()%>"
															onerror="errorImage(this, {type:'profile'})"> <span
															class="profile-mask"></span>
															<button type="button" id="delete_image" class="btn-del">✕</button>
														</span>
													</div>
													<div class="box-contents">
														<p>jpg, gif, BMP 파일만 등록 가능합니다. (최대 3M)</p>
														<input type="file" id="profile_upload_file"
															name="profile_upload_file" title="내용">
													</div>
												</div>
												<div class="tbl-breakdown-re marginT20">
													<table style="width: 100%;" summary="개인정보 수집 및 활용 동의 표" class="suzip">
														<colgroup>
															<col style="width: 16%;">
															<col style="width: 34%;">
															<col style="width: 30%;">
															<col style="width: 17%;">
														</colgroup>
														<thead>
															<tr>
																<th scope="col">항목</th>
																<th scope="col">이용목적</th>
																<th scope="col">보유기간</th>
																<th scope="col">동의여부</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td scope="row" style="font-weight: 500;">프로필 사진, 닉네임</td>
																<td>
																	<ul class="dep1_lst">
																		<li class="dep1_lst_li">· 공개된 게시판 서비스의 이미지 등록</li>
																		<li class="dep1_lst_li">· 공개된 게시판의 익명성 보장</li>
																	</ul>
																</td>
																<td style="vertical-align: middle;">약관 철회 후 1주일 까지</td>
																<td>
																	<!-- 동의함 또는 동의안함 체크시 inp_inbox에 on 클래스 toggle 처리 필요 -->
																	<span class="inp_inbox on"> <input
																		name="rd_agree_profileInfo"
																		id="rd_agree_profileInfo_Y" type="radio" value="Y"
																		checked="checked"><label for="agreeChk2-1">동의함</label>
																</span><br> <span class="inp_inbox"> <input
																		name="rd_agree_profileInfo"
																		id="rd_agree_profileInfo_N" type="radio" value="N"><label
																		for="agreeChk2-2">동의안함</label>
																</span>
																</td>
															</tr>
														</tbody>
													</table>
													<p class="marginT10">※ 동의를 거부하실 권리가 있으며 이 경우 게시판 작성 시
														아이디가 일부 숨김처리되어 보여집니다.</p>
												</div>

											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="set-btn aright">
								<button type="submit" id="set_profile" class="round inred on">
									<span>등록하기</span>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.html"></jsp:include>
</body>
<script type="text/javascript">
	var imgSrc = $("#img_userprofileimage").attr("src");

	if (imgSrc === "../img/회원.png") {
		$("#delete_image").hide();
	} else {
		$("#delete_image").show();
	}

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
					$("#nick_name").val("");
				} else {
					alert("입력하신 닉네임 정보는 사용가능한 정보 입니다.");
				}
			}
		})
	});

	$(".btn-del").click(
			function() {
				var s = confirm("설정된 프로필 이미지를 삭제 하시겠습니까?");

				if (s) {
					$("span.thumb-image img#img_userprofileimage").attr("src",
							"../img/회원.png");
					$("#delete_image").hide();
				}

			});
</script>
</html>