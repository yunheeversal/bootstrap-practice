<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="util.Cookies"%>
<%
/* 쿠키로 로그아웃 */
/* response.addCookie(Cookies.createCookie("AUTH", "", "/", 0));*/
/* 세션으로 로그아웃  */
session.invalidate();
response.sendRedirect("loginForm.jsp"); 
%>

