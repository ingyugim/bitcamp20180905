<%@page import="member.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html>

<%@ include file="common/header.jsp"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!--#:������ġ-->
<h2>login</h2>
<hr>
<%
	if( (loginForm_userId.equals( memberinfo_mb.getUserId() ) )&&( loginForm_userPw.equals(memberinfo_mb.getPassword())) ){
		session.setAttribute("sessionId", userId);
		session.setAttribute("sessionName", userName);
		response.sendRedirect("myPage.jsp");	
			
	}else{
%>

<h1>���̵� �Ǵ� ��й�ȣ�� Ʋ���ϴ�.</h1>
<table>
	<tr>
		<td>�Է��� ���̵�:</td>
		<td><%=loginForm_userId %></td>
		<td>���Ե� ���̵�:</td>
		<td><%=memberinfo_mb.getUserId() %></td>
	</tr>
	<tr>
		<td>�Է��� ��� :</td>
		<td><%=loginForm_userPw %></td>
		<td>���Ե� ��� : </td>
		<td><%=memberinfo_mb.getPassword() %></td>
	</tr>
	<tr>
		<td>���Ե� �̸� :</td>
		<td><%=memberinfo_mb.getUserName() %></td>
	</tr>
</table>

<h1><a href="loginForm.jsp">�ٽ� �α����ϱ�</a></h1>
<%}%>

