<%@page import="java.util.List"%>
<%@page import="data.ticket.TicketDto"%>
<%@page import="data.ticket.TicketDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet">
<link
    href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
    rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
    <%
    TicketDao dao = new TicketDao();
    String region = request.getParameter("region");

    // 해당 지역의 지점명을 가져오는 메서드 호출
    List<String> addresses = dao.addressList(region);
    %>
    <div>
        <h2 id="addresses">
            <%-- 가져온 지점명들을 출력 --%>
            <% for (String address : addresses) { %>
                <%= address %>
            <% } %>
        </h2>
    </div>
</body>
</html>