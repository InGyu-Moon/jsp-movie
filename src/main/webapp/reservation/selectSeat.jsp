<%@ page import="java.util.ArrayList" %>
<%@ page import="data.reservation.ReservationDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<title>예매 | 영화 그 이상의 감동</title>
<style>
.top_btn .link {
display: none;
}
</style>
<%
   final int TEENAGER_PRICE = 10_000;
   final int ADULT_PRICE = 13_000;
   final int SPECIAL_PRICE = 7_000;

%>
<%
   request.setCharacterEncoding("utf-8");
   String screeningInfoId = request.getParameter("screeningInfoId");
   String branch = request.getParameter("branch");
   String screeningDate = request.getParameter("screeningDate");
   String screeningData = request.getParameter("screeningData");


   System.out.println("screeningInfoId = " + screeningInfoId);

   ReservationDao dao = new ReservationDao();
   ArrayList<String> reservedSeats = dao.getReservedSeat(screeningInfoId);

   StringBuilder jsArray = new StringBuilder("[");
   if(reservedSeats.isEmpty()){
      jsArray.append("]");
   }else{
      for (String seat : reservedSeats) {
         jsArray.append("\"").append(seat).append("\",");
      }
      jsArray.deleteCharAt(jsArray.length() - 1); // 마지막 쉼표 삭제
      jsArray.append("]");
   }
%>
<body>
<div id="wrap">
<div style="text-align: center;" id="select_seat">
<div class="center">
<div class="head_title">
<span>좌석 선택</span>
</div>
   <form  action="paymentMethod.jsp" method="post" id="bookingForm">

      <input type="hidden" name="screeningInfoId" value="<%=1%>">
      <input type="hidden" name="selectedSeats" id="selectedSeatsInput">
      <input type="hidden" name="totalPrice" id="totalPriceInput">

      <div class="container">
         <div style="display: flex;align-items: center;justify-content: center;">
            <div style="display: flex;align-items: center;">청소년:
               <select name="teenager" id="teenager" class="form-select">
                  <option value="0">없음</option>
                  <option value="1">1명</option>
                  <option value="2">2명</option>
                  <option value="3">3명</option>
                  <option value="4">4명</option>
                  <option value="5">5명</option>
               </select>
            </div>
            <div style="display: flex;align-items: center;" class="">성인:
               <select name="adult" id="adult" class="form-select">
                  <option value="0">없음</option>
                  <option value="1">1명</option>
                  <option value="2">2명</option>
                  <option value="3">3명</option>
                  <option value="4">4명</option>
                  <option value="5">5명</option>
               </select>
            </div>
            <div style="display: flex;align-items: center;" class="">우대:
               <select name="special" id="special" class="form-select">
                  <option value="0">없음</option>
                  <option value="1">1명</option>
                  <option value="2">2명</option>
                  <option value="3">3명</option>
                  <option value="4">4명</option>
                  <option value="5">5명</option>
               </select>
            </div>
         </div>
      </div>

      <p class="select_text">좌석을 선택하세요 (최대 <span id="maxSeats">1</span>석 가능):</p>

      <div id="seatMap">
      <div class="screen_text">
      <span>SCREEN</span>
</div>
         <!-- 좌석 그리드 생성 -->
      </div>

      <div class="information">
         <button type="button" class="prev" onclick="history.back()">영화선택</button>
         <div style="justify-content: center; display: flex;">
            <div class="block">
            <div>
               <p>쿵푸팬더</p>
               <p>2D</p>
             </div>
               <p>전체 관람가</p>
            </div>
            <div class="block">
               <p>극장: <%=branch%></p>
               <p>일시: <%=screeningDate%></p>
               <p>상영관: <%=screeningData%></p>
            </div>
            <div class="block">
               <div id="selectedSeats"></div>
                <div id="totalPrice">총금액: 0원</div>
            </div>


         </div>
         <button id="bookingFormBtn" type="submit" class="next">결제선택</button>
      </div>

   </form>
</div>

   
</div>
</div>

<jsp:include page="../include/footer.html"></jsp:include>
<script>
   $(document).ready(function() {
      let totalPrice=0;
      const rows = 11; // 행 수
      const cols = 18; // 열 수
      let maxSeats = 0; // 최대 선택 가능 좌석 수
      let selectedSeats = []; // 선택된 좌석 정보를 저장할 배열

      const seatMap = $('#seatMap');
      const alphabet = 'ABCDEFGHIJK';

      function validateSelectedSeats() {
         if (maxSeats !== 0) {
            alert('선택된 좌석 수가 최대 선택 가능 좌석 수와 일치하지 않습니다.');
            return false;
         }
         return true;
      }
      $('#bookingFormBtn').click(function() {
         return validateSelectedSeats();
      });

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
               'pointer-events': 'none', // 클릭 이벤트 비활성화
               'color': '#fff' // 폰트 색상 흰색으로 변경
            });
         });
      }
      reservedSeat();

      // 예약 가능한 좌석 설정
      function updateMaxSeats() {
         const teenagerCount = parseInt($('#teenager').val());
         const adultCount = parseInt($('#adult').val());
         const specialCount = parseInt($('#special').val());
         maxSeats = teenagerCount + adultCount + specialCount; // 최대 선택 가능 좌석 수 업데이트
         $('#maxSeats').text(maxSeats); // #maxSeats에 표시
         totalPrice = teenagerCount*10_000 + adultCount*13_000 + specialCount*7_000;
         $("#totalPriceInput").val(totalPrice);
         $("#totalPrice").text("총금액: " + totalPrice);
      }
      updateMaxSeats();

      function updateSelectedSeats() {
         const selectedSeatsText = selectedSeats.join(', ');
         $('#selectedSeats').text('선택된 좌석: ' + selectedSeatsText);
         $('#selectedSeatsInput').val(selectedSeatsText);
      }
      // 인원 변경하면 총원 업데이트, 선택된 좌석 초기화
      $('#teenager, #adult, #special').change(function() {
         updateMaxSeats();
         $('.seat.selected').removeClass('selected'); // 좌석 내용이 변경될 때 선택된 좌석 초기화
         selectedSeats = []; updateSelectedSeats(); //선택된 좌석 출력도 초기화
      });
   });
</script>
</body>
</html>
