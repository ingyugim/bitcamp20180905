import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBC_test {

	public static void main(String[] args) {
		
//		DeptTable dUser = new DeptTable(1,"testname","seoul");
		EmpTable eUser = new EmpTable(9002, "testname", "testjob", 0000, 4000, 500, 30);
//		//Insert.insert(dUser);
		Insert_emp.insert(eUser);
//		Select_emp.select();
	}//end of mainMethod
}


class DeptTable{
	private int deptno;
	private String dname;
	private String loc;
	
	public DeptTable() {
	}

	public DeptTable(int deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}
	
}//end of depttable

class EmpTable{
	
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	//private String hiredate;
	private int sal;
	private int comm;
	private int deptno;
	
	public EmpTable() {
		// TODO Auto-generated constructor stub
	}

	public EmpTable(int empno, String ename, String job, int mgr, 
			 int sal, int comm,	int deptno) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.job = job;
		this.mgr = mgr;
		//this.hiredate = hiredate;
		this.sal = sal;
		this.comm = comm;
		this.deptno = deptno;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getMgr() {
		return mgr;
	}

	public void setMgr(int mgr) {
		this.mgr = mgr;
	}

	/*public String getHiredate() {
		return hiredate;
	}*/

	/*public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}*/

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public int getComm() {
		return comm;
	}

	public void setComm(int comm) {
		this.comm = comm;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	
}//end of empTable

class Insert{
	static void insert(DeptTable d_User){
				
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			/*1.DBMS(Oracle)드라이버 로드 : 예외처리가 필요하다 >try catch*/
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String password = "tiger";
			/*2 DataBase 연결 :예외처리 추가*/
			Connection connection = DriverManager.getConnection(url, user, password);			
			/*3.DataBase작업*/
			System.out.println("Success Connection to DataBase");
			
			/*
			3. EMP 테이블에 서 “SCOTT” 사원의 급여(sal) 정보를 1000으로 바꾸는 프로그램을 작성해보자.
			4.EMP 테이블에 서 “SCOTT” 이름으로 검색한 결과를 출력하는 프로그램을 작성해보자.
			5.모든 사원정보를 출력하되 부서정보를 함께 출력하는 프로그램을 작성해보자.
			*/
			//1.EMP 테이블에 새로운 사원 정보를 입력하는 프로그램을 작성해보자.
			String insert = "INSERT INTO dept (DEPTNO, DNAME, Loc) VALUES (?, ?, ?) ";
			Statement stmt = connection.createStatement();
			PreparedStatement pstmt = connection.prepareStatement(insert);
			pstmt.setInt(1, d_User.getDeptno());
			pstmt.setString(2, d_User.getDname());
			pstmt.setString(3, d_User.getLoc());
			int procNum = pstmt.executeUpdate();
			System.out.println(procNum + "개 행이 적용되었습니다.");
			
			/*//2.EMP 테이블의 모든 데이터를 출력하는 프로그램을 작성해보자.
			String select = "select * from dept";
			ResultSet resultSet = stmt.executeQuery(select);
			while(resultSet.next()) {
				System.out.println("DEPTNO " + resultSet.getInt(1));
				System.out.println("DNAME " + resultSet.getInt(2));
				System.out.println("LOC " + resultSet.getInt(3));
			}
			resultSet.close();
			pstmt.close();*/
			
			
			/*4.DataBase연결종료*/
			connection.close();
			
			
		} catch (ClassNotFoundException e) {
			//1.DBMS(Oracle)드라이버 로드실패
			System.out.println("can't find class.");
			System.out.println("DBMS driver Load Fail");
			e.printStackTrace();
			
		} catch (SQLException e) {
			//2 DataBase 연결실패
			System.out.println("connect fail to DataBase");
			e.printStackTrace();
		}
		
	}
}

