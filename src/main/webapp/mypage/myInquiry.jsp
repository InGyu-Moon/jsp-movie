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

.round.gray {
    border: 2px solid #7b7b7b;
    color: #7b7b7b;
}

.round.red {
    border: 2px solid #fb4357;
    color: #7b7b7b;
}

.round.on.gray {
    border: 2px solid #7b7b7b;
    background-color: #7b7b7b;
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
MemberDao mdao = new MemberDao();
InquiryDao idao = new InquiryDao();
int memberId = mdao.getMemberIdByUsername(username);
MemberDto dto = mdao.getMemberById(memberId);

//전체갯수
int totalCount=idao.getTotalCount(memberId);
int perPage=5; //한페이지당 보여질 글의 갯수
int perBlock=5; //한블럭당 보여질 페이지 갯수
int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이0번,오라클은 1번);
int startPage; //각블럭당 보여질 시작페이지
int endPage; //각블럭당 보여질 끝페이지
int currentPage;  //현재페이지
int totalPage; //총페이지수
int no; //각페이지당 출력할 시작번호

//현재페이지 읽는데 단 null일경우는 1페이지로 준다
if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

//총페이지수 구한다
//총글갯수/한페이지당보여질갯수로 나눔(7/5=1)
//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

//각블럭당 보여질 시작페이지
//perBlock=5일경우 현재페이지가 1~5일경우 시작페이지가 5,끝페이지가 1
//현재가 13일경우 시작:15 끝:11
startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

//총페이지가 23일경우 마지막블럭은 끝페이지가 1
if(endPage>totalPage)
	endPage=totalPage;

//각페이지에서 보여질 시작번호
//1페이지:0, 2페이지:5 3페이지: 10.....
startNum=(currentPage-1)*perPage;

//각페이지당 출력할 시작번호 구하기
//총글개수가 23  , 1페이지:23 2페이지:18  3페이지:13
no=totalCount-(currentPage-1)*perPage;

//페이지에서 보여질 글만 가져오기
List<InquiryDto> list = idao.selectMemberInquity(memberId, startNum, perPage);


