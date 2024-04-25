<%@ page import="data.reservation.ReservationDao" %>
<%@ page import="data.reservation.ReservationDto" %>
<%@ page import="data.user.member.MemberDto" %>
<%@ page import="data.user.member.MemberDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
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
   String reservationId = request.getParameter("reservationId");
   ReservationDao dao = new ReservationDao();
   ReservationDto dto = dao.getReservationInfoById(reservationId);
   MemberDao memberDao = new MemberDao();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
   SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy년 MM월 dd일");
   SimpleDateFormat sdf2 = new SimpleDateFormat("HH시 mm분");
%>
<body>
<h2 style="margin-bottom: 50px">예약/결제 정보</h2>
<hr style="margin-bottom: 30px">
<div>
   <br>
   <form>
      <table class="table" style="width: 80%;">
         <tr style="background-color: #99aaff">
            <th style="width: 30%; text-align: center; background-color: #99aaff;">구분</th>
            <th style="width: 70%; text-align: center; background-color: #99aaff;">정보</th>
         </tr>
         <tr>
            <th style="width: 30%; text-align: center;">아이디</th>
            <td style="width: 70%;">
               <%
                  String result;
                  if (dto.getMemberId() != null) {
                     MemberDto member = memberDao.getMemberById(Integer.parseInt(dto.getMemberId()));
                     result=member.getUserName();
                  }else result = "비회원";
               %>
               <%=result%>
            </td>
         </tr>
         <tr>
            <th style="width: 30%; text-align: center;">영화제목</th>
            <td style="width: 70%;">
               <%=dao.getMovieNameByScreeningInfoId(dto.getScreeningInfoId())%>
            </td>
         </tr>
         <tr>
            <th style="width: 30%; text-align: center;">지점</th>
            <td style="width: 70%;">
               <%=dao.getBranchByScreeningInfoId(dto.getScreeningInfoId()) %>
            </td>
         </tr>
         <tr>
            <th style="width: 30%; text-align: center;">상영날짜</th>
            <td style="width: 70%;">
               <%
                  List<Timestamp> screenTime = dao.getScreenTime(dto.getScreeningInfoId());
               %>
               <%=sdf1.format(screenTime.get(0))%>
            </td>
         </tr>
         <tr>
            <th style="width: 30%; text-align: center;">영화시간</th>
            <td style="width: 70%;">
               <%=sdf2.format(screenTime.get(1))%>
            </td>
         </tr>
         <tr>
            <th style="width: 30%; text-align: center;">좌석</th>
            <td style="width: 70%;">
               <%=dto.getReservedSeats()%>
            </td>
         </tr>
         <tr>
            <th style="width: 30%; text-align: center;">결제방법</th>
            <td style="width: 70%;">
               <%=dto.getPaymentMethod() %>
            </td>
         </tr>
         <tr>
            <th style="width: 30%; text-align: center;">결제상태</th>
            <td style="width: 70%;">
               <%
                  String str;
                  if(dto.getPaymentStatus().equals("Completed")) str="결제완료";
                  else if (dto.getPaymentStatus().equals("Pending")) str="결제중";
                  else if (dto.getPaymentStatus().equals("Cancelled")) str="취소";
                  else str="결제 오류";
               %>
               <%=str%>
            </td>
         </tr>
         <tr>
            <th style="width: 30%; text-align: center;">결제시간</th>
            <td style="width: 70%;">
               <%=sdf.format(dto.getPaymentTime())%>
            </td>
         </tr>

      </table><br>
      <div style="float: right; margin-right: 20%;">
         <%
            if(!str.equals("취소")){
               %>
         <a style="margin-right: 10px" type="button" class="btn btn-outline-danger" href="#"
            onclick="return confirm('정말로 취소하시겠습니까?') ? window.location.href = 'reservation/reservationCancle.jsp?reservationId=<%=dto.getReservationId()%>' : false;">결제취소</a>
         <%
            }
         %>
        <button type="button" class="btn btn-outline-success" onclick="history.back()">목록</button>
      </div>
   </form>
</div>
</body>
</html>
</body>
</html>