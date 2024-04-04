<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<title>MOVIE 메인페이지</title>
<style type="text/css">
    body{
        margin:100px
    }
</style>
</head>
<%
    Enumeration<String> attributeNames = session.getAttributeNames();
    boolean nonMember = true; // 기본적으로 비회원으로 설정
    boolean member = false; // 회원으로 설정
    boolean anyone = false; // 아무나로 설정

    while (attributeNames.hasMoreElements()) {
        String attributeName = attributeNames.nextElement();
        System.out.println(attributeName);
        if(attributeName.equals("nonPassword")){ // 비회원이 로그인한 경우
            %>
            <script type="text/javascript">
                $(document).ready(function(){
                    $('.non_member_page').show();
                    $('.member_page').hide();
                    $('.anyone_page').hide();
                });
            </script>
            <%
            nonMember = false; // 비회원이 아니라고 설정
        }
        else if(attributeName.equals("username")){ // 회원이 로그인한 경우
            %>
            <script type="text/javascript">
                $(document).ready(function(){
                    $('.non_member_page').hide();
                    $('.member_page').show();
                    $('.anyone_page').hide();
                });
            </script>
            <%
            member = true; // 회원이 맞다고 설정
        }
    }

    // 비회원이나 회원이 아닌 경우
    if(nonMember && !member) {
        %>
        <script type="text/javascript">
            $(document).ready(function(){
                $('.non_member_page').hide();
                $('.member_page').hide();
                $('.anyone_page').show();
            });
        </script>
        <%
    }
%>
<body>
<div class="member_page">
    <h1>Welcome MOVIE 회원만 보이는 페이지</h1>
    <button type="button" onclick="location.href='log/loginForm.jsp'">로그인</button>
    <button type="button" onclick="location.href='log/logoutAction.jsp'">로그아웃</button>
</div>

<div class="non_member_page">
    <h1>Welcome MOVIE 비회원만 보이는 페이지</h1>
    <button type="button" onclick="location.href='log/loginForm.jsp'">로그인</button>
    <button type="button" onclick="location.href='log/logoutAction.jsp'">로그아웃</button>
</div>

<div class="anyone_page">
    <h1>Welcome MOVIE 아무나 보이는 페이지</h1>
    <button type="button" onclick="location.href='log/loginForm.jsp'">로그인</button>
    <button type="button" onclick="location.href='log/logoutAction.jsp'">로그아웃</button>
</div>
    
</body>
</html>
