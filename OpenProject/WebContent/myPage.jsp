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
			alert('로그인 후 가능한 서비스 입니다.');
			location.href = 'loginForm.jsp';
		</script>
		<%	
	}else{
%>	


<!--#:현재위치-->

<center>
<h2>회원 정보</h2>
	<div id="memberPhoto"></div>
</center>
<hr>
<form>
	<table>
		<tr>
			<td>아이디(이메일)</td>
			<td><%= sessionId %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%= sessionName %></td>
		</tr>
		<tr>
			<td>사진</td>
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