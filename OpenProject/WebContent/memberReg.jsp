<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="member.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="common/header.jsp"%>

<!--#:������ġ-->
<h2>ȸ����������</h2>
<hr>

<table>
	<tr>
		<td>���̵�(�̸���)</td>
		<td><%=userId%></td>
	</tr>
	<tr>
		<td>��й�ȣ</td>
		<td><%=userPw%></td>
	</tr>
	<tr>
		<td>�̸�</td>
		<td><%=userName%></td>
	</tr>
	<tr>
		<td>����</td>
		<td><a href="loginForm.jsp">�α��� �ϱ�</a></td>
	</tr>
</table>
<%
	//ȸ�������� ��ü�� �߰�
	MemberInfo memberinfo = new MemberInfo(userId,userPw,userName);
	//��ü�� ���ǿ� �߰�
	session.setAttribute("MemberInfo", memberinfo);
	
	//��ü�� application�� �߰�
	application.setAttribute("MemberInfo", memberinfo);
	
	//����Ʈ ����
	ArrayList<MemberInfo> memberList = new ArrayList<MemberInfo>();
	//application�Ӽ� memberList�� ����ͼ� memberList�� ����
	memberList = (ArrayList<MemberInfo>)application.getAttribute("memberList");
	//����Ʈ�� ��ü �߰�
	memberList.add(memberinfo);		
	//application list ����
	application.setAttribute("memberList", memberList);
	
	for(int i =0 ; i<memberinfo_list.size(); i++){
		if(userId.equals(memberinfo_list.get(i).getUserId())){
			%>
			<script>
			alert('�̹� ������� ���̵� �Դϴ�.')
			</script>
			<%
		}
	}
	
%>
