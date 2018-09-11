<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="common/header.jsp"%>

<!--#:현재위치-->
<h2>memberRegForm</h2>
<hr>
<form action="memberReg.jsp" method="post">
	<table>
		<tr>
			<td>아이디(이메일)</td>
			<td><input type="test" name="memberRegForm_userId" id="memberRegForm_id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="memberRegForm_password" id="memberRegForm_pw"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="memberRegForm_userName" id="memberRegForm_name"></td>
		</tr>
		<tr>
			<td>사진</td>
			<td><input name="photoFile" type="file"></td>
		</tr>
		<tr>
			<td colspan="2"><center>
					<input type="submit">
				</center></td>
			<!--                <td><input type=""></td>-->
		</tr>
	</table>
</form>
