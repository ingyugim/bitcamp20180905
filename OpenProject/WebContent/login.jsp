<%@page import="member.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html>

<%@ include file="common/header.jsp"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!--#:현재위치-->
<h2>login</h2>
<hr>
<%
	if((userId.equals(memberinfo_mb.getUserId()) )&&(userPw.equals(memberinfo_mb.getPassword())) ){
		session.setAttribute("sessionId", userId);
		session.setAttribute("sessionName", userName);
		response.sendRedirect("myPage.jsp");	
			
	}else{
%>

<h1>아이디 또는 비밀번호가 틀립니다.</h1>
입력한 아이디: <%=userId %>
가입된 아이디: <%=memberinfo_mb.getUserId() %>

입력한 비번 : <%=userPw %>
가입된 비번 : <%=memberinfo_mb.getPassword() %>

가입된 이름 : <%=memberinfo_mb.getUserName() %>
<h1><a href="loginForm.jsp">다시 로그인하기</a></h1>
<%}%>

