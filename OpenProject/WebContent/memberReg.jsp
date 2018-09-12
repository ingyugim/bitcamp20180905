<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="member.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="common/header.jsp"%>

<!--#:현재위치-->
<h2>회원가입정보</h2>
<hr>

<table>
	<tr>
		<td>아이디(이메일)</td>
		<td><%=userId%></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=userPw%></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=userName%></td>
	</tr>
	<tr>
		<td>사진</td>
		<td><a href="loginForm.jsp">로그인 하기</a></td>
	</tr>
</table>
<%
	//회원정보를 객체에 추가
	MemberInfo memberinfo = new MemberInfo(userId,userPw,userName);
	//객체를 세션에 추가
	session.setAttribute("MemberInfo", memberinfo);
	
	//객체를 application에 추가
	application.setAttribute("MemberInfo", memberinfo);
	
	//리스트 생성
	ArrayList<MemberInfo> memberList = new ArrayList<MemberInfo>();
	//application속성 memberList를 갖고와서 memberList에 대입
	memberList = (ArrayList<MemberInfo>)application.getAttribute("memberList");
	//리스트에 객체 추가
	memberList.add(memberinfo);		
	//application list 저장
	application.setAttribute("memberList", memberList);
	
	for(int i =0 ; i<memberinfo_list.size(); i++){
		if(userId.equals(memberinfo_list.get(i).getUserId())){
			%>
			<script>
			alert('이미 사용중인 아이디 입니다.')
			</script>
			<%
		}
	}
	
%>
