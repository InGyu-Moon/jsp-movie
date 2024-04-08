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
<body>
<%
    String memberId = request.getParameter("memberId");
    MemberDao dao = new MemberDao();
    MemberDto dto = dao.getMemberById(memberId);
%>
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
    사용자명: <%= dto.getUserName() %><br>
    이름: <%= dto.getName() %><br>
    성별: <%= dto.getGender() %><br>
    이메일: <%= dto.getEmail() %><br>
    생년월일: <%= dto.getBirthdate() %><br>
    주소: <%= dto.getAddress() %><br>
    전화번호: <%= dto.getPhoneNumber() %><br>
</div>

<a type="button" class="btn btn-outline-primary">왼료</a>
<button class="btn btn-outline-success" onclick="history.back()">뒤로</button>
</body>
</html>