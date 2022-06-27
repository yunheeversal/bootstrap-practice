<%@ page contentType="text/html; charset=utf-8" %>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	if (email.equals(password)) {
		session.setAttribute("MEMBER", email);
		/* 	RequestDispatcher dispatcher =
			   request.getRequestDispatcher("/member/main/index.do");
	dispatcher.forward(request, response); */
		response.sendRedirect(request.getContextPath()+"/member/main/index.do");
		
	} else { // 로그인 실패시
%>
<script>
	alert("로그인에 실패하였습니다.");
	history.go(-1);
</script>
<%
	}
%> 


<%--  <%@ page import="util.Cookies"%> --%>
<%-- <%
	String email = request.getParameter("email");
	session.setAttribute("MEMBER", email);
	RequestDispatcher dispatcher =
			   request.getRequestDispatcher("/member/main/index.do");
	dispatcher.forward(request, response);
	
	/* response.sendRedirect("/member/main/index.do"); */
%>
<html>
<head><title>로그인</title></head>
<body>

로그인 처리

</body>
</html>
 --%>