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

    <%-- IBM Plex Sans KR--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

    <title>관리자 페이지</title>
</head>
<body style=" font-family: 'IBM Plex Sans KR';">
<%
//    Boolean adminLogin = (Boolean)session.getAttribute("adminLogin");
//    if(adminLogin==null || !adminLogin){
//        response.sendRedirect("login/adminLoginPage.jsp");
//    }

    String currentPage = "member/memberMain.jsp";
    if (request.getParameter("curr") != null) {
        currentPage = request.getParameter("curr");
    }
%>

<div style="display: flex;">
    <div style="width: 200px;">
        <jsp:include page="layout/navbar.jsp"/>
    </div>
    <div style="flex: 1; margin-left: 60px; margin-top: 50px">
        <jsp:include page="<%=currentPage%>"/>
    </div>
</div>



</body>
</html>