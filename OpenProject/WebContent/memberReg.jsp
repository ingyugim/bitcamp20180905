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
	//��ü�� session �� application�� �߰�
	session.setAttribute("MemberInfo", memberinfo);
	application.setAttribute("MemberInfo", memberinfo);
	//����Ʈ ����
	ArrayList<MemberInfo> memberList = new ArrayList<MemberInfo>();
	
%>
<%
	/*ȸ������ ����*/
	/*
			//application�Ӽ� memberList�� ����ͼ� memberList�� ����
			memberList = (ArrayList<MemberInfo>)application.getAttribute("memberList");
			//����Ʈ�� ��ü �߰�
			memberList.add(memberinfo);		
			//application list ����
			application.setAttribute("memberList", memberList);
	*/
	
	/*���̵� �Է��� null�� �ƴ϶�� �������� ����*/
	/*1.������� �޴� memberinfo_list ���̰� null�� �ƴҶ�(�ι�° ���� ������)*/
	//1.1	if�� ���� id �ߺ�x
	//1.1.1	application�Ӽ� memberList�� ����ͼ� memberList�� ����
	//1.1.2   ����Ʈ�� ��ü �߰�
	//1.1.3 application���� ����Ʈ�� �߰�
	
	//1.2	if�� ���� id �ߺ�o
	//1.2.1	�˸��߻�  -> �Էµ� Data view 
	
	/*2.������� �޴� memberinfo_list ���̰� null�϶� (ù ȸ��������)*/
	//2.1.1	memberList�� ��ü �߰�
	//2.1.2	memberList�� application�� �߰�
	
	/*���̵� �Է��� �������� ��:���˶�*/
%>
<%
	if(userId != null){
		%><script>alert('UserId is not null');<%
		/*���̵� �Է��� null�� �ƴ϶�� �������� ����*/
		if(memberinfo_list != null){
			/*1.������� �޴� memberinfo_list ���̰� null�� �ƴҶ�(�ι�° ���� ������)*/
			%><script>alert('memberinfo_list is not null');</script><%
			
			for(int i=0 ; i<memberinfo_list.size() ; i++ ){
				
				if(userId.equals(memberinfo_list.get(i).getUserId())){
					//1.2	if�� ���� id �ߺ�o
					%><script>
					alert('�̹� ������� ���̵� �Դϴ�.');
					</script><%
					//memberList = new ArrayList<MemberInfo>();
					break;
				}else{
					//1.1	if�� ���� id �ߺ�x
					//application�Ӽ� memberList�� ����ͼ� memberList�� ����(���ø����̼ǿ� �ִ� ���� ����Ʈ�� �����ͼ� ����Ʈ�� �߰�)
					memberList = (ArrayList<MemberInfo>)application.getAttribute("memberList");
					//����Ʈ�� ��ü �߰�
					memberList.add(memberinfo);		
					//application list ����
					application.setAttribute("memberList", memberList);
					break;
				}// end of if �ߺ�
			}//end of for
			
		}else if(memberinfo_list == null){
			/*2.������� �޴� memberinfo_list ���̰� null�϶� (ù ȸ��������)*/
			%><script>alert('memberinfo_list is null you are first user in this site');</script><%
			
			//2.1.1	memberList�� ��ü �߰�
			memberList.add(memberinfo);
			//2.1.2	memberList�� application�� �߰�
			application.setAttribute("memberList", memberList);
			%><script>alert('Success Join in Site');</script><%
			
		}// end of if : if(memberinfo_list != null)
		
	}else if(userId == null){
		/*���̵� �Է��� �������� ��:���˶�*/
		%><script>
			alert('Please input your ID');
			history.go(-1);
		</script><%
	}//end of if : if(userId != null)
	
%>




<%-- <%
	if(memberinfo_list != null){
		/* //application�Ӽ� memberList�� ����ͼ� memberList�� ����
		memberList = (ArrayList<MemberInfo>)application.getAttribute("memberList");
		//����Ʈ�� ��ü �߰�
		memberList.add(memberinfo);		
		//application list ����
		application.setAttribute("memberList", memberList); */
	
		for (int i = 0; i < memberinfo_list.size(); i++) {
			//�ߺ� ���̵� ������
			if ((memberinfo_list.get(i)!= null)&& userId.equals(memberinfo_list.get(i).getUserId())) {%>
			<script>
			alert('�̹� ������� ���̵� �Դϴ�.');
			history.go(-1);
			break;
			</script>
			
			<%}else{
				
			//application�Ӽ� memberList�� ����ͼ� memberList�� ����
			memberList = (ArrayList<MemberInfo>)application.getAttribute("memberList");
			//����Ʈ�� ��ü �߰�
			memberList.add(memberinfo);		
			//application list ����
			application.setAttribute("memberList", memberList);
			%>
			<script>
			alert('���Կ� �����Ͽ����ϴ�.');
			break;
			</script><%
			}//end of if else
		}//end of for
	}//end of if
	else{//ù ȸ�����Խ� ����Ǵ� �ڵ�
		//memberList = (ArrayList<MemberInfo>)application.getAttribute("memberList");
		if(userId != null){
			
		//����Ʈ�� ��ü �߰�
		memberList.add(memberinfo);		
		//application list ����
		application.setAttribute("memberList", memberList);
		%>
		<script>
			alert('���Կ� �����Ͽ����ϴ�.');
		</script>
		<%
		}else{%>
		<script>
			alert('���̵� �Է��ϼ���');
			response.sendRedirect("memberRegForm.jsp");
			/* history.go(-1); */
		</script>
			<%
		}
	}
%> --%>
