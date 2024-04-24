<%@page import="data.user.member.MemberDto"%>
<%@page import="data.user.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=Noto+Sans+KR&family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">


#myhome {
    clear: both;
    padding-bottom: 50px;
    position: relative;
    width: 980px;
    margin: 0 auto;
}

.my-info-wrap {
    width: 882px;
    height: 200px;
    padding: 25px 40px 0 58px;
    background: #DDDDDD;
}

span.thumb-image{
	float: left;
    width: 135px;
    height: 135px;
}

span.thumb-image img{
	width: 150px;
	height: 150px;
	border-radius: 100px;
	
}

div.box-contents{
	float: right;
    width: 600px;
    padding-top: 25px;

}

.my-info-wrap .set-person-info > .box-contents > .person-info {
    margin-bottom: 15px;
    padding-bottom: 15px;
    border-bottom: 1px solid #AAAAAA;
    width: 482px;
}

em {
    font-style: normal;
    margin-right: 8px;
    margin-left: 8px;
    margin-top: 2px;
}

.my-info-wrap .set-person-info > .box-contents > .person-info > strong {
    font-size: 29px;
    line-height: 32px;
}

.my-info-wrap .sect-person-info > .box-contents.newtype > .person-info, .my-info-wrap .sect-person-info > .box-contents.newtype > .grade-info {
    width: 482px;
}

.my-info-wrap .set-person-info > .box-contents.newtype > .grade-info p{
    margin-bottom: 4px;
    color: #342929;
    font-size: 20px;
    line-height: 20px;
}

.cols-content {
    padding-top: 25px;
    margin-top: 25px;
}

.cols-content .col-aside:first-child {
    float: left;
}

ul, li {
	list-style: none;
	padding-left: 0px;
}


a {
    text-decoration: none;
}

.cols-content .col-aside {
    width: 160px;
}

.cols-content .col-aside .snb > ul > li.on{

}

.cols-content .col-aside .snb > ul > li.on > a {
    background-color: #fb4357;
    color: #fdfcf0;
}

.cols-content .col-aside .snb > ul > li > a {
    width: 155px;
    height: 34px;
    padding-left: 10px;
    color: #222;
    font-weight: 600;
    font-size: 14px;
    line-height: 34px;
    display: block;
}

.cols-content .col-aside .snb li li > a {
    width: 125px;
    height: 14px;
    padding: 0 0 0 35px;
    font-size: 14px;
    color: #666;
    line-height: 14px;
    white-space: nowrap;
    letter-spacing: -0.02em;
}

.cols-content .col-aside .snb li ul {
    padding: 10px 0;
}

.cols-content .col-detail {
    float: right;
    position: relative;
    width: 700px;
}

.cols-content .col-aside .snb > ul > li.my-movie {
    background-color: #222;
    border: 0 none;
    margin-bottom: 5px;
    margin-top: 5px;
}

.cols-content .col-aside .snb > ul > li.my-movie > a {
    width: 160px;
    padding-left: 14px;
    color: #fff;
}

.set-my-reserve {
    margin-bottom: 30px;
}

.set-my-reserve .box-polaroid {
    overflow: hidden;
    background-color: #f8f8f8;
    border: 1px solid #333;
}

.set-my-reserve.movielog.col2 .box-inner {
    width: 265px;
    padding: 0;
    text-align: center;
    line-height: 16px;
}

