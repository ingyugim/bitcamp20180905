<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ include file="common/header.jsp"%>

<% 
	request.setCharacterEncoding("utf-8");
	//String userId0 = (String)request.getSession(false).getAttribute("userId");
	if(sessionId == null){
		%>
		<script>
			alert('�α��� �� ������ ���� �Դϴ�.');
			location.href = 'loginForm.jsp';
		</script>
		<%	
	}else{
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
			<td><%= sessionId %></td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td><%= sessionName %></td>
		</tr>
		<tr>
			<td>����</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2">
				<center>
					<input type="submit">
				</center>
			</td>
			<!--                <td><input type=""></td>-->
		</tr>
	</table>
</form>
<%}%>