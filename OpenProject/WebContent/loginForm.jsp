<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>

<%@ include file="common/header.jsp"%>

<!--#:현재위치-->
<h2>loginForm</h2>
<hr>
<form action="login.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="userId"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password" ></td>
		</tr>
		<tr>
			<td colspan="2">
				<center>
					<input type="submit" value="Login">
				</center>
			</td>

		</tr>
	</table>
</form>
