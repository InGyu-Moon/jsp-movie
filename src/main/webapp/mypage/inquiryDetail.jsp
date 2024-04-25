<%@page import="data.inform.inquiry.InquiryDao"%>
<%@page import="data.inform.inquiry.InquiryDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
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

a{
    text-decoration: none;
}


a.inquiry-title{
    text-decoration: underline;
    color:#222; 
}

.cols-content .col-aside {
    width: 160px;
}

.txt-red{
	color: #fb4357;
}

.cols-content .col-aside .snb > ul > li.on > a {
    background-color: #fb4357;
    color: #fdfcf0;
}

li.onli a{
    color: #fb4357;
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
    width: 800px;
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

.tbl-data{
	padding-bottom: 20px;
}

.tbl-data table {
    border-top: 1px solid #b8b6aa;
    border-bottom: 1px solid #b8b6aa;
}

table {
    font-size: 14px;
    line-height: 1.2;
    color: #666;
    font-weight: 400;
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
}

th, td{
	text-align: center;
    vertical-align: middle;
    font-weight: 700;
    line-height: 1.5em;
}

.tbl-data thead th{
	height: 34px;
    padding-left: 12px;
    background-color: #e2e2e0;
    font-size: 13px;
    line-height: 34px;
}

.tbl-data tbody>tr:first-child td {
    border: 0;
}

.tbl-data td.nodata {
    padding: 45px 0;
    text-align: center;
}


.tbl-data tbody td, .tbl-data tbody th {
    padding: 14px 0 14px 12px;
    border-top: 1px solid #d6d4ca;
}

i {
    font-style: normal;
}

.round > * {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    width: 100%;
    height: 100%;
    padding: 0 5px 0;
}

.round {
    line-height: 23px;
    font-weight: 600;
    font-size: 12px;
    text-align: center;
    vertical-align: middle;
}

.round, .round > * {
    display: inline-block;
    position: relative;
}

.round.blue {
    border: 2px solid #336699;
    color: #ffffff;
}

.round.red {
    border: 2px solid #fb4357;
    color: #ffffff;
}

.round.on.blue {
    border: 2px solid #336699;
    background-color: #336699;
    color: #ffffff;
}

.round.on.red {
    border: 2px solid #fb4357;
    background-color: #fb4357;
    color: #ffffff;
}

.tbl-data tbody td .round {
    margin-left: 5px;
    font-size: 11px;
    line-height: 16px;
}

.paging{
	padding-bottom: 20px;
}
</style>
<%
String username = (String) session.getAttribute("username");
int inquiryId = Integer.parseInt(request.getParameter("num"));
int currentPage = Integer.parseInt(request.getParameter("currentPage"));
MemberDao mdao = new MemberDao();
InquiryDao idao = new InquiryDao();
int memberId = mdao.getMemberIdByUsername(username);
MemberDto dto = mdao.getMemberById(memberId);
//페이지에서 보여질 글만 가져오기
InquiryDto idto = idao.getInquityMember(inquiryId);

SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
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
									<img src="../img/movie_img/yumi/yumi.jpg">
									<span class="profile-mask"></span>
								</span>
							</div>
							<div class="box-contents newtype">
								<div class="person-info">
									<strong><!-- 로그인한 유저 NAME--><%=dto.getName() %><span>님</span></strong>
									<em><!-- 로그인한 유저 USERNAME --><%=username %></em>
									<button id="go_edit_page" type="button" title="새창열림" onclick="location.href='myProfileEdit.jsp'">나의 정보 변경</button>
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
				                <li>
				                    <a href="myProfileEdit.jsp">프로필 관리<i></i></a>
				                </li>
					            <li class="on">
				                    <a href="myInquiry.jsp">나의 문의내역 <i></i></a>
					                <ul>
					                    <li class="onli">
				                            <a href="myInquiry.jsp" style="color: #fb4357;">1:1 문의</a>
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
						<form name="aspnetForm" method="post" id="aspnetForm" novalidate="novalidate">
						<div>
						</div>
						<div>
						</div>
						    <div class="tit-mycgv">
							    <h3>나의 문의내역</h3>
							</div>
							<div class="tit-mycgv">
							    <h4>1:1 문의</h4>
							</div>
						    <div class="tbl-viw">
						        <table summary="">
						            <thead>
						                <tr>
						                    <th scope="row" colspan="2">
						                        <p>
						                        	<%
												    String answervalue = idto.getAnswer() != null ? idto.getAnswer() : "";
													%>
						                            <span class="round <%= answervalue != "" ? "red" : "blue" %> on" value="<%= answervalue %>">
													<i><%= answervalue != "" ? "답변완료" : "답변 중" %></i>
													</span>
						                            <strong><em><%=idto.getTitle() %></em></strong>
						                        </p>
						                    </th>
						                </tr>
						            </thead>
						            <tbody>
						                <tr>
						                    <td colspan="2" class="info">
						                        <dl class="qna">
						                            <dt>유형</dt>
						                            <dd><strong><%=idto.getOption() %></strong></dd>
						                            <dt>연락처</dt>
						                            <dd><strong class="aj_mobile"><%=idto.getPhoneNumber() %></strong></dd>
						                            <dt>첨부파일</dt>
							            		    <dd>
						                            <%=idto.getAttachment() %>
						                            </dd>
						                            <dt>이메일</dt>
						                            <dd><span class="aj_email"><%=idto.getEmail() %></span></dd>
						                        </dl>
						                    </td>
						                </tr>
						                <tr>
						                    <td colspan="2">
						                        <div class="txt-conts">
						                            <%=idto.getContent() %>
						                        </div>
						                        
						
						                    </td>
						                </tr>
						                
						            </tbody>
						        </table>
						    </div>
						
						    <div class="set-btn">
						        <p><button type="button" class="round gray" id="btnDelete"><span>삭제</span></button></p>
						        <p><a class="round inred" id="update" href="/support/qna/default.aspx?Idx=1508909" style="display: none;"><span>수정</span></a></p>
						        <p><a class="round inblack" href="myInquiry.jsp?currentPage=<%=currentPage%>"><span>목록</span></a></p>
						    </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
</script>
</html>