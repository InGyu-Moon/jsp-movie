<%@page import="org.json.simple.JSONObject"%>
<%@page import="user.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String username = request.getParameter("username");
  MemberDao dao = new MemberDao();
  int count = dao.isIdCheck(username);
  System.out.println(count);
  
  JSONObject ob=new JSONObject();
  ob.put("count", count);
%>
<%=ob.toString()%>