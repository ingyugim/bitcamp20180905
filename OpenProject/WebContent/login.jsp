<%@page import="member.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html>

<%@ include file="common/header.jsp"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!--#:������ġ-->
<h2>login</h2>
<hr>
<%
	/*Checkbox ����*/

	//üũ�ڽ� ���� ����´�.
	String login_checkbox = request.getParameter("loginForm_checkbox");
	
	//1. Checkbox is checked : login_checkbox != null
	//1.1 ��Ű����
	//1.1 response�� ��Ű �߰�
	//2. Checkbox is not checked : login_checkbox == null
	if(login_checkbox != null){
		%><script>alert('Checkbox is checked')</script><%
		Cookie cookie = new Cookie("checkbox","checkbox");
		response.addCookie(cookie);
	}else if(login_checkbox == null){
		%><script>alert('Checkbox is not checked')</script><%
	}

	/*Application�� ����� ���̵�� ��й�ȣ �� �� �α���*/
	if((loginForm_userId!=null)&&(loginForm_userPw!=null) && (memberinfo_list != null)){
		for(int i =0 ; i<memberinfo_list.size(); i++){
		 
			if(  (loginForm_userId.equals(memberinfo_list.get(i).getUserId()) )&&
				 (loginForm_userPw.equals(memberinfo_list.get(i).getPassword())) ){
		
				//session.setAttribute("sessionId", userId);
				session.setAttribute("sessionId", memberinfo_list.get(i).getUserId());
				//session.setAttribute("sessionName", userName);
				session.setAttribute("sessionName", memberinfo_list.get(i).getPassword());
				%>
				�α��� ����
				<%
				response.sendRedirect("myPage.jsp");
			
				}else{%>
				<h5>���̵� �Ǵ� ��й�ȣ�� Ʋ���ϴ�.</h5>
				<script>alert('Please input your id or password')
				history.go(-1);				
				</script>
				<%
			}
		}
	}else {//end of if((loginForm_userId!=null)&&(loginForm_userPw!=null))%>
	<script>alert('Please input your id or password (id, pw is null)')</script>
	<%}
%>



<table>
	<tr>
		<td>�Է��� ���̵�:</td>
		<td><%=loginForm_userId %></td>
		<%-- <td>���Ե� ���̵�:</td>
		<td><%=memberinfo_ap.getUserId() %></td> --%>
	</tr>
	<tr>
		<td>�Է��� ��� :</td>
		<td><%=loginForm_userPw %></td>
		<%-- <td>���Ե� ��� : </td>
		<td><%=memberinfo_ap.getPassword() %></td> --%>
	</tr>
	<tr>
		<%-- <td>���Ե� �̸� :</td>
		<td><%=memberinfo_ap.getUserName() %></td> --%>
	</tr>
</table>
<h1>������ ���</h1>
<table>
	<tr>
		<td>index</td>
		<td>ID</td>
		<td>Password</td>
		<td>Name</td>
		<td>Management</td>
	</tr>
	
	<% 
	if(memberinfo_list != null){
		
	
	for(int i = 0 ; i<memberinfo_list.size() ; i++){ %>
	<tr>
		<td><%=i+1%></td>
		<td><%=memberinfo_list.get(i).getUserId()%></td>
		<td><%=memberinfo_list.get(i).getPassword()%></td>
		<td><%=memberinfo_list.get(i).getUserName()%></td>
		<td><a href="memberEdit.jsp">edit</a>_<a href="memberDelete.jsp">delete</a></td>
	</tr>
	<%	
		}
	}%>
	
</table>

<h1><a href="loginForm.jsp">�ٽ� �α����ϱ�</a></h1>


