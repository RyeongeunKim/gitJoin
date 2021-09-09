<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
		<table width="30%" border="1" cellpadding="10" cellspacing="1">
			<tr align="center">
				<td colspan="3">로그인</td>
			</tr>
			<form METHOD=POST action="login.jsp">
				<tr align="center">
					<td>아이디</td>
					<td><input type="text" name="id" value="admin"></td>
					<td>아이디를 적어주세요</td>
				</tr>
				<tr align="center">
					<td>패스워드</td>
					<td><input type="text" name="pass" value="admin"></td>
					<td>비밀번호를 적어주세요</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="submit" value="로그인"></td>
				</tr>
			</form>
			<tr align="center">
				<td><a href="register.jsp">회원가입</a></td>
				<td><a>아이디찾기</a></td>
				<td><a>비밀번호찾기</a></td>
			</tr>
			
		</table>
	
</body>
</html>