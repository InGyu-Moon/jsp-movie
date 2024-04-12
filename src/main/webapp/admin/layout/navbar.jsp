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

   <%-- 네이버 글꼴 마루--%>
   <link href="https://hangeul.pstatic.net/hangeul_static/css/maru-buri.css" rel="stylesheet">
   <%-- IBM Plex Sans KR--%>
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
   <title>Insert title here</title>


</head>
<body>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark vh-100">
   <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
         <ul class="navbar-nav flex-column">
            <span style="color: white; font-size: 20px;margin-bottom: 30px">
               &nbsp;MOVIE.COM
            </span>
            <h3 style="color: white;">
               <span style="width: 29px; height: 29px" data-feather="data.admin.user-check"></span>
               &nbsp;관리자
            </h3>
            <span style="color: white;">
                   <a class="nav-link active" aria-current="page" href="login/adminLogoutAction.jsp">
                  <span data-feather="log-out"></span>
                  로그아웃
               </a>
            </span>
            <a target='_blank' href="../../index.jsp" style="color: white; text-decoration-line: none; margin-bottom: 50px;margin-top: 50px;">
               사이트 바로가기 &nbsp;&nbsp;&nbsp;
               <span data-feather="plus"></span>
            </a>
            <div>
               <li class="nav-item">
                  <a class="nav-link" href="../admin/adminMainPage.jsp?curr=member/memberMain.jsp" onclick="changeActive()">
                     <span data-feather="users"></span>
                     회원 관리
                  </a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="../admin/adminMainPage.jsp?curr=reservation/reservationMain.jsp">
                     <span data-feather="shopping-cart"></span>
                     예매/결제 관리
                  </a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="#">
                     <span data-feather="message-square"></span>
                     극장 관리
                  </a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="#">
                     <span data-feather="message-square"></span>
                     영화 관리
                  </a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="../admin/adminMainPage.jsp?curr=faq/faqMain.jsp">
                     <span data-feather="message-square"></span>
                     FAQ
                  </a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="../admin/adminMainPage.jsp?curr=notice/noticeMain.jsp">
                     <span data-feather="bell"></span>
                     공지사항
                  </a>
               </li>
               <li class="nav-item" style="margin-bottom: 300px">
                  <a class="nav-link" href="../admin/adminMainPage.jsp?curr=inquiry/inquiryMain.jsp">
                     <span data-feather="smile"></span>
                     1:1 문의
                  </a>
               </li>
            </div>


         </ul>
      </div>
   </div>
</nav>

<%--아이콘 이미지--%>
<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
<script>
   feather.replace();
</script>
<%--아이콘 이미지--%>


</body>
</html>
