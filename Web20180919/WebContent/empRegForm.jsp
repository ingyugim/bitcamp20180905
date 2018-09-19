<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="empReg.jsp" method="post">
		<table>
			<!-- 
		"(empno, ename, job, mgr, hiredate, sal, comm, deptno) "
		 -->
			<tr>
				<td>EMPNO</td>
				<td><input type="text"  name="rg_empno"></td>
			</tr>
			<tr>
				<td>ENAME</td>
				<td><input type="text"  name="rg_ename"></td>
			</tr>
			<tr>
				<td>JOB</td>
				<td><input type="text"  name="rg_job"></td>
			</tr>
			<tr>
				<td>MGR</td>
				<td><input type="text"  name="rg_mgr"></td>
			</tr>
			
			<tr>
				<td>SAL</td>
				<td><input type="text"  name="rg_sal"></td>
			</tr>
			<tr>
				<td>COMM</td>
				<td><input type="text"  name="rg_comm"></td>
			</tr>
			<tr>
				<td>DEPTNO</td>
				<td><input type="text"  name="rg_deptno"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Insert"></td>
			</tr>
		</table>
	</form>

</body>
</html>

