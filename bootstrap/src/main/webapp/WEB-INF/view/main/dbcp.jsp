<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			커넥션풀(DBCP) <small>it all starts here</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Examples</a></li>
			<li class="active">Blank page</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<!-- Default box -->
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">메세지 목록</h3>

				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool"
						data-widget="collapse" data-toggle="tooltip" title="Collapse">
						<i class="fa fa-minus"></i>
					</button>
					<button type="button" class="btn btn-box-tool" data-widget="remove"
						data-toggle="tooltip" title="Remove">
						<i class="fa fa-times"></i>
					</button>
				</div>
			</div>
			<div class="box-body">
				<!-- viewMemberList 복사 -->
				
				<table width="100%" border="1">
					<tr>
						<td width="100px">메세지 번호</td>
						<td width="200px">손님 이름</td>
						<td>메세지</td>
					</tr> 
					
					
					<%
					// 1. JDBC 드라이버 로딩 => xml에 자동으로 로드하는 기능 넣어서 굳이 안넣어도 됨. 
					//Class.forName("com.mysql.jdbc.Driver"); 
					// 오라클 버전
					// Class.forName("oracle.jdbc.driver.OracleDriver")

					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;

					try {
						// String jdbcDriver = "jdbc:oracle~~"
						String jdbcDriver = "jdbc:mysql://localhost:3306/guestbook?" + "useUnicode=true&characterEncoding=utf8" ;
						String dbUser = "jspexam";
						String dbPass = "jsppw";

						/* String query = "select * from MEMBER order by MEMBERID"; */
						String query = "select * from guestbook_message order by MESSAGE_ID";

						// 2. 데이터베이스 커넥션 생성
						conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

						// 3. Statement 생성
						stmt = conn.createStatement();

						// 4. 쿼리 실행
						rs = stmt.executeQuery(query);

						// 5. 쿼리 실행 결과 출력
						while (rs.next()) {
					%>
					
					<tr>
						<td><%=rs.getString("MESSAGE_ID")%></td>
						<td><%=rs.getString("GUEST_NAME")%></td>
						<td><%=rs.getString("MESSAGE")%></td>
					</tr>
					
					<%
					}
					} catch (SQLException ex) {
					out.println(ex.getMessage());
					ex.printStackTrace();
					} finally {
					// 6. 사용한 Statement 종료
					if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
					}
					if (stmt != null)
					try {
						stmt.close();
					} catch (SQLException ex) {
					}

					// 7. 커넥션 종료
					if (conn != null)
					try {
						conn.close();
					} catch (SQLException ex) {
					}
					}
					%>
				</table>
			<!-- viewMemberList 복사 끝 -->



			</div>
			<!-- /.box-body -->
			<div class="box-footer"> </div>
			<!-- /.box-footer-->
		</div>
		<!-- /.box -->

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<%@ include file="../include/footer.jspf"%>
