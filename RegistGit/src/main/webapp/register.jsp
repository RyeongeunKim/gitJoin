<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ page import="java.sql.*" %>
   <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1><%= request.getParameter("id")%>님 가입이 완료되었습니다.</h1>
<%
 		String id = request.getParameter("id");
		String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
		//out.println(1);
		String DB_URL = "jdbc:mysql://localhost:3306/db01?useSSL=false";
		String USERNAME = "root";
		String PASSWORD = "9990";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			while(true) {
			Class.forName(JDBC_DRIVER);
 			
			conn = DriverManager.getConnection(DB_URL,USERNAME,PASSWORD);
			stmt = conn.createStatement();
			String ins = "INSERT INTO table02 values('" + id + "');";
			stmt.executeUpdate(ins);
			stmt.close();
			conn.close();
			break;
			}
		}catch (ClassNotFoundException e) { 
			System.out.println("Class Not Found Exection"); 
			e.printStackTrace(); 

		}catch (SQLException e) {
			System.out.println("SQL Exception : " + e.getMessage()); e.printStackTrace(); 
		}
%>


</body>
</html>