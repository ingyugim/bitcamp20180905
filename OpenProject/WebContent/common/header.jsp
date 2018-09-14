<%@page import="java.util.ArrayList"%>
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
		<li><a href="#">메인</a></li>
		<li><a href="memberRegForm.jsp">회원가입</a></li>
		
		<% 
		String sessionId = (String)request.getSession(false).getAttribute("sessionId");
		String sessionName = (String)request.getSession(false).getAttribute("sessionName");
		
		
		/*세션 속성으로 memberinfo 객체 불러와서 memberinfo 인스턴스 생성*/
		Object memberinfo_obj = session.getAttribute("MemberInfo");
		MemberInfo memberinfo_mb = (MemberInfo)memberinfo_obj;

		/*Application 속성으로 memberinfo   객체 불러와서 memberinfo 인스턴스 생성*/
		Object memberinfo_obj2 = application.getAttribute("MemberInfo");
		MemberInfo memberinfo_ap = (MemberInfo)memberinfo_obj2;
		
		/*Application을 통해 객체를 전달받은 ArrayList타입의 memberinfo_list를 선언*/
		Object memberinfo_obj_ap = application.getAttribute("memberList");
		ArrayList<MemberInfo> memberinfo_list = (ArrayList<MemberInfo>)memberinfo_obj_ap;			

		
		/*The Data from memberRegForm*/
		String userId = request.getParameter("memberRegForm_userId");
		String userPw = request.getParameter("memberRegForm_password");
		String userName = request.getParameter("memberRegForm_userName");
		
		/*The Data from loginForm*/
		String loginForm_userId = request.getParameter("loginForm_userId");
		String loginForm_userPw = request.getParameter("loginForm_password");
		String loginForm_checkbox = request.getParameter("login_checkbox");
		String checkedMark = "";
		
		%>
		
		<%if(sessionId == null){%>		
		<li><a href="loginForm.jsp">로그인</a></li>
		<%}else{ %>
		<li><a href="logout.jsp">로그아웃</a></li>
		<%}	%>
		<li><a href="myPage.jsp">마이페이지</a></li>
		<li><a href="memberList.jsp">회원 리스트</a></li>

		<!--#:현재위치-->
	</ul>
</body>
</html>