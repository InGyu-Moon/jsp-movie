<%@ page import="data.admin.AdminDao" %>
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
    String adminId = request.getParameter("adminId");
    String adminPw = request.getParameter("adminPw");

    AdminDao dao = new AdminDao();
    boolean adminLoginResult = dao.checkAdminLogin(adminId, adminPw);
    if (adminLoginResult) {
        System.out.println("로그인 성공");
    } else {
        System.out.println("로그인 실패");
    }
    response.sendRedirect("adminLoginPage.jsp");
%>


</body>
</html>