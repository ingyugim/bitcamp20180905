<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//1.데이터 받기
		request.setCharacterEncoding("utf-8");
		String empno = request.getParameter("empno");
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");

		//2.드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");

		//3.연결
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "scott";
		String password = "tiger";

		Connection connection = null;
		PreparedStatement pstmt = null;
		connection = DriverManager.getConnection(url, user, password);
		int resultCnt =0;
		try {

			//4.prepareStatement
			//4.1 SQL문 생성
			String sql = "update emp set ename=?, job=? where empno=?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, ename);
			pstmt.setString(2, job);
			pstmt.setInt(3, Integer.parseInt(empno));//문자열로 받지만 숫자가 저장되어있어 형변환이 가능
			pstmt.executeUpdate();
			resultCnt = pstmt.executeUpdate();
			
		} finally {
			pstmt.close();
			connection.close();
		}

		//5.SQL > update
		//6.Date set
		//7.실행결과(int 타입)
	%>
	<h1>
	<%
		if(resultCnt > 0){
			%>수정완료<%
		}else{
			%>수정실패<%			
		}
	%>
		수정완료 <a href="emp_list.jsp">emp LIST</a>
	</h1>

</body>
</html>