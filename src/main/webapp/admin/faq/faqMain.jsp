<%@page import="java.util.List"%>
<%@page import="data.inform.faq.FaqDao"%>
<%@page import="data.inform.faq.FaqDto"%>
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
<title>FAQ</title>
<style type="text/css">
	a{
		text-decoration: none; /* 링크의 밑줄 제거 */
		color: inherit; /* 링크의 색상 제거 */
	}
	.table-custom th:nth-child(1) {W
	    width: 10%; /* 1 / (1 + 3 + 6) * 100% */
	}
	
	.table-custom th:nth-child(2) {
	    width: 20%; /* 3 / (1 + 3 + 6) * 100% */
	}
	
	.table-custom th:nth-child(3) {
	    width: 70%; /* 6 / (1 + 3 + 6) * 100% */
	}
	
	.table-custom th:nth-child(2),
	.table-custom td:nth-child(2) {
	    text-align: center;
	}
	
	.table-custom th:nth-child(3),
	.table-custom td:nth-child(3) {
	    text-align: left;
	} 
	
	.table-custom p {
	    margin-left: 20px; /* 원하는 만큼의 여백 설정 */
	}
	
	.table-custom th:nth-child(1),
	.table-custom td:nth-child(1) {
    text-align: center;
	}
	
	.search-wrap {
        display: flex; /* 입력란과 버튼을 수평으로 배치합니다. */
        width: 80%; /* 부모 요소의 너비 설정 */
    }

    #search {
        width: 65%; /* 입력란의 너비 설정 */
    }

    .btn-dark {
        width: 20%; /* 버튼의 너비 설정 */
        margin-left: 10px; 
    }
    
    .center{
    	display:flex;
    	width:100%
    }
    .container-side{
    	width: 20%;
    }
	.container-rightside{
		width:70%;
		margin-left: 20px;
	}
	tbody-th {
	    text-align: left; /* 텍스트를 왼쪽으로 정렬합니다. */
	    margin-left: 20px;
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
		    location.href="?curr=faq/faqDelete.jsp?faqId="+n;
	  }
  })
    
});
</script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	FaqDao dao = new FaqDao();
	List<FaqDto> faqs = dao.getAllFaq();
	int count = dao.getCountFaq();
%>
<div class="center">
	<%-- <%@ include file="../layout/navbar.jsp" %> --%>
	<%-- <div class="container-side" style="width: 20%;">
	    <%@ include file="../layout/navbar.jsp" %>
	</div> --%>
	<div class="container-rightside" style="width: 80%;">
		<h2 style="margin-bottom: 50px">FAQ</h2>
		<hr style="margin-bottom: 30px">
		
		<div class="container">
			<div class="container d-flex justify-content-between align-items-center">
			    <div>
			        <button type="button" class="btn btn-outline-danger ml-2 btndel">선택삭제</button>
			        <button type="button" class="btn btn-outline-info ml-2"
			        		onclick="location.href='?curr=faq/faqForm.jsp'">생성</button>
			    </div>
			    <span><small>총 <%=count %></small></span>
			</div>
			
		    <!-- board seach area -->
		    <br>
		       <div class="container">
				    <div class="search-window">
				        <form action="faqSearch.jsp" method="post">
						    <div class="search-wrap">
						        <input id="search" class="form-control" type="search" name="" placeholder="검색어를 입력해주세요;">
						        <button type="submit" class="btn btn-dark">검색</button>
						        
						    </div>
						</form>
						<br>
				    </div>
				</div>
		   
		  <!-- board list area -->
		     <div class="container">
		         <table class="table table-bordered table-hover table-custom">
		             <thead>
		             <tr>
		             	<thead class="table-light">
			             	<th><input type="checkbox" class="th-check"></th>
			                <th>구분</th>
			                <th style="text-align: center;">질문</th>
		                </thead>
		             </tr>
		             </thead>
		             <!-- -------------------------------------------------------------- -->
		             <tbody>
					<% 
						for(FaqDto faq : faqs) {
							System.out.println(faq.getFaqId());
							
					%>
		             <tr>
		             	<td><input type="checkbox" class="check" value="<%=faq.getFaqId() %>"></td>
		                 <td><%=faq.getCategory() %></td>
		                 <th class="tbody-th">
		                   <a href="#!">&nbsp;&nbsp;<strong>Q.</strong>&nbsp;<%=faq.getQuestion() %></a>
		                   <p>
		                   <br>
		                   <strong>A.</strong>
	                		<br>
		                   	<%=faq.getAnswer() %>
		                   </p>
		                 </th>
		             </tr>
					<%
						}
					%>
		             </tbody>
		             <!-- -------------------------------------------------------------------- -->
		         </table>
		    </div>
		
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
 	// 페이지 로드 시 슬라이드를 닫습니다.
    $('.table-bordered a').parent().find('p').slideUp();

 	// 각각의 a 태그에 대해 클릭 이벤트를 설정합니다.
    $('.table-bordered a').click(function(e){
        // 기본 동작을 막습니다. => 링크를 막음
        e.preventDefault();
        // 클릭된 a 태그의 부모인 th를 선택합니다.
        var parent = $(this).parent();
        // 형제 요소인 p 태그를 찾아서 슬라이드 토글 애니메이션을 수행합니다.
        parent.find('p').slideToggle();
    });
    
});
</script>

</body>
</html>