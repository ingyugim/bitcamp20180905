<%@page import="member.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="common/header.jsp"%>

<!--#:������ġ-->
<h2>ȸ����������</h2>
<hr>

<table>
	<tr>
		<td>���̵�(�̸���)</td>
		<td><%=userId%></td>
	</tr>
	<tr>
		<td>��й�ȣ</td>
		<td><%=userPw%></td>
	</tr>
	<tr>
		<td>�̸�</td>
		<td><%=userName%></td>
	</tr>
	<tr>
		<td>����</td>
		<td><a href="loginForm.jsp">�α��� �ϱ�</a></td>
	</tr>
</table>
<%
	MemberInfo memberinfo = new MemberInfo(userId,userPw,userName);
	session.setAttribute("MemberInfo", memberinfo);

%>
