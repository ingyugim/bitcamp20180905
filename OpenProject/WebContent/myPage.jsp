<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ include file="common/header.jsp"%>

<%
	/* String userId0 = (String)request.getSession(false).getAttribute("userId"); */

	if (session.getAttribute("sessionId") == null) {
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
<%-- <form>
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
</form> --%>
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
			<td><%=sessionId%></td>
		</tr>
		<tr>
			<td>�Է� Password</td>
			<td><%=loginForm_userPw %></td>
			<td>���� Password</td>
			<td><%=sessionName%></td>
		</tr>
	</table>
</div>
<%
	}
%>