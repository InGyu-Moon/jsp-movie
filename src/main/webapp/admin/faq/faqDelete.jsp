<%@page import="data.inform.faq.FaqDao"%>
<%@page import="data.inform.faq.FaqDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");

    String faqIds = request.getParameter("faqId");

    // ,로 분리해서 배열선언
    String[] faqIdStrings = faqIds.split(",");
    // 배열의 갯수만큼 delete
    FaqDao dao = new FaqDao();
    for (String idString : faqIdStrings) {
        // 문자열을 int 형으로 변환
        int faqId = Integer.parseInt(idString);
        dao.deleteFaq(faqId);
    }

    response.sendRedirect("../adminMainPage.jsp?curr=faq/faqMain.jsp");
%>