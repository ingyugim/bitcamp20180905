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
	//객체를 session 및 application에 추가
	session.setAttribute("MemberInfo", memberinfo);
	application.setAttribute("MemberInfo", memberinfo);
	//리스트 생성
	ArrayList<MemberInfo> memberList = new ArrayList<MemberInfo>();
	
%>
<%
	/*회원가입 조건*/
	/*
			//application속성 memberList를 갖고와서 memberList에 대입
			memberList = (ArrayList<MemberInfo>)application.getAttribute("memberList");
			//리스트에 객체 추가
			memberList.add(memberinfo);		
			//application list 저장
			application.setAttribute("memberList", memberList);
	*/
	
	/*아이디 입력을 null이 아니라는 조건으로 시작*/
	/*1.헤더에서 받는 memberinfo_list 길이가 null이 아닐때(두번째 이후 가입자)*/
	//1.1	if문 조건 id 중복x
	//1.1.1	application속성 memberList를 갖고와서 memberList에 대입
	//1.1.2   리스트에 객체 추가
	//1.1.3 application에에 리스트를 추가
	
	//1.2	if문 조건 id 중복o
	//1.2.1	알림발생  -> 입력된 Data view 
	
	/*2.헤더에서 받는 memberinfo_list 길이가 null일때 (첫 회원가입자)*/
	//2.1.1	memberList에 객체 추가
	//2.1.2	memberList를 application에 추가
	
	/*아이디 입력을 누락했을 때:경고알람*/
%>
<%
	if(userId != null){
		%><script>alert('UserId is not null');<%
		/*아이디 입력을 null이 아니라는 조건으로 시작*/
		if(memberinfo_list != null){
			/*1.헤더에서 받는 memberinfo_list 길이가 null이 아닐때(두번째 이후 가입자)*/
			%><script>alert('memberinfo_list is not null');</script><%
			
			for(int i=0 ; i<memberinfo_list.size() ; i++ ){
				
				if(userId.equals(memberinfo_list.get(i).getUserId())){
					//1.2	if문 조건 id 중복o
					%><script>
					alert('이미 사용중인 아이디 입니다.');
					</script><%
					//memberList = new ArrayList<MemberInfo>();
					break;
				}else{
					//1.1	if문 조건 id 중복x
					//application속성 memberList를 갖고와서 memberList에 대입(어플리케이션에 있는 기존 리스트를 가져와서 리스트에 추가)
					memberList = (ArrayList<MemberInfo>)application.getAttribute("memberList");
					//리스트에 객체 추가
					memberList.add(memberinfo);		
					//application list 저장
					application.setAttribute("memberList", memberList);
					break;
				}// end of if 중복
			}//end of for
			
		}else if(memberinfo_list == null){
			/*2.헤더에서 받는 memberinfo_list 길이가 null일때 (첫 회원가입자)*/
			%><script>alert('memberinfo_list is null you are first user in this site');</script><%
			
			//2.1.1	memberList에 객체 추가
			memberList.add(memberinfo);
			//2.1.2	memberList를 application에 추가
			application.setAttribute("memberList", memberList);
			%><script>alert('Success Join in Site');</script><%
			
		}// end of if : if(memberinfo_list != null)
		
	}else if(userId == null){
		/*아이디 입력을 누락했을 때:경고알람*/
		%><script>
			alert('Please input your ID');
			history.go(-1);
		</script><%
	}//end of if : if(userId != null)
	
%>




<%-- <%
	if(memberinfo_list != null){
		/* //application속성 memberList를 갖고와서 memberList에 대입
		memberList = (ArrayList<MemberInfo>)application.getAttribute("memberList");
		//리스트에 객체 추가
		memberList.add(memberinfo);		
		//application list 저장
		application.setAttribute("memberList", memberList); */
	
		for (int i = 0; i < memberinfo_list.size(); i++) {
			//중복 아이디가 있을때
			if ((memberinfo_list.get(i)!= null)&& userId.equals(memberinfo_list.get(i).getUserId())) {%>
			<script>
			alert('이미 사용중인 아이디 입니다.');
			history.go(-1);
			break;
			</script>
			
			<%}else{
				
			//application속성 memberList를 갖고와서 memberList에 대입
			memberList = (ArrayList<MemberInfo>)application.getAttribute("memberList");
			//리스트에 객체 추가
			memberList.add(memberinfo);		
			//application list 저장
			application.setAttribute("memberList", memberList);
			%>
			<script>
			alert('가입에 성공하였습니다.');
			break;
			</script><%
			}//end of if else
		}//end of for
	}//end of if
	else{//첫 회원가입시 실행되는 코드
		//memberList = (ArrayList<MemberInfo>)application.getAttribute("memberList");
		if(userId != null){
			
		//리스트에 객체 추가
		memberList.add(memberinfo);		
		//application list 저장
		application.setAttribute("memberList", memberList);
		%>
		<script>
			alert('가입에 성공하였습니다.');
		</script>
		<%
		}else{%>
		<script>
			alert('아이디를 입력하세요');
			response.sendRedirect("memberRegForm.jsp");
			/* history.go(-1); */
		</script>
			<%
		}
	}
%> --%>
