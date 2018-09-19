<%@page import="java.sql.PreparedStatement"%>
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
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int resultCnt = 0;
	
	try{
		
	//2.connection객체 생성	
	connection = DriverManager.getConnection(url, user, password);
	//3.Statement 생성
	String sql = "delete from emp where empno=?";
	pstmt = connection.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(empno));
	
	//4.쿼리실행
	resultCnt = pstmt.executeUpdate();
	}finally{
		pstmt.close();
		connection.close();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>삭제완료 <%=resultCnt %></h1>
	<a href="emp_list.jsp">리스트</a>
</body>
</html>