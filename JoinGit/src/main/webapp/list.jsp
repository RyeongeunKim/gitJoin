<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<table border='1' width='300'>
			<tr bgcolor='#ffff00'>
				<td>���̵�</td>
				<td>����</td>
				<td>����</td>
				
		<%for (int i = 0; i < id.length; i++) { 
				out.println("<tr>");
				out.println("<td>" + id[i] + "</td>");
				out.println("<td><a href='delete?id=" + id[i] +  "'>����</a></td>");
				
				out.println("<td><a href='update?id=" + id[i] +  "'>����</a></td>");
				out.println("</tr>");
		} %>	
		
		</tr>
		</table>
</body>
</html>