/*마지막 페이지의 단 한개 남은 글을 삭제시 빈페이지가 남는다 그러므로 해결책은 그이전페이지로 가면 된다  */
if(list.size()==0 && currentPage!=1)
{%>
	<script type="text/javascript">
	location.href="index.jsp?main=smartboard/boardlist.jsp?currentPge=<%=currentPage-1%>";
	</script>
<%}


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
									<img src="<%=dto.getUserPhoto()%>">
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
				    <div class="col-detail" id="my_contents">	    
						<form name="aspnetForm" method="post" id="aspnetForm" novalidate="novalidate">
							<div>					
							</div>
							
							<div>							
							</div>
							    <div class="tit-my">
								    <h3>나의 문의내역</h3>
							    </div>
								<div class="tit-my">
								    <h4>1:1 문의</h4>
								</div>
							    <div class="set-btn">
							        <p class="del">							             
							            총 <strong class="txt-red"><%=totalCount%></strong>건 
							            <button type="submit" id="btnDelete" class="round black"><span>선택삭제</span></button>
							        </p>
							    </div>
							    <div class="tbl-data">
							        <table summary="문의내역 및 답변내역에 대한 정보 제공">
									    <colgroup>
									        <col width="9%">
									        <col width="15%">
									        <col width="*">
									        <col width="13%">
									    </colgroup>
							            <thead>
							                <tr>
							                    <th scope="col">
							                    	<input type="checkbox" class="alldelcheck">
							                    	<label for="chkAllItem">번호</label>
							                    </th>
							                    <th scope="col">유형</th>
							                    <th scope="col">제목</th>
							                    <th scope="col">상태</th>
							                </tr>
							            </thead>
							            <tbody id="items">
							            <%
											if(totalCount==0){
										%>							                							                
							                <tr>
							                    <td colspan="4" class="nodata">
							                        
							                        고객님의 상담 내역이 존재하지 않습니다.
							                        
							                    </td>
							                </tr>
							            <%
										}else{
											for(int i=0;i<list.size();i++){
												InquiryDto idto = list.get(i);
										%>       
					                        <tr>
					                            <td>
					                                <input type="checkbox" class="alldel" value="<%=idto.getInquiryId()%>">
					                                <label for="chkItem1508908"><em><%=no-i %></em></label>
					                            </td>
					                            <td><%=idto.getOption() %></td>
					                            <td>
					                                <a href="inquiryDetail.jsp?num=<%=idto.getInquiryId() %>&currentPage=<%=currentPage%>" class="inquiry-title">
					                                    <%=idto.getTitle() %>
					                                </a>
					                            </td>
					                            <%
												    String answervalue = idto.getAnswer() != null ? idto.getAnswer() : "";
												%>
												<td>
													<span class="round <%= answervalue != "" ? "red" : "gray" %> on" value="<%= answervalue %>">
													<i><%= answervalue != "" ? "답변완료" : "접수완료" %></i>
													</span>
												</td>
					                        </tr>
					                      <%
											}
										}
										%>							                   							                
							            </tbody>
							        </table>
							    </div>
							<!-- 페이지 번호 출력 -->
							<div class="paging">
							  <ul class="pagination justify-content-center">
							  <%
							  //이전
							  if(startPage>1)
							  {%>
								  <li class="page-item ">
								   <a class="page-link" href="myInquiry.jsp?currentPage=<%=startPage - 1%>" style="color: black;">이전</a>
								  </li>
							  <%}
							    for(int pp=startPage;pp<=endPage;pp++)
							    {
							    	if(pp==currentPage)
							    	{%>
							    		<li class="page-item active">
							    		<a class="page-link" href="myInquiry.jsp?currentPage=<%=pp%>"><%=pp %></a>
							    		</li>
							    	<%}else
							    	{%>
							    		<li class="page-item">
							    		<a class="page-link" href="myInquiry.jsp?currentPage=<%=pp%>"><%=pp %></a>
							    		</li>
							    	<%}
							    }
							    
							    //다음
							    if(endPage<totalPage)
							    {%>
							    	<li class="page-item">
							    		<a  class="page-link" href="myInquiry.jsp?currentPage=<%=endPage+1%>"
							    		style="color: black;">다음</a>
							    	</li>
							    <%}
							  %>
							  
							  </ul>
							</div>
							
							    <div class="sect-mycgv-reserve qna">
							        <div class="box-polaroid">
								        <div class="box-inner qna">
								            <p><strong>자주하시는 질문</strong> <a href="../customer/faq.jsp" class="round gray on"><span>바로가기</span></a></p>
								            <span>고객님들께서 주로 하시는 질문에 대한 답변을<br>한곳에 모아두었습니다.</span>
								        </div>
								        <div class="box-inner words">
								            <p><strong>고객의 말씀</strong> <a href="../customer/inquiry.jsp" class="round gray on"><span>문의하기</span></a></p>
								            <span>불편사항과 문의사항을 남겨주시면 친절히<br>답변드리겠습니다.</span>
								        </div>
								    </div>
							    </div>
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	
//전체 체크 클릭시 체크값 얻어서 모든 체크값에 전달
$(".alldelcheck").click(function() {
	
	//전체 체크값 얻기
	var chk = $(this).is(":checked");
	console.log(chk);
	
	//전체 체크값을 글앞 체크에 일괄 전달하기 
	$(".alldel").prop("checked",chk);
});

$(".alldel").click(function() {
    if (!$(this).is(":checked")) {
        $(".alldelcheck").prop("checked", false);
    }
});

//삭제버튼 클릭시 삭제
$("#btnDelete").click(function() {
	var len=$(".alldel:checked").length;
	//alert(len);
	
	if(len==0){
		alert("삭제할 문의건을 먼저 선택해 주세요.");
	}else{
		var a = confirm(len+"개의 글을 삭제하시겠습니까?");
		
		if (a) {
            var n = "";
            $(".alldel:checked").each(function(idx) {
                n += $(this).val() + ",";
            });

            n = n.substring(0, n.length - 1);
            console.log(n);
            
            location.href = "mypage/inquiryDelete.jsp?nums=" + n;
        } else {
            // 사용자가 "취소"를 선택한 경우
            alert("삭제가 취소되었습니다.");
        }
	}
})
	
</script>
</html>