<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>

<%@ include file="common/header.jsp"%>

<%
	/*Take the Cookie when checkbox will checked.*/
	
%>
<!--#:������ġ-->
<h2>loginForm</h2>
<hr>
<form action="login.jsp" method="post">
	<table border="1">
		<tr>
			<td>���̵�</td>
			<td><input type="text" name="loginForm_userId"></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><input type="password" name="loginForm_password" ></td>
		</tr>
		<tr>
			<td colspan="2">
				<center>
					<input type="submit" value="Login">
					���̵���<input type="checkbox" name="loginForm_checkbox" >
				</center>
			</td>
		</tr>
	</table>
</form>
