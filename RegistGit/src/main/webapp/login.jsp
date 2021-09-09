<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="Pack.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
	<body>
		<jsp:useBean id="recv" class="Pack.DTO" scope="page"/>
		<jsp:setProperty name="recv" property="*"/>
		<% //recv.getId() %>
		<% //recv.getPass() %>
		<%
 	    // 한글 처리 
	    //request.setCharacterEncoding("UTF-8");
		//String idq = request.getParameter("id");
		//String passq = request.getParameter("pass");
		//getParameter 대신 커맨드 객체 사용
		
		
		String idq = recv.getId();
		String passq = recv.getPass();
		
		
	 	final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/db01";
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
	     
	    

	     String name2 = "select * from regitable where id = '" + idq + "' AND pass = '" + passq +"';";
	     //out.println(name1);
	     //out.println(name2);
	     try {
		    	PreparedStatement pstmt = con.prepareStatement(name2);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next() != false){
		%>
					<h1>로그인되었습니다.</h1>
					<table border="1">
		<%
					out.print("회원정보");
					
					
					String id = rs.getString(1);
					String pass = rs.getString(2);
					String name = rs.getString(3);
					String tel = rs.getString(4);
					String email = rs.getString(5);
					String gender = rs.getString(6);
		%>
						<tr>
						<td><%= id%></td>
						<td><%= pass%></td>
						<td><%= name%></td>
						<td><%= tel%></td>
						<td><%= email%></td>
						<td><%= gender%></td>
						</tr>
		
					</table><hr/>
					
		<%
				}
				else{
					out.print("회원정보가 없습니다.");
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	  	%>
	
	</body>
</html>