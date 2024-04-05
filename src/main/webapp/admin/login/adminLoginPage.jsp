<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>

    <%-- IBM Plex Sans KR--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

    <title>관리자 로그인</title>
</head>

<body style=" font-family: 'IBM Plex Sans KR';">
<%
    Boolean adminLogin = (Boolean)session.getAttribute("adminLogin");
    System.out.println("adminLogin = " + adminLogin);
%>
<div class="container">
    <div class="row justify-content-center align-items-center" style="height: 90vh;">
        <div style="width: 400px;">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h4 class="card-title text-center">관리자 로그인</h4>
                    <hr class="my-4">
                    <form class="form-signin" method="post" action="adminLoginAction.jsp">
                        <div class="form-label-group">
                            <input type="text" name="adminId" class="form-control" placeholder="관리자 아이디" required autofocus>
                        </div>
                        <br>
                        <div class="form-label-group">
                            <input type="password" name="adminPw" class="form-control" placeholder="비밀번호" required>
                        </div>
                        <hr class="my-4">
                        <div class="text-center">
                            <button class="btn btn-outline-primary btn-block text-uppercase" type="submit">로그인</button>
                        </div>
                        <hr class="my-4">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>