.set-my-reserve .box-inner {
    float: left;
    width: 308px;
    padding: 32px 0 32px 90px;
    border-left: 1px dashed #cdc9c0;
}
</style>
<%
String username = (String) session.getAttribute("username");
MemberDao mdao = new MemberDao();
int memberId = mdao.getMemberIdByUsername(username);
MemberDto dto = mdao.getMemberById(memberId);
%>
</head>
<body>
	<div id="wrap">
		<div class="center">
			<div id="myhome">
				<!-- 컨텐츠 시작 -->
				<div class="set-common">
					<div class="my-info-wrap">
						<div class="set-person-info">
							<div class="box-image">
								<span class="thumb-image">
									<img src="<%=dto.getUserPhoto()%>">
									<span class="profile-mask"></span>
								</span>
							</div>
							<div class="box-contents newtype">
								<div class="person-info">
									<strong><!-- 로그인한 유저 NAME--><%=dto.getName() %><span>님</span></strong>
									<em><!-- 로그인한 유저 USERNAME --><%=username %></em>
									<button id="go_edit_page" type="button" title="새창열림">나의 정보 변경</button>
								</div>
								<div class="grade-info">
									<p>고객님은 총 <a href="myReserve.jsp" style="color: #fb4357; font-weight: bold;">0</a>개의 영화를 예매했습니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="cols-content" id="menu">
				    <div class="col-aside">
					    <div class="snb">
					        <ul>
					            <li>
				                    <a href="myHome.jsp">MY HOME<i></i></a>
				                </li>
					            <li>
				                    <a href="myReserve.jsp">나의 예매내역 <i></i></a>
				                    <ul>
				                       <li>
				                            <a href="myReserve.jsp">예매내역 확인</a>
				                        </li>
				                    </ul>
				                </li>
					            <li>
				                    <a href="myInfoEdit.jsp">회원정보<i></i></a>
					                <ul>
				                        <li>
				                            <a href="myInfoEdit.jsp">개인정보 변경</a>
				                        </li>
					                    <li>
				                            <a href="myInfoLeave.jsp">회원탈퇴</a>
				                        </li>
					                </ul>
					            </li>
				                <li class="on">
				                    <a href="myProfileEdit.jsp">프로필 관리<i></i></a>
				                </li>
					            <li>
				                    <a href="myInquiry.jsp">나의 문의내역 <i></i></a>
					                <ul>
					                    <li>
				                            <a href="myInquiry.jsp">1:1 문의</a>
				                        </li>
					                </ul>
					            </li>
				                <li class="my-movie">
				                	<a href="myMovieLogWatched.jsp">내가 본 영화<span style="margin-left: 38px;">↗️</span></a>
				                </li> 
					        </ul>
					    </div>
				    </div>
				    <div class="col-detail" id="mycgv_contents">
						<div class="tit-mycgv">
						    <h3>나의 정보</h3>
						</div>
						<div class="tit-mycgv">
						    <h4>나의 프로필/정보</h4>
						</div>
						<form name="aspnetForm" method="post" action="updateProfile.jsp" id="aspnetForm" enctype="multipart/form-data" novalidate="novalidate">
						<div class="tbl-form">
						    <table summary="나의프로필정보 이름,아이디, 닉네임,프로필이미지 표기">
						        <colgroup>
						        <col width="19%">
						        <col width="*">
						        </colgroup>
						        <tbody>
						            <tr>
						                <th scope="row">이름</th>
						                <td><strong><%=dto.getName() %></strong></td>
						            </tr>
						            <tr>
						                <th scope="row"><label for="nick_name">닉네임</label></th>
						                <td>
						                    <p>한글, 영문, 숫자 혼용 가능 (한글 기준 10자 이내)</p>
						                    <input type="hidden" id="memberId" name="memberId" value="<%=memberId%>"> 
						                    <input type="hidden" id="old_nick_name" name="old_nick_name" value="<%=username%>"> 
						                    <input type="text" id="nick_name" name="nick_name" value="<%=username%>" required="required" maxlength="10" class="s-medium"> 
						                    <button id="check_duplication" type="button" class="round gray"><span>중복확인</span></button>
						                </td>
						            </tr>
						            
						            <tr>
						                <th scope="row">프로필이미지</th>
						                <td>
						                    <p class="profile-info">각 서비스(이벤트, 매거진, 영화리뷰 등)의 리뷰 및 덧글작성시 등록하신 대표이미지가 노출됩니다.<br>프로필 이미지 종류를 선택해 주세요.</p>
						                    <input type="hidden" id="user_image" name="user_image" value="<%=dto.getUserPhoto()%>">
						                    <input type="hidden" id="user_small_image" name="user_small_image" value="<%=dto.getUserPhoto()%>">
						                    <div class="sect-profile-img">
						                        <div class="box-image"  style="display: flex;"><!-- display나중에 삭제 -->
						                            <span class="thumb-image">
						                                <img id="img_userprofileimage" src="<%=dto.getUserPhoto()%>" onerror="errorImage(this, {type:'profile'})">
						                                <span class="profile-mask"></span>
						                                <button type="button" id="delete_image" class="btn-del">프로필이미지 삭제</button>
						                            </span>
						                        </div>				                       
						                        <div class="box-contents">
						                            <p>jpg, gif, BMP 파일만 등록 가능합니다. (최대 3M)</p>
						                            <input type="file" id="profile_upload_file" name="profile_upload_file" title="내용">
						                        </div>
						                    </div>
											<div class="tbl-breakdown-re marginT20">
												<table style="width:100%;" summary="개인정보 수집 및 활용 동의 표">
													<caption>개인정보 수집 및 활용 동의</caption>
													<colgroup>
														<col style="width:16%;">
														<col style="width:34%;">
														<col style="width:34%;">
														<col style="width:16%;">
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
															<th scope="row">프로필 사진, 닉네임</th>
															<td>
																<ul class="dep1_lst">
																	<li class="dep1_lst_li">· 공개된 게시판 서비스의 이미지 등록</li>
																	<li class="dep1_lst_li">· 공개된 게시판의 익명성 보장</li>
																</ul>
															</td>
															<td>약관 철회 후 1주일 까지</td>
															<td>
																<!-- 동의함 또는 동의안함 체크시 inp_inbox에 on 클래스 toggle 처리 필요 -->
																<span class="inp_inbox on">
																	<input name="rd_agree_profileInfo" id="rd_agree_profileInfo_Y" type="radio" value="Y" checked="checked"><label for="agreeChk2-1">동의함</label>
																</span>
																<span class="inp_inbox">
																	<input name="rd_agree_profileInfo" id="rd_agree_profileInfo_N" type="radio" value="N"><label for="agreeChk2-2">동의안함</label>
																</span>
															</td>
														</tr>
													</tbody>
												</table>
												<p class="marginT10">※ 동의를 거부하실 권리가 있으며 이 경우 게시판 작성 시 아이디가 일부 숨김처리되어 보여집니다.</p>
											</div>
						
						                </td>
						            </tr>
						        </tbody>
						    </table>
						</div>
						<div class="set-btn aright"><button type="submit" id="set_profile" class="round inred on"><span>등록하기</span></button></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
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

$(".btn-del").click(function() {
	var s = confirm("설정된 프로필 이미지를 삭제 하시겠습니까?");
	
	if(s){
		$("span.thumb-image img#img_userprofileimage").attr("src", "../img/회원.png");	
		$("#delete_image").hide();
	}

});
</script>
</html>