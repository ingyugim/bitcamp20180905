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
	alert('로그인 후 가능한 서비스 입니다.');
	location.href = 'loginForm.jsp';
</script>
<%
	} else {
%>


<!--#:현재위치-->

<center>
	<h2>회원 정보</h2>
	<div id="memberPhoto"></div>
</center>
<hr>
<%-- <form>
	<table>
		<tr>
			<td>아이디(이메일)</td>
			<td><%=memberinfo_mb.getUserId()%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=memberinfo_mb.getUserName()%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
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
			<td>입력 ID</td>
			<td><%=loginForm_userId%></td>
			<td>세션 ID</td>
			<td><%=sessionId%></td>
		</tr>
		<tr>
			<td>입력 Password</td>
			<td><%=loginForm_userPw %></td>
			<td>세션 Password</td>
			<td><%=sessionName%></td>
		</tr>
	</table>
</div>
<%
	}
%>