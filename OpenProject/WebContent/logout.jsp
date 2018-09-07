<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>

<% session.invalidate(); %>
<%@ include file="common/header.jsp"%>
<!--#:ÇöÀçÀ§Ä¡-->
<h2>logout</h2>
<hr>
<h1>·Î±×¾Æ¿ôµÊ</h1>
<a href="loginForm.jsp"></a>