<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String empno = request.getParameter("empno");
    
  //1.데이터베이스 드라이버 로드 : Class.forName("oracle.jdbc.driver.OracleDriver");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String password = "tiger";

	
	Connection connection = null;
	Statement stmt = null;
	ResultSet rs = null;
	//2.connection객체 생성	
	connection = DriverManager.getConnection(url, user, password);	
    
	//3.Statement 생성
	stmt = connection.createStatement();
	String list_sql = "select empno, ename, job from emp where empno ="+ empno;
	
	//4.쿼리실행
	rs = stmt.executeQuery(list_sql);
	
	String ename = "";
	String job = "";
	
	if(rs.next()){
		ename = rs.getString("ename");
		job = rs.getString("job");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=list_sql %>
	<form action="edit.jsp" type="post">
		<table>
			<tr>
				<td>사원번호</td>
				<td><input type="text" value="<%= empno %>" name="empno" readonly></td>
			</tr>
			<tr>
				<td>사원이름</td>
				<td><input type="text" value="<%= ename %>" name="ename"></td>
			</tr>
			<tr>
				<td>사원직급</td>
				<td><input type="text" value="<%= job %>" name="job"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정" name="job"></td>
			</tr>
		</table>
	</form>

</body>
</html>

