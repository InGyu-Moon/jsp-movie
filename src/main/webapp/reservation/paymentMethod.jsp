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
</body>
</html>
<%
   String screeningInfoId = request.getParameter("screeningInfoId");
   String selectedSeats = request.getParameter("selectedSeats");
   String teenager = request.getParameter("teenager");
   String adult = request.getParameter("adult");
   String special = request.getParameter("special");

   System.out.println("screeningInfoId = " + screeningInfoId);
   System.out.println("selectedSeats = " + selectedSeats);
   System.out.println("teenager = " + teenager);
   System.out.println("adult = " + adult);
   System.out.println("special = " + special);

   //TODO
   /**
    * session에서 회원 아이디 꺼내기
    * 결제 방법 선택 창 html 만들기
    */




%>