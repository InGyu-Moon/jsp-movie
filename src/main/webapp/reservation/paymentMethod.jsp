<%@ page import="data.reservation.ReservationDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="data.reservation.ReservationDto" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:include page="../include/header.html"></jsp:include>
<title>결제 | 영화 그 이상의 감동</title>
<%
    String screeningInfoId = request.getParameter("screeningInfoId");
    String selectedSeats = request.getParameter("selectedSeats");
    String teenager = request.getParameter("teenager");
    String adult = request.getParameter("adult");
    String special = request.getParameter("special");
    String totalPrice = request.getParameter("totalPrice");

%>
<body>

<div id="wrap">
<div id="payment_method">
<div class="center">
<div class="head_title">
<span>최종 결제 수단</span>
</div>
<form action="paymentAction.jsp" method="post">

    <input hidden value="<%=selectedSeats%>" name="selectedSeats">
    <input hidden value="<%=screeningInfoId%>" name="screeningInfoId">

    <input hidden value="<%=teenager%>" name="teenager">
    <input hidden value="<%=adult%>" name="adult">
    <input hidden value="<%=special%>" name="special">

<div class="select">
    <input type="radio" id="phone_payment" name="payment_method" value="Phone">
    <label for="phone_payment">휴대폰</label>

    <input type="radio" id="credit_card_payment" name="payment_method" value="Credit_Card">
    <label for="credit_card_payment">신용카드</label>

    <input type="radio" id="toss_payment" name="payment_method" value="TOSS">
    <label for="toss_payment">토스</label>

    <input type="radio" id="simple_payment" name="payment_method" value="simple" onchange="showEasyPaymentOptions()">
    <label for="simple_payment">간편결제</label>
    </div>


    <div id="easy_payment_options" style="display: none;">
        <input type="radio" id="kakao_payment" name="easy_payment_option" checked value="KAKAO">
        <label for="kakao_payment">카카오페이</label>

        <input type="radio" id="naver_payment" name="easy_payment_option" value="NAVER">
        <label for="naver_payment">네이버페이</label>

        <input type="radio" id="ssg_payment" name="easy_payment_option" value="SSG">
        <label for="ssg_payment">SSG페이</label>
    </div>
 <div class="information">
     <div id="payment">결제방식: </div>
    <div id="total_price">결제 금액: <%=totalPrice%></div>
 </div>

    <button type="submit" class="btn">결제</button>
</form>
</div>

</div>

</div>

<jsp:include page="../include/footer.html"></jsp:include>
<script>
    $(document).ready(function() {
        $('input[name="payment_method"]').change(function() {
            if ($(this).val() === "simple") {
                $('#easy_payment_options').show();
            } else {
                $('#easy_payment_options').hide();
            }
        });

        $('input').click(function() {
            var selectedPaymentMethod = $('input[name="payment_method"]:checked').val();
            var selectedEasyPaymentOption = $('input[name="easy_payment_option"]:checked').val();
            if(selectedPaymentMethod==='simple'){
                $('#payment').text("결제방식: "+selectedEasyPaymentOption)
            }
            else{
                $('#payment').text("결제방식: "+selectedPaymentMethod)
            }

        });
    });
</script>
</body>
</html>
