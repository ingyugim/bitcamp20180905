<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<% 
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("password");
	String userName = request.getParameter("userName");
%>	

<%@ include file="common/header.jsp"%>

<!--#:현재위치-->
<h2>회원가입정보</h2>
<hr>

	<table>
		<tr>
			<td>아이디(이메일)</td>
			<td><%= userId %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%= userPw %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%= userName %></td>
		</tr>
		<tr>
			<td>사진</td>
			<td><a href="loginForm.jsp">로그인 하기</a></td>
		</tr>
		
	</table>

