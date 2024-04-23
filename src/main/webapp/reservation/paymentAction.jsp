<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="data.reservation.ReservationDao" %>
<%@ page import="data.reservation.ReservationDto" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
   String payment;
   String paymentMethod = request.getParameter("payment_method");
   String easyPaymentOption = request.getParameter("easy_payment_option");
   if(paymentMethod.equals("simple")){
      payment=easyPaymentOption;
   }else{
      payment=paymentMethod;
   }

   String screeningInfoId = request.getParameter("screeningInfoId");
   String selectedSeats = request.getParameter("selectedSeats");
   String teenager = request.getParameter("teenager");
   String adult = request.getParameter("adult");
   String special = request.getParameter("special");

   String[] tokens = selectedSeats.replaceAll("\\s", "").split(",");
   ArrayList<Integer> list = new ArrayList<>();
   for (int i = 0; i < Integer.parseInt(teenager); i++) list.add(10_000);
   for (int i = 0; i < Integer.parseInt(adult); i++) list.add(13_000);
   for (int i = 0; i < Integer.parseInt(special); i++) list.add(7_000);

   HashMap<String,Integer> selectedSeatMap = new HashMap<>();
   for(int i=0;i<tokens.length;i++) selectedSeatMap.put(tokens[i],list.get(i));

   ReservationDao dao = new ReservationDao();
   ReservationDto dto = new ReservationDto();

   dto.setScreeningInfoId(screeningInfoId);
   dto.setPaymentMethod(payment);
   dto.setMemberId((String) session.getAttribute("memberId"));

   for(Map.Entry<String, Integer> entry : selectedSeatMap.entrySet()){
      dto.setReservedSeats(entry.getKey());
      dto.setAmount(entry.getValue().toString());
      dao.insertReservation(dto);
   }

   response.sendRedirect("../index.jsp");
%>