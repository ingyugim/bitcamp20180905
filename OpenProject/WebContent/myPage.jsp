<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%@ include file="common/header.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
	/* String userId0 = (String)request.getSession(false).getAttribute("userId"); */

	if (memberinfo_mb == null) {
%>
<script>
	alert('�α��� �� ������ ���� �Դϴ�.');
	location.href = 'loginForm.jsp';
</script>
<%
	} else {
%>


<!--#:������ġ-->

<center>
	<h2>ȸ�� ����</h2>
	<div id="memberPhoto"></div>
</center>
<hr>
<form>
	<table>
		<tr>
			<td>���̵�(�̸���)</td>
			<td><%=memberinfo_mb.getUserId()%></td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td><%=memberinfo_mb.getUserName()%></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><%=memberinfo_mb.getPassword()%></td>
		</tr>
	</table>
</form>
<hr>
<!-- 
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("password");
		String userName = request.getParameter("userName");

 -->
<div board="1px">
	<table>
		<tr>
			<td>�Է� ID</td>
			<td><%=loginForm_userId%></td>
			<td>���� ID</td>
			<td><%=memberinfo_mb.getUserId()%></td>
		</tr>
		<tr>
			<td>�Է� Password</td>
			<td><%=loginForm_userPw %></td>
			<td>���� Password</td>
			<td><%=memberinfo_mb.getPassword() %></td>
		</tr>
	</table>
</div>
<%
	}
%>