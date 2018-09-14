<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="common/header.jsp"%>

<!--#:현재위치-->


<h2>MemberList</h2>
<hr>
<h1>회원리스트 TEST</h1>
<form>
	<table border="1" id="member_list_table">
		<tr>
			<td>회원번호</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td><center>이름</center> </td>
			<td><center>관리</center></td>
		</tr>
<%
	MemberInfo listMember = null;
	String id = "";
	String pw = "";
	String name = "";
	if(memberinfo_list != null){
		
	
	for(int i =0 ; i<memberinfo_list.size(); i++){
	/* id = ((MemberInfo)memberinfo_list.get(i)).getUserId();
	pw = ((MemberInfo)memberinfo_list.get(i)).getPassword();
	name = ((MemberInfo)memberinfo_list.get(i)).getUserName(); */
	%>
		<tr>
			<td><%=i+1%></td>
			<td><%=memberinfo_list.get(i).getUserId()%></td>
			<td><%=memberinfo_list.get(i).getPassword()%></td>
			<td><%=memberinfo_list.get(i).getUserName()%></td>
			<td>
			<a href="memberEdit.jsp">수정</a> 
			<a href="memberDelete.jsp">삭제</a>
			</td>
		</tr>
	<%
		}//end of for
	}//end of if
	%>					
	</table>
</form>