<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%@ include file="common/header.jsp"%>
<% 
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("password");
	String userName = request.getParameter("userName");
%>	
<!--#:������ġ-->
<h2>login</h2>
<hr>
<%
	if((userId != null)&&( userPw != null )&&( userId.equals(userPw) )){
		
		request.getSession(false).setAttribute("sessionId", userId);
		request.getSession(false).setAttribute("sessionName", userName);
		response.sendRedirect("myPage.jsp");
	}else{
%>

<h1>���̵� �Ǵ� ��й�ȣ�� Ʋ���ϴ�.</h1>
<h1><a href="loginForm.jsp">�ٽ� �α����ϱ�</a></h1>
<%
	}
%>