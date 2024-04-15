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
<body>
<h2 style="margin-bottom: 50px">영화 추가</h2>
<hr style="margin-bottom: 30px">

<form action="/admin/movie/movieAddAction.jsp">
   <table class="table" style="width: 80%;">
      <tr style="background-color: #99aaff">
         <th style="width: 20%; text-align: center; background-color: #99aaff;">항목</th>
         <th style="width: 80%; text-align: center; background-color: #99aaff;">입력</th>
      </tr>
      <tr>
         <th style="text-align: center;">영화 제목</th>
         <td><input type="text" class="form-control" name="movieTitle"></td>
      </tr>
      <tr>
         <th style="text-align: center;">러닝 타임</th>
         <td><input type="number" class="form-control" name="runningTime"> 분</td>
      </tr>
      <tr>
         <th style="text-align: center;">관람 등급</th>
         <td>
            <select class="form-control" name="viewingRating">
               <option value="전체 이용가">전체 이용가</option>
               <option value="12세 이용가">12세 이용가</option>
               <option value="15세 이용가">15세 이용가</option>
               <option value="19세 이상">19세 이상</option>
            </select>
         </td>
      </tr>
      <tr>
         <th style="text-align: center;">감독</th>
         <td><input type="text" class="form-control" name="director"></td>
      </tr>
      <tr>
         <th style="text-align: center;">출연진</th>
         <td><input type="text" class="form-control" name="cast"></td>
      </tr>
      <tr>
         <th style="text-align: center;">예매율</th>
         <td><input type="text" class="form-control" name="bookingRate"></td>
      </tr>
      <tr>
         <th style="text-align: center;">개봉일</th>
         <td><input type="date" class="form-control" name="releaseDate"></td>
      </tr>
      <tr>
         <th style="text-align: center;">장르</th>
         <td><input type="text" class="form-control" name="genre"></td>
      </tr>
      <tr>
         <th style="text-align: center;">영화 설명</th>
         <td><textarea class="form-control" name="movieDescription"></textarea></td>
      </tr>
      <tr>
         <th style="text-align: center;">평점</th>
         <td><input type="text" class="form-control" name="rating"></td>
      </tr>
      <tr>
         <th style="text-align: center;">종료일</th>
         <td><input type="date" class="form-control" name="endDate"></td>
      </tr>
      <tr>
         <th style="text-align: center;">국가</th>
         <td><input type="text" class="form-control" name="country"></td>
      </tr>
   </table>
   <button type="submit" style="margin-left: 60%;margin-right: 10px" class="btn btn-outline-primary">추가</button>
   <button class="btn btn-outline-success" onclick="history.back()">뒤로</button>
</form>


</body>
</body>
</html>