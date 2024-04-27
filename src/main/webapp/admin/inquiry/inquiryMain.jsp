<%@page import="data.user.member.MemberDto"%>
<%@page import="data.user.member.MemberDao"%>
<%@page import="data.inform.inquiry.InquiryDto"%>
<%@page import="java.util.List"%>
<%@page import="data.inform.inquiry.InquiryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
         rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
   
  <style type="text/css">
   	.container-rightside{
		width:70%;
		margin-left: 20px;
	}
	.center{
    	display:flex;
    	width:100%
    }
    .header-container {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	}
    a{
    	text-decoration-line: none;
    	color: inherit;
    }
    
</style>
<script type="text/javascript">
$(document).ready(function(){
 	// 전체체크 클릭 시 체크값 얻어서 모든 체크값에 전달
    $(".th-check").click(function(){
        // 전체 체크값 얻기
    	var chk=$(this).is(":checked"); // th-check 체크박스 체크 상태를 확인
		console.log(chk);
		  
		//전체체크값을 글앞에 체크에 일괄 전달하기
		$(".check").prop("checked",chk);
    });
 	
    //선택삭제 버튼 클릭 시 삭제
    $(".btndel").click(function(){
	  
	    var len=$(".check:checked").length;
	    console.log(len);
	  
	    if(len==0){
		    alert("최소 1개이상의 글을 선택해 주세요");
	    }else{
		  
		    //체크된 곳의 value값(num)얻기
		    var n="";
		    $(".check:checked").each(function(idx){
		    	n+=$(this).val()+",";
		    });
		    
		    console.log(n);
		  
		    //마지막 컴마 제거
		    n=n.substring(0,n.length-1);
		    console.log(n);
		  
		    //삭제파일로 전송
		    location.href="inquiry/inquiryDelete.jsp?selectinquiryId="+n;
	  }
  })
    
});
</script>
</head>
<%
    InquiryDao inquirydao = new InquiryDao();
	MemberDao memberDao = new MemberDao();

    // 전체회원목록
    List<InquiryDto> totalInquiryList = inquirydao.selectAllInquity();
    
    int count = inquirydao.getCountInquiry();
    
%>

<%
    //전체갯수
    int totalCount=totalInquiryList.size()+1;
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
    //perBlock=5일경우 현재페이지가 1~5일경우 시작페이지가1,끝페이지가 5
    //현재가 13일경우 시작:11 끝:15
    startPage=(currentPage-1)/perBlock*perBlock+1;
    endPage=startPage+perBlock-1;

    //총페이지가 23일경우 마지막블럭은 끝페이지가 25가 아니라 23
    if(endPage>totalPage)
        endPage=totalPage;

    //각페이지에서 보여질 시작번호
    //1페이지:0, 2페이지:5 3페이지: 10.....
    startNum=(currentPage-1)*perPage;

    //각페이지당 출력할 시작번호 구하기
    //총글개수가 23  , 1페이지:23 2페이지:18  3페이지:13
    no=totalCount-(currentPage-1)*perPage;

    //페이지에서 보여질 글만 가져오기
    List<MemberDto> list = memberDao.getList(startNum, perPage);
%>

