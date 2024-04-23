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

</script>
</head>
<%
	request.setCharacterEncoding("utf-8");
	int inquiryId = Integer.parseInt(request.getParameter("inquiryId"));
	
	System.out.println("1대1 문의 상세 inquiryId : "+inquiryId);

    InquiryDao dao = new InquiryDao();
    InquiryDto inquiry = dao.getInquity(inquiryId);
    
    System.out.println("memberDetail.jsp INQUIRY TO STRING "+ inquiry.toString());
    
    String option = inquiry.getOption() != null ? inquiry.getOption().name() : "No Option"; // Option이 null이면 "No Option"으로 처리
    
%>


<body>
<div class="center">
	<div class="container-rightside" style="width: 80%;">
		<h2 style="margin-bottom: 50px">1:1 문의 상세</h2>
		<hr style="margin-bottom: 30px">
		<br>
		<%-- 문의 디테일 출력 --%>
		<h3>문의 내용</h3>
		<form action="inquiry/inquiryAnswerInsert.jsp" method="post" ><!-- enctype="multipart/form-data" -->
			<input type="hidden" name="id" value="<%=inquiry.getInquiryId() %>">
			<table class="table">
				<tr>
					<th>구분</th>
					<td>
					<input type="text" class="form-control" name=inquiryOption value="<%=inquiry.getOption() %>" readonly="readonly"
							style="width:100px;">
					<%-- <select name="inquiryOption" class="form-select " style="width: 110px;">
				        <option value="영화관" <%=option.equals("영화관")? "selected" : ""%> >영화관</option>
				        <option value="영화" <%=option.equals("영화")? "selected" : ""%>>영화</option>
				        <option value="예매/결제" <%=option.equals("예매/결제")? "selected" : ""%>>예매/결제</option>
				        <option value="이벤트" <%=option.equals("이벤트")? "selected" : ""%>>이벤트</option>
				        <option value="개인정보" <%=option.equals("개인정보")? "selected" : ""%>>개인정보</option>
				    </select> --%>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" class="form-control" name="title" value="<%=inquiry.getTitle() %>" readonly="readonly">				
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" class="form-control" rows="10" cols="75" readonly="readonly"><%=inquiry.getContent()%></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부이미지</th>
					<td>
						<input type="file" name="attachment" >				
					</td>
				</tr>
				<tr>
					<th>답변할 내용</th>
					<td>
						<%if(inquiry.getAnswer() == null){ %>
							<textarea name="answer" class="form-control" rows="10" cols="75" placeholder="답변 내용 작성"></textarea>
						<%} else {%>
							<textarea name="answer" class="form-control" rows="10" cols="75" placeholder="답변 내용 작성"><%=inquiry.getAnswer()%></textarea>		
						<%} %>
					</td>
				</tr>
			</table>
			<div style="float: right;">
				<button type="submit" class="btn btn-outline-info" >저장</button>
				<button type="button" class="btn btn-outline-warning" 
						onclick="location.href='/admin/adminMainPage.jsp?curr=inquiry/inquiryUpdateForm.jsp?inquiryId=<%=inquiry.getInquiryId()%>'">수정</button>
				<button type="button" class="btn btn-outline-success" onclick="history.back()">목록</button>
			</div>
		</form>
		
	</div>
</div>


</body>
</html>