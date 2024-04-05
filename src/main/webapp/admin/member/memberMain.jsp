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
<h2 style="margin-bottom: 50px">회원 관리</h2>
<form class="d-flex" method="post" action="#">
    <select class="form-select " style="width: 110px;">
        <option value="전체" selected>전체</option>
        <option value="아이디">아이디</option>
        <option value="이름">이름</option>
        <option value="휴대폰">휴대폰</option>
    </select>
    <input type="text" class="form-control" placeholder="검색어" style="margin-left: 30px;margin-right: 30px; width: 280px;">
    <button type="submit" class="btn btn-outline-primary">조회</button>
</form>

<hr>

<table class="table table-bordered" style="width: 800px">
    <caption align="top"><b>전체 회원 명단</b></caption>
    <tr class="table-success">
        <th width="80">번호</th>
        <th width="180">아이디</th>
        <th width="180">이름</th>
        <th width="200">가입일</th>
        <th width="150">기타</th>
    </tr>
    </table>



</body>
</html>