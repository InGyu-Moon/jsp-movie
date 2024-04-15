r<%@page import="data.user.member.Gender"%>
<%@ page import="data.user.member.MemberDao" %>
<%@ page import="data.user.member.MemberDto" %>
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
    <title>Insert title here</title>
</head>
<%
    int memberId = Integer.parseInt(request.getParameter("memberId"));
    MemberDao dao = new MemberDao();
    MemberDto dto = dao.getMemberById(memberId);
    
    String gender = dto.getGender().name();
    
    String str = dto.getEmail();
	String[] parts = str.split("@");

	// "@" 기준으로 분할된 첫 번째 부분
	String firstEmail = parts[0];

	// "@" 기준으로 분할된 두 번째 부분
	String lastEmail = parts[1];
	
	System.out.println(firstEmail+"@"+lastEmail);
    
    if(dto.getUserName()==null){
        System.out.println(dto.getUserName());
%>
<script>
    alert("존재하지 않는 회원입니다.");
    history.back();
</script>
<%
    }
%>
<body>
<h2 style="margin-bottom: 50px">회원 정보</h2>
<hr style="margin-bottom: 30px">
<div>
    <%
        if(dto.getUserPhoto() != null){
    %>
    <img src="<%= dto.getUserPhoto() %>" alt="프로필 사진" width="150" height="150">
    <%
    }else{
    %>
    <!-- 디폴트 이미지 출력 -->
    <img src="../../img/회원.png" alt="프로필 사진" width="150" height="150">
    <%
        }

    %>
    <br>
	<form>
		<table class="table" style="width: 80%;">
			<tr style="background-color: #99aaff">
				<th style="width: 30%; text-align: center; background-color: #99aaff;">구분</th>
        		<th style="width: 70%; text-align: center; background-color: #99aaff;">정보</th>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">사용자명</th>
        		<td style="width: 70%;">
        			<%=dto.getUserName() %>
        		</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">비밀번호</th>
        		<td style="width: 70%;">
        			<%=dto.getPassword() %>
       			</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">이름</th>
        		<td style="width: 70%;">
        			<%=dto.getName() %>
       			</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">생년월일</th>
        		<td style="width: 70%;">
        			<%=dto.getBirthdate() %>
       			</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">성별</th>
        		<td style="width: 70%;">
        			<%
        				String gen="";
        				if(gender.equals("Male")) gen="남성";
        				else if(gender.equals("Female")) gen="여성";
        				else if(gender.equals("Other")) gen="비공개";
        				else gen="NULL";
        			%>
        			<%=gen %>
       			</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">이메일</th>
        		<td style="width: 70%;">
        			<%=dto.getEmail() %>
        		</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">주소</th>
        		<td style="width: 70%;">
	        		<%=dto.getAddress() %>
        		</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">핸드폰번호</th>
        		<td style="width: 70%;">
        			<%=dto.getPhoneNumber() %>
       			</td>
			</tr>
			
			
		</table><br>
		<div style="float: right; margin-right: 20%;">
			<a type="button" class="btn btn-outline-warning" href="/admin/adminMainPage.jsp?curr=member/memberUpdateForm.jsp?memberId=<%=dto.getId()%>">수정</a>&nbsp;
			<a type="button" class="btn btn-outline-danger" href="member/memberDelete.jsp?memberId=<%=dto.getId()%>">삭제</a>&nbsp;
			<button class="btn btn-outline-success" onclick="history.back()">목록</button>
	    </div>
	</form>
	
</body>
</html>
</body>
</html>