class Insert_emp{
	static void insert(EmpTable eUser){
		
		DeptTable user_DeptTable = new DeptTable();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			/*1.DBMS(Oracle)드라이버 로드 : 예외처리가 필요하다 >try catch*/
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String password = "tiger";
			/*2 DataBase 연결 :예외처리 추가*/
			Connection connection = DriverManager.getConnection(url, user, password);			
			/*3.DataBase작업*/
			System.out.println("Success Connection to DataBase");
			
			/*
			3. EMP 테이블에 서 “SCOTT” 사원의 급여(sal) 정보를 1000으로 바꾸는 프로그램을 작성해보자.
			4.EMP 테이블에 서 “SCOTT” 이름으로 검색한 결과를 출력하는 프로그램을 작성해보자.
			5.모든 사원정보를 출력하되 부서정보를 함께 출력하는 프로그램을 작성해보자.
			 */
			//1.EMP 테이블에 새로운 사원 정보를 입력하는 프로그램을 작성해보자.
			String insert = "INSERT INTO emp "
					+ "(empNO, eNAME, job, mgr, hiredate, sal, comm, deptno) "
					+ "VALUES (?, ?, ?, ?, sysdate, ?, ?, ?) ";
			Statement stmt = connection.createStatement();
			PreparedStatement pstmt = connection.prepareStatement(insert);
			pstmt.setInt(1, eUser.getEmpno());
			pstmt.setString(2, eUser.getEname());
			pstmt.setString(3, eUser.getJob());
			pstmt.setInt(4, eUser.getMgr());
//			pstmt.setString(5, "sysdate");
			pstmt.setInt(5, eUser.getSal());
			pstmt.setInt(6, eUser.getComm());
			pstmt.setInt(7, eUser.getDeptno());
			int procNum = pstmt.executeUpdate();
			System.out.println(procNum + "개 행이 적용되었습니다.");
			
			/*//2.EMP 테이블의 모든 데이터를 출력하는 프로그램을 작성해보자.
			String select = "select * from dept";
			ResultSet resultSet = stmt.executeQuery(select);
			while(resultSet.next()) {
				System.out.println("DEPTNO " + resultSet.getInt(1));
				System.out.println("DNAME " + resultSet.getInt(2));
				System.out.println("LOC " + resultSet.getInt(3));
			}
			resultSet.close();
			pstmt.close();*/
			
			
			/*4.DataBase연결종료*/
			connection.close();
			
			
		} catch (ClassNotFoundException e) {
			//1.DBMS(Oracle)드라이버 로드실패
			System.out.println("can't find class.");
			System.out.println("DBMS driver Load Fail");
			e.printStackTrace();
			
		} catch (SQLException e) {
			//2 DataBase 연결실패
			System.out.println("connect fail to DataBase");
			e.printStackTrace();
		}
		
	}
}

class Select_emp{
	static void select(){
		
		DeptTable user_DeptTable = new DeptTable();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			/*1.DBMS(Oracle)드라이버 로드 : 예외처리가 필요하다 >try catch*/
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String password = "tiger";
			/*2 DataBase 연결 :예외처리 추가*/
			Connection connection = DriverManager.getConnection(url, user, password);			
			/*3.DataBase작업*/
			System.out.println("Success Connection to DataBase");
			
			/*
			3. EMP 테이블에 서 “SCOTT” 사원의 급여(sal) 정보를 1000으로 바꾸는 프로그램을 작성해보자.
			4.EMP 테이블에 서 “SCOTT” 이름으로 검색한 결과를 출력하는 프로그램을 작성해보자.
			5.모든 사원정보를 출력하되 부서정보를 함께 출력하는 프로그램을 작성해보자.
			 */
			//1.EMP 테이블에 새로운 사원 정보를 입력하는 프로그램을 작성해보자.
			String insert = "INSERT INTO emp "
					+ "(empNO, eNAME, job, mgr, hiredate, sal, comm, deptno) "
					+ "VALUES (?, ?, ?, ?, sysdate, ?, ?, ?) ";
			String select = "select * from emp";
			Statement stmt = connection.createStatement();
			//PreparedStatement pstmt = connection.prepareStatement(insert);
			ResultSet resultSet = stmt.executeQuery(select);
			
			while(resultSet.next()) {
				/*
				 private int empno;
				private String ename;
				private String job;
				private int mgr;
				//private String hiredate;
				private int sal;
				private int comm;
				private int deptno;
				 */
				System.out.print(" empNO :" + resultSet.getInt(1));
				System.out.print(" eNAME :" + resultSet.getString(2));
				System.out.print(" job :" + resultSet.getString(3));
				System.out.print(" mgr :" + resultSet.getInt(4));
				System.out.print(" hiredate :" + resultSet.getDate(5));
				System.out.print(" sal :" + resultSet.getInt(6));
				System.out.print(" comm :" + resultSet.getInt(7));
				System.out.print(" deptno :" + resultSet.getInt(8));
				System.out.println("");
			}
			resultSet.close();
			stmt.close();
			
			/*//2.EMP 테이블의 모든 데이터를 출력하는 프로그램을 작성해보자.
			
			
			/*4.DataBase연결종료*/
			connection.close();
			
			
		} catch (ClassNotFoundException e) {
			//1.DBMS(Oracle)드라이버 로드실패
			System.out.println("can't find class.");
			System.out.println("DBMS driver Load Fail");
			e.printStackTrace();
			
		} catch (SQLException e) {
			//2 DataBase 연결실패
			System.out.println("connect fail to DataBase");
			e.printStackTrace();
		}
		
	}
}
