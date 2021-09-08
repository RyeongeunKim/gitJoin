<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1 -->
	<a href="a.jsp?fullName=호랑이">전송1</a><br/>
	<!-- 2 -->
	<% String s1 = "lion"; %>
	<a href="b.jsp?fullName=<%=s1%>">전송2</a><br/>
	<!-- 3 -->
	<a href="c.jsp?fullName=tiger&age=1000">전송3</a><br/>
	<!-- 4 -->
	<% 
		String s2 = "cat"; 
		int num = 999;
	%>
	<a href="d.jsp?fullName=<%=s2%>&age=<%=num%>">전송4</a><br/>
	
	<!-- 링크걸기 -->
	<a href="http://www.daum.net">다음</a><br/>
	
	<!-- 5 -->
	<form action="e.jsp">
		  <input type="text" name="tel" value="호랑이"><br>
		  <input type="hidden" name="age" value="23">
		  <input type="submit" value="다음단계">
	</form>
</body>
</html>