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
	if((userId.equals(memberinfo_mb.getUserId()) )&&(userPw.equals(memberinfo_mb.getPassword())) ){
		session.setAttribute("sessionId", userId);
		session.setAttribute("sessionName", userName);
		response.sendRedirect("myPage.jsp");	
			
	}else{
%>

<h1>���̵� �Ǵ� ��й�ȣ�� Ʋ���ϴ�.</h1>
�Է��� ���̵�: <%=userId %>
���Ե� ���̵�: <%=memberinfo_mb.getUserId() %>

�Է��� ��� : <%=userPw %>
���Ե� ��� : <%=memberinfo_mb.getPassword() %>

���Ե� �̸� : <%=memberinfo_mb.getUserName() %>
<h1><a href="loginForm.jsp">�ٽ� �α����ϱ�</a></h1>
<%}%>

