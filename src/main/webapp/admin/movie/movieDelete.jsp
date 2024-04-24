<%@ page import="data.movie.chart.MovieInfoDao" %>
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
   request.setCharacterEncoding("utf-8");

   String movieId = request.getParameter("movieId");

   // ,로 분리해서 배열선언
   String[] selectMemberIdStrings = movieId.split(",");
   // 배열의 갯수만큼 delete
   MovieInfoDao dao = new MovieInfoDao();
   for (String id : selectMemberIdStrings) {
      dao.deleteMovie(id);
   }

   System.out.println("삭제완료");
   response.sendRedirect("../adminMainPage.jsp?curr=movie/movieMain.jsp");
%>
<body>
</body>
</html>