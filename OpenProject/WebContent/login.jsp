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
<!--#:현재위치-->
<h2>login</h2>
<hr>
<%
	if((userId != null)&&( userPw != null )&&( userId.equals(userPw) )){
		
		request.getSession(false).setAttribute("sessionId", userId);
		request.getSession(false).setAttribute("sessionName", userName);
		response.sendRedirect("myPage.jsp");
	}else{
%>

<h1>아이디 또는 비밀번호가 틀립니다.</h1>
<h1><a href="loginForm.jsp">다시 로그인하기</a></h1>
<%
	}
%>