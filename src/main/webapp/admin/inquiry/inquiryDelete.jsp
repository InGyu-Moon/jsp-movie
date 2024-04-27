<%@page import="data.inform.inquiry.InquiryDao"%>
<%@page import="data.inform.faq.FaqDao"%>
<%@page import="data.inform.faq.FaqDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");

    String inquiryIds = request.getParameter("selectinquiryId");

    // ,로 분리해서 배열선언
    String[] inquiryIdStrings = inquiryIds.split(",");
    // 배열의 갯수만큼 delete
    InquiryDao dao = new InquiryDao();
    for (String idString : inquiryIdStrings) {
        // 문자열을 int 형으로 변환
        int inquiryId = Integer.parseInt(idString);
        dao.deleteAnswer(inquiryId);
    }

    response.sendRedirect("../adminMainPage.jsp?curr=inquiry/inquiryMain.jsp");
%>