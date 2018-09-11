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
	if( (loginForm_userId.equals( memberinfo_mb.getUserId() ) )&&( loginForm_userPw.equals(memberinfo_mb.getPassword())) ){
		session.setAttribute("sessionId", userId);
		session.setAttribute("sessionName", userName);
		response.sendRedirect("myPage.jsp");	
			
	}else{
%>

<h1>아이디 또는 비밀번호가 틀립니다.</h1>
<table>
	<tr>
		<td>입력한 아이디:</td>
		<td><%=loginForm_userId %></td>
		<td>가입된 아이디:</td>
		<td><%=memberinfo_mb.getUserId() %></td>
	</tr>
	<tr>
		<td>입력한 비번 :</td>
		<td><%=loginForm_userPw %></td>
		<td>가입된 비번 : </td>
		<td><%=memberinfo_mb.getPassword() %></td>
	</tr>
	<tr>
		<td>가입된 이름 :</td>
		<td><%=memberinfo_mb.getUserName() %></td>
	</tr>
</table>

<h1><a href="loginForm.jsp">다시 로그인하기</a></h1>
<%}%>

