<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <form action="registerPro.jsp" method="post" name="fr">
        아이디 : <input type="text" name="id" value=""><br>
        <button onclick="winopen();" type="button" >중복체크</button><br>
        비밀번호 : <input type="password" name="pass" value="pw"><br>
        이름 : <input type="text" name="name" value="namee"><br>
        전화번호 : <input type="text" name="tel" value="telll"><br>
        이메일 : <input type="text" name="email" value="emailll"><br>
        성별 : <input type="text" name="gender" value="gendereee"><br>
        <input type="submit" value="가입하기">   
   </form>

	<script>
		// 아이디중복체크
		function winopen(){
			//새창을 열어서 페이지 오픈 후 아이디 정보를 가지고 중복체크
			//아이디가 없으면 알림창과 진행 x
			if(document.fr.id.value == "" || document.fr.id.value.length < 0){
				alert("아이디를 먼저 입력해주세요")
				document.fr.id.focus();
			}else{
				window.open("idcheck.jsp?id="+document.fr.id.value,"",
						"width=300,height=50,left=120, top=120, location=no");
			}
		}
	</script>
</body>
</html>