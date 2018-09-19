<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*"(empno, ename, job, mgr, hiredate, sal, comm, deptno) "*/
	String empno = request.getParameter("rg_empno");
	String ename = request.getParameter("rg_ename");
	String job = request.getParameter("rg_job");
	String mgr = request.getParameter("rg_mgr");
	String hiredate = request.getParameter("rg_hiredate");
	String sal = request.getParameter("rg_sal");
	String comm = request.getParameter("rg_comm");
	String deptno = request.getParameter("rg_deptno");
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String password = "tiger";

	ResultSet rs = null;
	Connection connection = null;
	PreparedStatement pstmt = null;
	int procNum = 0;
	
	try{	
	//1.데이터베이스 드라이버 로드 : Class.forName("oracle.jdbc.driver.OracleDriver");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//2.connection객체 생성	
	connection = DriverManager.getConnection(url, user, password);
	//3.Statement 생성
	String insert = "INSERT INTO emp " 
			+ "(empno, ename, job, mgr, hiredate, sal, comm, deptno) "
			+ "VALUES (?, ?, ?, ?, sysdate, ?, ?, ?) ";
	//4.쿼리실행
	pstmt = connection.prepareStatement(insert);
	pstmt.setInt(1, Integer.parseInt(empno));
	pstmt.setString(2, ename);
	pstmt.setString(3, job);
	pstmt.setInt(4, Integer.parseInt(mgr));
	//pstmt.setString(5, "sysdate");
	pstmt.setInt(5, Integer.parseInt(sal));
	pstmt.setInt(6, Integer.parseInt(comm));
	pstmt.setInt(7, Integer.parseInt(deptno));
	procNum = pstmt.executeUpdate();
	System.out.println(procNum + "개 행이 적용되었습니다.");
	
	
	/*//2.EMP 테이블의 모든 데이터를 출력하는 프로그램을 작성해보자.
	
	
	/*4.DataBase연결종료*/
	connection.close();
	
	}catch (ClassNotFoundException e) {
		//1.DBMS(Oracle)드라이버 로드실패
		System.out.println("can't find class.");
		System.out.println("DBMS driver Load Fail");
		e.printStackTrace();
		
	} catch (SQLException e) {
		//2 DataBase 연결실패
		System.out.println("connect fail to DataBase");
		e.printStackTrace();
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(procNum > 0){
	%>
<h1>가입 성공</h1>
	<form action="edit.jsp" type="post">
		<table>
			<!-- 
		"(empno, ename, job, mgr, hiredate, sal, comm, deptno) "
		 -->
			<tr>
				<td>EMPNO</td>
				<td><input type="text" name="rg_empno" value=""><%=empno%></td>
			</tr>
			<tr>
				<td>ENAME</td>
				<td><input type="text" name="rg_ename"><%=ename%></td>
			</tr>
			<tr>
				<td>JOB</td>
				<td><input type="text" name="rg_job"><%=job%></td>
			</tr>
			<tr>
				<td>MGR</td>
				<td><input type="text" name="rg_mgr">value="<%=mgr%>"</td>
			</tr>
			<tr>
				<td>HIREDATE</td>
				<td><input type="text" name="rg_hiredate"><%=hiredate%></td>
			</tr>
			<tr>
				<td>SAL</td>
				<td><input type="text" name="rg_sal"><%=sal%></td>
			</tr>
			<tr>
				<td>COMM</td>
				<td><input type="text" name="rg_comm"><%=comm%></td>
			</tr>
			<tr>
				<td>DEPTNO</td>
				<td><input type="text" name="rg_deptno"><%=deptno%></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정" name="rg_job"></td>
			</tr>
		</table>
	</form>
			<%
	}else{
%>
<h1>가입실패</h1>
<table>
			<!-- 
		"(empno, ename, job, mgr, hiredate, sal, comm, deptno) "
		 -->
			<tr>
				<td>EMPNO</td>
				<td><%=empno%></td>
			</tr>
			<tr>
				<td>ENAME</td>
				<td><%=ename%></td>
			</tr>
			<tr>
				<td>JOB</td>
				<td><%=job%></td>
			</tr>
			<tr>
				<td>MGR</td>
				<td><%=mgr%>"</td>
			</tr>
			
			<tr>
				<td>SAL</td>
				<td><%=sal%></td>
			</tr>
			<tr>
				<td>COMM</td>
				<td><%=comm%></td>
			</tr>
			<tr>
				<td>DEPTNO</td>
				<td><%=deptno%></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정" name="rg_job"></td>
			</tr>
		</table>
<%} %>
	

</body>
</html>

