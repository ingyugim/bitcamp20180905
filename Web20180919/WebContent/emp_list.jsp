<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>사원리스트</h1>
<h3><a href="empRegForm.jsp">사원 등록<a></a></h3>
	<table border="1">
		<tr>
			<td>사원번호</td>
			<td>사원이름</td>
			<td>직급</td>
			<td>관리</td>
		</tr>
		<%
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
			String list_sql = "select empno, ename, job from emp order by empno";
			
			//4.쿼리실행
			rs = stmt.executeQuery(list_sql);
			
			if(rs.next()){
				do{
				%>
		<tr>
			<td>사원번호:<%=rs.getInt("empno") %>,<%=rs.getInt(1) %></td>
			<td>사원이름:<%=rs.getString("ename") %> ,<%=rs.getString(2) %></td>
			<td>직급:<%=rs.getString("job") %>,<%=rs.getString(3) %></td>
			<td>
				<A href="editForm.jsp?empno=<%=rs.getInt("empno") %>">수정</A>
				<A href="delete.jsp?empno=<%=rs.getInt("empno") %>"> 삭제</A></td>
		</tr>
				
				<%
					
				}while(rs.next());
			}else{
				%>
		<tr>
			<td>등록된 사원이 없습니다.</td>
		</tr>
				
				<%
			}
			
			/*3.DataBase작업*/
			System.out.println("Success Connection to DataBase");
			//2.Connection 객체 생성
			rs.close();
			stmt.close();
			connection.close();
		%>
	</table>
</body>
</html>