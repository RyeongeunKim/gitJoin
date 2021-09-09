<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <%
 
 	     // 한글 처리 
	    request.setCharacterEncoding("UTF-8");
	     
	 	final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/db03";
		final String DBID = "root";
		final String DBPW = "1234";
	     
	     // 1 드라이버 로드
	     Class.forName(DRIVER);
	     System.out.println(" 드라이버 로드 성공! ");
	     // 2 디비연결
	     Connection con =
	     DriverManager.getConnection(DBURL, DBID, DBPW);
	     System.out.println(" 디비 연결 성공! ");
	     // 3 sql 작성 & pstmt 객체생성
	     
	    
	     String name1 = "select * from table02;";
	     
			try {
		    	PreparedStatement pstmt = con.prepareStatement(name1);
				ResultSet rs = pstmt.executeQuery();
				
				%>
				
				<h1>데이터베이스 출력합니다.</h1>
				<table border="1">
				<%
				while(rs.next()) {
					String id = rs.getString(1);
				%>
					<tr>
					<td><%= id%></td>
					<td><a href="delete.jsp?id=<%= id%>">삭제</a></td>
					<td><a href="update.jsp?id=<%= id%>">수정</a></td>	
					</tr>
				<% 
				}
				%>
				</table>
		
		
<!-- 			<table border="1" width="200"> -->
<!-- 			<tr> -->
<%-- 				<td><%=1 %></td> <!-- 그냥 1넣었을때랑 다르다 변수를 넣을수 있으니 --> --%>
<%-- 				<td><%=Fullname%></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<%-- 				<td><%=2 %></td>  --%>
<%-- 				<td><%="코끼리" %></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<%-- 				<td><%=3 %></td>  --%>
<%-- 				<td><%="독수리" %></td> --%>
<!-- 			</tr> -->
<!-- 		</table> -->
		<% 		
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
	     
	     System.out.println(" 리스트 완료 ");     
	  
	  %>
	  
</body>
</html>