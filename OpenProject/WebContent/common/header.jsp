<%@page import="member.model.MemberInfo"%>
<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Header</title>
<link rel="stylesheet" href="css/default.css">
	<style type="text/css">
	#memberPhoto {
	background-image: url('images/images.jpg');
	background-size: 100%;
	width: 150px;
	height: 150px;
	border: 1px solid #222222;
	border-radius: 75px;
}
	</style>
</head>
<body>
	<h1 class="title">OpenProject</h1>
	<ul id="gnb">
		<li><a href="memberRegForm.jsp">����</a></li>
		<li><a href="memberRegForm.jsp">ȸ������</a></li>
		
		<% 
		String sessionId = (String)request.getSession(false).getAttribute("sessionId");
		String sessionName = (String)request.getSession(false).getAttribute("sessionName");
		
		Object memberinfo_obj = session.getAttribute("MemberInfo");
		MemberInfo memberinfo_mb = (MemberInfo)memberinfo_obj;
		
		
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("password");
		String userName = request.getParameter("userName");
		%>
		
		<%if(sessionId == null){%>		
		<li><a href="loginForm.jsp">�α���</a></li>
		<%}else{ %>
		<li><a href="logout.jsp">�α׾ƿ�</a></li>
		<%}	%>
		<li><a href="myPage.jsp">����������</a></li>
		<li><a href="memberList.jsp">ȸ�� ����Ʈ</a></li>

		<!--#:������ġ-->
	</ul>
</body>
</html>