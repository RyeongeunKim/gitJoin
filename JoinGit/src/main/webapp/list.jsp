<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<title>회원목록</title>
</head>
<body>
	  <%
 
 	     // 한글 처리 
	     request.setCharacterEncoding("UTF-8");
	     
	 	final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/db01";
		final String DBID = "root";
		final String DBPW = "Password@";
	     
	     // 1 드라이버 로드
	     Class.forName(DRIVER);
	     System.out.println(" 드라이버 로드 성공! ");
	     // 2 디비연결
	     Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	     System.out.println(" 디비 연결 성공! ");
	     // 3 sql 작성 & pstmt 객체생성
	     
	    
	     String name1 = "select * from table02;";
	     
			try {
		    	PreparedStatement pstmt = con.prepareStatement(name1); //DB로 SQL문을 요청하기 위해 생성하는 객체
				ResultSet rs = pstmt.executeQuery(); //executeQuery( ) 메소드에서 실행된 select 문의 결과값을 가지고 있는 객체
				
				
				List memberList = new ArrayList();
				
				while(rs.next()) {
						String Fullname = rs.getString(1);
						System.out.println(Fullname);
						memberList.add(Fullname);
				}
				%>
				<table border="1">
				<%
				for(int i=0; i<memberList.size(); i++){
				%>
					<tr>
					<td><%= memberList.get(i)%></td>
					<td><a href="delete.jsp?id=<%=memberList.get(i) %>">삭제</a></td>
					<td><a href="update.jsp?id=<%=memberList.get(i) %>">수정</a></td>
					</tr>
				<% }%>
				</table>

		<% 		
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
	     
	     System.out.println(" 리스트 완료 ");     
	  
	  %>
	  
</body>
</html>