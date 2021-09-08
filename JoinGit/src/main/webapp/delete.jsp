<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	  <%
 
 	     // 한글 처리 
	     request.setCharacterEncoding("UTF-8");
	     // 데이터를 전달받아서 처리 (파라미터)
	     String id = request.getParameter("id");
	     
	 	final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/db01";
		final String DBID = "root";
		final String DBPW = "9990";
	     
	     // 1 드라이버 로드
	     Class.forName(DRIVER);
	     System.out.println(" 드라이버 로드 성공! ");
	     // 2 디비연결
	     Connection con =
	           DriverManager.getConnection(DBURL, DBID, DBPW);
	     System.out.println(" 디비 연결 성공! ");
	     // 3 sql 작성 & pstmt 객체생성
	     String sql 
	     ="delete from table02 where id=?";
	     
	     PreparedStatement pstmt = con.prepareStatement(sql);
	     pstmt.setString(1, id);
	     
	     // 4 sql 실행
	     pstmt.executeUpdate();
	     
	     System.out.println(" 삭제 완료 성공! ");     
	  
	  %>
</body>
</html>