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
<title>Insert title here</title>
</head>
<body>
	  <%
 
 	     // �ѱ� ó�� 
	     request.setCharacterEncoding("UTF-8");
	     
	 	final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/db01";
		final String DBID = "root";
		final String DBPW = "Password@";
	     
	     // 1 ����̹� �ε�
	     Class.forName(DRIVER);
	     System.out.println(" ����̹� �ε� ����! ");
	     // 2 ��񿬰�
	     Connection con =
	     DriverManager.getConnection(DBURL, DBID, DBPW);
	     System.out.println(" ��� ���� ����! ");
	     // 3 sql �ۼ� & pstmt ��ü����
	     
	    
	     String name1 = "select * from table02;";
	     
			try {
		    	PreparedStatement pstmt = con.prepareStatement(name1);
				ResultSet rs = pstmt.executeQuery();
				
				
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
					<td><a href="delete.jsp?id=<%=memberList.get(i) %>">����</a></td>
					<td><a href="update.jsp?id=<%=memberList.get(i) %>">����</a></td>
					</tr>
				<% }%>
				</table>
		
		
<!-- 			<table border="1" width="200"> -->
<!-- 			<tr> -->
<%-- 				<td><%=1 %></td> <!-- �׳� 1�־������� �ٸ��� ������ ������ ������ --> --%>
<%-- 				<td><%=Fullname%></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<%-- 				<td><%=2 %></td>  --%>
<%-- 				<td><%="�ڳ���" %></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<%-- 				<td><%=3 %></td>  --%>
<%-- 				<td><%="������" %></td> --%>
<!-- 			</tr> -->
<!-- 		</table> -->
		<% 		
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
	     
	     System.out.println(" ����Ʈ �Ϸ� ");     
	  
	  %>
	  
</body>
</html>