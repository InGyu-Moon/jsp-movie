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
</head>
<%
   String movieId = request.getParameter("movieId");
   String movieTitle = request.getParameter("movieTitle");
   int runningTime = Integer.parseInt(request.getParameter("runningTime"));
   String viewingRating = request.getParameter("viewingRating");
   String director = request.getParameter("director");
   String cast = request.getParameter("cast");
   double bookingRate = Double.parseDouble(request.getParameter("bookingRate"));
   String releaseDate = request.getParameter("releaseDate");
   String genre = request.getParameter("genre");
   String movieDescription = request.getParameter("movieDescription");
   double rating = Double.parseDouble(request.getParameter("rating"));
   String endDate = request.getParameter("endDate");
   String country = request.getParameter("country");
//   String movieImg = request.getParameter("movieImg");

   MovieInfoDto dto = new MovieInfoDto();
   dto.setMovieId(movieId);
   dto.setMovieTitle(movieTitle);
   dto.setRunningTime(runningTime);
   dto.setViewingRating(viewingRating);
   dto.setDirector(director);
   dto.setCast(cast);
   dto.setBookingRate(bookingRate);
   dto.setReleaseDate(java.sql.Date.valueOf(releaseDate));
   dto.setGenre(genre);
   dto.setMovieDescription(movieDescription);
   dto.setRating(rating);
   dto.setEndDate(java.sql.Date.valueOf(endDate));
   dto.setCountry(country);
//   dto.setMovieImg(movieImg);

   MovieInfoDao movieInfoDao = new MovieInfoDao();
   movieInfoDao.updateMovie(dto);

   response.sendRedirect("../adminMainPage.jsp?curr=movie/movieMain.jsp");
%>
<body>
</body>
</html>