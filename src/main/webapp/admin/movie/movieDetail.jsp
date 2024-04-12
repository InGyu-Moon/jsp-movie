<%@ page import="data.movie.chart.MovieInfoDao" %>
<%@ page import="data.movie.chart.MovieInfoDto" %>
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
   String movieId = request.getParameter("movieId");
   MovieInfoDao movieInfoDao = new MovieInfoDao();
   MovieInfoDto dto = movieInfoDao.getData(movieId);
%>
<body>
<h2 style="margin-bottom: 50px">영화 상세 정보</h2>
<hr style="margin-bottom: 30px">
<table class="table" style="width: 80%;">
   <tr style="background-color: #99aaff">
      <th style="width: 20%; text-align: center; background-color: #99aaff;">포스터</th>
      <th style="width: 20%; text-align: center; background-color: #99aaff;">구분</th>
      <th style="width: 60%; text-align: center; background-color: #99aaff;">정보</th>
   </tr>

   <tr>
      <td style="text-align: center;vertical-align: middle" rowspan="13">
         <img style="width: 300px;" src="<%=dto.getMovieImg()%>">
      </td>
   </tr>

   <tr>
      <th style="text-align: center;">영화 제목</th>
      <td>
         <%=dto.getMovieTitle() %>
      </td>
   </tr>
   <tr>
      <th style="text-align: center;">러닝 타임</th>
      <td>
         <%=dto.getRunningTime() %> 분
      </td>
   </tr>
   <tr>
      <th style="text-align: center;">관람 등급</th>
      <td>
         <%=dto.getViewingRating() %>
      </td>
   </tr>
   <tr>
      <th style="text-align: center;">감독</th>
      <td >
         <%=dto.getDirector() %>
      </td>
   </tr>
   <tr>
      <th style="text-align: center;">출연진</th>
      <td >
         <%=dto.getCast() %>
      </td>
   </tr>
   <tr>
      <th style="text-align: center;">예매율</th>
      <td >
         <%=dto.getBookingRate() %>
      </td>
   </tr>
   <tr>
      <th style="text-align: center;">개봉일</th>
      <td >
         <%=dto.getReleaseDate() %>
      </td>
   </tr>
   <tr>
      <th style=" text-align: center;">장르</th>
      <td >
         <%=dto.getGenre() %>
      </td>
   </tr>
   <tr>
      <th style="text-align: center;">영화 설명</th>
      <td >
         <%=dto.getMovieDescription() %>
      </td>
   </tr>
   <tr>
      <th style="text-align: center;">평점</th>
      <td >
         <%=dto.getRating() %>
      </td>
   </tr>
   <tr>
      <th style="text-align: center;">종료일</th>
      <td>
         <%=dto.getEndDate() %>
      </td>
   </tr>
   <tr>
      <th style="text-align: center;">국가</th>
      <td >
         <%=dto.getCountry() %>
      </td>
   </tr>
</table>
<div style="display: flex;">
   <a style="margin-left: 60%;margin-right: 10px" type="button" class="btn btn-outline-primary" href="/admin/adminMainPage.jsp?curr=#/#.jsp?movieId=<%=dto.getMovieId()%>">수정</a>
   <a style="margin-right: 10px" type="button" class="btn btn-outline-danger" href="#"
      onclick="return confirm('정말로 삭제하시겠습니까?') ? window.location.href = '#/#.jsp?movieId=<%=dto.getMovieId()%>' : false;">삭제</a>
   <button class="btn btn-outline-success" onclick="history.back()">목록</button>
</div>
</body>
</html>