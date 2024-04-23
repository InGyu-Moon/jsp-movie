<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>좌석 선택</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <style>
      .seat {
         width: 40px;
         height: 40px;
         background-color: #ccc;
         margin: 5px;
         display: inline-flex;
         justify-content: center;
         align-items: center;
         border-radius: 5px;
         cursor: pointer;
      }
      .selected {
         background-color: #ff4500; /* 선택된 좌석 색상 */
      }
      .rowNumber {
         display: inline-block;
         width: 20px;
         text-align: right;
         margin-right: 5px;
      }
      #selectedSeats {
         margin-top: 20px;
      }
      #teenager,#adult,#special{
         width: 100px;
      }
      select{
         margin-left: 15px;
         margin-right: 50px;
      }
   </style>
</head>
<%

   /**
    * ArrayList<String> reservedSeats = new ArrayList<>();
    * String sql = select RESERVED_SEATS from RESERVATION_INFO where SCREENING_INFO_ID = ?;
    * pstmt.setString(1, screeningInfoId);
    * while(rs.next()){
    *     reservedSeats.add(rs.getString(RESERVED_SEATS));
    * }
    * retrun reservedSeats;
    *
    */

   String id = request.getParameter("screeningInfoId");
   //TODO: 예약 좌석 목록 기져오는 함수 만들기
   // 예약된 좌석 정보
   ArrayList<String> reservedSeats = new ArrayList<>();
   reservedSeats.add("A1");
   reservedSeats.add("B3");
   reservedSeats.add("C7");

   StringBuilder jsArray = new StringBuilder("[");
   for (String seat : reservedSeats) {
      jsArray.append("\"").append(seat).append("\",");
   }
   jsArray.deleteCharAt(jsArray.length() - 1); // 마지막 쉼표 삭제
   jsArray.append("]");

   System.out.println("jsArray = " + jsArray);
%>
<body>
<div style="text-align: center;">
   <h2>좌석 선택</h2>
   <form  action="paymentMethod.jsp" method="post" id="bookingForm">

      <input type="hidden" name="screeningInfoId" value="<%=1%>">
      <input type="hidden" name="selectedSeats" id="selectedSeatsInput">

      <div class="container">
         <div style="display: flex;align-items: center;justify-content: center;">
            <div style="display: flex;align-items: center;">청소년:
               <select name="teenager" id="teenager" class="form-select">
                  <option value="1">1명</option>
                  <option value="2">2명</option>
                  <option value="3">3명</option>
                  <option value="4">4명</option>
                  <option value="5">5명</option>
               </select>
            </div>
            <div style="display: flex;align-items: center;" class="">성인:
               <select name="adult" id="adult" class="form-select">
                  <option value="1">1명</option>
                  <option value="2">2명</option>
                  <option value="3">3명</option>
                  <option value="4">4명</option>
                  <option value="5">5명</option>
               </select>
            </div>
            <div style="display: flex;align-items: center;" class="">우대:
               <select name="special" id="special" class="form-select">
                  <option value="1">1명</option>
                  <option value="2">2명</option>
                  <option value="3">3명</option>
                  <option value="4">4명</option>
                  <option value="5">5명</option>
               </select>
            </div>
         </div>
      </div>

      <br><p>좌석을 선택하세요 (최대 <span id="maxSeats">1</span>석 가능):</p>

      <div id="seatMap">
         <!-- 좌석 그리드 생성 -->
      </div>

      <div style="justify-content: center;display: flex;align-items: center;">
         <button type="button" class="btn btn-outline-info" onclick="history.back()">뒤로</button>
         <div style="justify-content: center; display: flex;align-items: center;">
            <div>
               <p>쿵푸팬더</p>
               <p>2D</p>
               <p>전체 관람가</p>
            </div>
            <div>
               <p>극장: <%="강남"%></p>
               <p>일시: <%="2024-04-15"%></p>
               <p>상영관: <%="1관"%></p>
            </div>
            <div id="selectedSeats">선택된 좌석: </div>

         </div>
         <button type="submit" class="btn btn-outline-info">결제</button>
      </div>

   </form>
</div>

<script>
   $(document).ready(function() {
      const rows = 11; // 행 수
      const cols = 18; // 열 수
      let maxSeats = 1; // 최대 선택 가능 좌석 수
      let selectedSeats = []; // 선택된 좌석 정보를 저장할 배열

      const seatMap = $('#seatMap');
      const alphabet = 'ABCDEFGHIJK';

      for (let i = 1; i <= rows; i++) {
         const rowChar = alphabet[i - 1];
         const rowDiv = $('<div></div>').addClass('rowNumber').text(rowChar);
         seatMap.append(rowDiv);

         for (let j = 1; j <= cols; j++) {
            const seat = $('<div></div>')
                    .addClass('seat')
                    .data('row', rowChar)
                    .data('col', j)
                    .text(j);
            if(j===4 || j===14){
               seat.css('margin-right', '40px');
            }
            seat.click(function() {
               const row = $(this).data('row');
               const col = $(this).data('col');
               const seatName = row + col;
               const index = selectedSeats.indexOf(seatName);
               if (index === -1) {
                  if (maxSeats > 0) {
                     $(this).addClass('selected');
                     maxSeats--;
                     selectedSeats.push(seatName);
                  } else {
                     alert('더 이상 좌석을 선택할 수 없습니다.');
                  }
               } else {
                  $(this).removeClass('selected');
                  maxSeats++;
                  selectedSeats.splice(index, 1);
               }
               updateSelectedSeats();
               $('#maxSeats').text(maxSeats);
            });
            seatMap.append(seat);
         }
         seatMap.append('<br>');
      }

      //예야된 좌석 처리
      function reservedSeat() {
         const jsArray = <%=jsArray%>; // JSP에서 가져온 예약된 좌석 정보
         jsArray.forEach(function(seat) {
            const row = seat.charAt(0); // 좌석 문자열에서 알파벳 부분 추출
            const col = parseInt(seat.substring(1)); // 좌석 문자열에서 숫자 부분 추출

            // 예약된 좌석을 검정색으로 표시
            const reservedSeat = $('.seat').filter(function() {
               return $(this).data('row') === row && $(this).data('col') === col;
            });
            reservedSeat.css({
               'background-color': '#000', // 검정색으로 변경
               'pointer-events': 'none' // 클릭 이벤트 비활성화
            });
         });
      }
      reservedSeat();

      // 예약 가능한 좌석 설정
      function updateMaxSeats() {
         const teenagerCount = parseInt($('#teenager').val());
         const adultCount = parseInt($('#adult').val());
         const specialCount = parseInt($('#special').val());
         const sum = teenagerCount + adultCount + specialCount;
         maxSeats = sum; // 최대 선택 가능 좌석 수 업데이트
         $('#maxSeats').text(maxSeats); // #maxSeats에 표시
      }
      updateMaxSeats();


      function updateSelectedSeats() {
         // $('#selectedSeats').text('선택된 좌석: ' + selectedSeats.join(', '));

         const selectedSeatsText = selectedSeats.join(', ');
         $('#selectedSeats').text('선택된 좌석: ' + selectedSeatsText);
         $('#selectedSeatsInput').val(selectedSeatsText);


      }

      $('#teenager, #adult, #special').change(function() {
         updateMaxSeats();

         // 좌석 내용이 변경될 때 선택된 좌석 초기화
         $('.seat.selected').removeClass('selected');
         selectedSeats = [];
         updateSelectedSeats();
      });
   });
</script>
</body>
</html>
