<%@ page import="data.movie.chart.MovieInfoDto" %>
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
   <style>
   </style>

</head>
<%
   String movieId = request.getParameter("movieId");
   MovieInfoDao movieInfoDao = new MovieInfoDao();
   MovieInfoDto dto = movieInfoDao.getData(movieId);
%>
<body>
<h2 style="margin-bottom: 50px">영화 수정</h2>
<hr style="margin-bottom: 30px">

<form action="/admin/movie/movieUpdateAction.jsp">
<table class="table" style="width: 80%;">
   <input hidden="hidden" value="<%=dto.getMovieId()%>" name="movieId">
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
      <td><input type="text" class="form-control" name="movieTitle" value="<%=dto.getMovieTitle()%>"></td>
   </tr>
   <tr>
      <th style="text-align: center;">러닝 타임</th>
      <td><input type="number" class="form-control" name="runningTime" value="<%=dto.getRunningTime()%>"> 분</td>
   </tr>

   <tr>
      <th style="text-align: center;">관람 등급</th>
      <td>
         <select class="form-control" name="viewingRating">
            <option value="전체 이용가" <%=dto.getViewingRating().equals("전체 이용가") ? "selected" : "" %>>전체 이용가</option>
            <option value="12세 이용가" <%=dto.getViewingRating().equals("12세 이용가") ? "selected" : "" %>>12세 이용가</option>
            <option value="15세 이용가" <%=dto.getViewingRating().equals("15세 이용가") ? "selected" : "" %>>15세 이용가</option>
            <option value="19세 이상" <%=dto.getViewingRating().equals("19세 이상") ? "selected" : "" %>>19세 이상</option>
         </select>
      </td>
   </tr>
   <tr>
      <th style="text-align: center;">감독</th>
      <td><input type="text" class="form-control" name="director" value="<%=dto.getDirector()%>"></td>
   </tr>
   <tr>
      <th style="text-align: center;">출연진</th>
      <td><input type="text" class="form-control" name="cast" value="<%=dto.getCast()%>"></td>
   </tr>
   <tr>
      <th style="text-align: center;">예매율</th>
      <td><input type="text" class="form-control" name="bookingRate" value="<%=dto.getBookingRate()%>"></td>
   </tr>
   <tr>
      <th style="text-align: center;">개봉일</th>
      <td><input type="date" class="form-control" name="releaseDate" value="<%=dto.getReleaseDate()%>"></td>
   </tr>
   <tr>
      <th style="text-align: center;">장르</th>
      <td><input type="text" class="form-control" name="genre" value="<%=dto.getGenre()%>"></td>
   </tr>
   <tr>
      <th style="text-align: center;">영화 설명</th>
      <td><textarea class="form-control" name="movieDescription"><%=dto.getMovieDescription()%></textarea></td>
   </tr>
   <tr>
      <th style="text-align: center;">평점</th>
      <td><input type="text" class="form-control" name="rating" value="<%=dto.getRating()%>"></td>
   </tr>
   <tr>
      <th style="text-align: center;">종료일</th>
      <td><input type="date" class="form-control" name="endDate" value="<%=dto.getEndDate()%>"></td>
   </tr>
   <tr>
      <th style="text-align: center;">국가</th>
      <td><input type="text" class="form-control" name="country" value="<%=dto.getCountry()%>"></td>
   </tr>
</table>
   <button type="submit" style="margin-left: 60%;margin-right: 10px" class="btn btn-outline-primary">수정</button>
   <button class="btn btn-outline-success" onclick="history.back()">뒤로</button>
</form>


</body>
</html>