<body>
<div class="center">
	<div class="container-rightside" style="width: 80%;">
		<h2 style="margin-bottom: 50px">1:1 문의</h2>
		<hr style="margin-bottom: 30px">
		<form class="d-flex" method="post" action="#" style="margin-bottom: 30px">
		    <select class="form-select " style="width: 110px;">
		        <option value="전체" selected>전체</option>
		        <option value="제목">제목</option>
		        <option value="회원아이디">회원아이디</option>
		        <option value="구분">구분</option>
		    </select>
		    <input type="text" class="form-control" placeholder="검색어" style="margin-left: 30px;margin-right: 30px; width: 280px;">
		    <button type="submit" class="btn btn-outline-primary">조회</button>
		</form>
		
		
		
		<%-- 전체 회원 명단 출력 --%>
		<table class="table table-bordered" style="width: 800px">
			<!-- <caption align="top"><b>전체 회원 명단</b></caption> -->
		    <button type="button" class="btn btn-outline-danger btndel btn-sm" style="margin-bottom: 5px;">선택삭제</button><br>
		    <div class="header-container">
		        <div class="title">
		            <b>문의 리스트</b>
		        </div>
		        <div class="count">
		            <span style="margin-right: 25px;"><small>총 <%=count %></small></span>
		        </div>
		    </div>
		    
		    <tr class="table-light" align="center">
		        <th width="20"><input type="checkbox" class="th-check"></th>
		        <th width="100">회원아이디</th>
		        <th width="100">구분</th>
		        <th width="280">제목</th>
		        <th width="80">파일여부</th>
		        <th width="80">답변여부</th>
		        <th width="100">기타</th>
		    </tr>
		    <%
		        for(InquiryDto inquiry : totalInquiryList){
		        	MemberDto member = memberDao.getMemberById(inquiry.getMemberId());
		        	int id = inquiry.getInquiryId();
		        	//System.out.println("1:1 문의 각 id값 : "+id);
		    %>
		    <tr align="center">
		        <td>
		            <input type="checkbox" value="<%=inquiry.getInquiryId() %>" class="check">
		        </td>
		        <td>
		        	<%=member.getUserName() %>
		        </td>
		        <td>
		        	<%
		        		String option = inquiry.getOption();
		        		if(option.equals("예매_결제")) option = "예매/결제";
		        	%>
		            <%=option %>
		<%--            <a href="<%=dto.getId()%>" class="list-group-item list-group-item-action list-group-item-light"><%=dto.getUserName()%></a>--%>
		        </td>
		        <td>
		            <a href="?curr=inquiry/inquiryDetail.jsp?inquiryId=<%=inquiry.getInquiryId()%>"><%=inquiry.getTitle() %></a>
		        </td>
		        <td>
					<%
						String whether = "X";
						if(inquiry.getAttachment() != null) whether="O";
					%>
					<%=whether %>
		        </td>
		        <td>
					<%
						String answer = "X";
						if(inquiry.getAnswer() != null && !inquiry.getAnswer().equals("") && !inquiry.getAnswer().equals("null")) answer="O";
					%>
					<%=answer %>
		        </td>
		        <td>
		            <a href="?curr=inquiry/inquiryDetail.jsp?inquiryId=<%=id%>" type="button" 
		            	id="btnDetail" class="btn btn-sm btn-outline-success">상세</a>
		        </td>
		    <tr>
		            <%
		        }
		    %>
		
		</table>
		
		<div style="margin: 50px 100px; width: 800px;">
		    <!-- 페이지 번호 출력 -->
		    <ul class="pagination justify-content-center">
		        <%
		            //이전
		            if(startPage>1)
		            {%>
		        <li class="page-item ">
		            <a class="page-link" href="../admin/adminMainPage.jsp?curr=inquiry/inquiryMain.jsp?currentPage=<%=startPage-1%>" style="color: black;">이전</a>
		        </li>
		        <%}
		            for(int pp=startPage;pp<=endPage;pp++)
		            {
		                if(pp==currentPage)
		                {%>
		        <li class="page-item active">
		            <a class="page-link" href="../admin/adminMainPage.jsp?curr=inquiry/inquiryMain.jsp?currentPage=<%=pp%>"><%=pp %></a>
		        </li>
		        <%}else
		        {%>
		        <li class="page-item">
		            <a class="page-link" href="../admin/adminMainPage.jsp?curr=inquiry/inquiryMain.jsp?currentPage=<%=pp%>"><%=pp %></a>
		        </li>
		        <%}
		        }
		
		            //다음
		            if(endPage<totalPage)
		            {%>
		        <li class="page-item">
		            <a  class="page-link" href="../admin/adminMainPage.jsp?curr=inquiry/inquiryMain.jsp?currentPage=<%=endPage+1%>"
		                style="color: black;">다음</a>
		        </li>
		        <%}
		        %>
		
		    </ul>
		
		
		</div>
		
		
	</div>
</div>


</body>
</html>