<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<% 
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("password");
	String userName = request.getParameter("userName");
%>	

<%@ include file="common/header.jsp"%>

<!--#:������ġ-->
<h2>ȸ����������</h2>
<hr>

	<table>
		<tr>
			<td>���̵�(�̸���)</td>
			<td><%= userId %></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><%= userPw %></td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td><%= userName %></td>
		</tr>
		<tr>
			<td>����</td>
			<td><a href="loginForm.jsp">�α��� �ϱ�</a></td>
		</tr>
		
	</table>

