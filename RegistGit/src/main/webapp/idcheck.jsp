<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="Pack.DTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
   <%
     // 회원가입정보를 전달받아서 저장 -> DB저장 (회원)
     
     // 한글처리 
     request.setCharacterEncoding("UTF-8");
     String id = request.getParameter("id");
     int result = 0;

   %>  
   <!-- 자바빈 객체 생성 -->
   <jsp:useBean id="dto" class="Pack.DTO"/>
   <!-- 전달되는 파라미터값 저장 -->
   <jsp:setProperty property="*" name="dto"/>
   <%
      System.out.println("객체 정보 : "+dto);
     
     //////////////////////////////////////////////////////////
     // 해당 정보를 사용해서 DB로 이동 저장
     // 디비연결 필요정보 
     String DRIVER = "com.mysql.cj.jdbc.Driver";
     String DBURL = "jdbc:mysql://localhost:3306/db01";
     String DBID ="root";
     String DBPW ="9990";
     
     // 1 드라이버로드
     Class.forName(DRIVER);
     System.out.println(" 드라이버 로드 성공 ! ");
     
     // 2 디비연결
     Connection conn = 
      DriverManager.getConnection(DBURL, DBID, DBPW);
     System.out.println(conn);
     
     // 3 sql구문 작성 & pstmt 객체 생성
     String sql 
     ="select * from regitable where id=?";
     
    //부모 PreparedStatement인터페이스 타입의 참조변수 pstmt에 
    //SQL문 실행시키는 MySQLPreparedStatementWrapper자식객체 저장
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    
	//실행 -> select -> rs저장
	ResultSet rs = pstmt.executeQuery();
			
		if(rs.next()){
			result = 0;
		}else{
			result = 1;
		}
		
	   if(result == 1){
		   //아이디 사용하기 버튼 추가
		   %>
		   	<p>
			  사용가능한 아이디입니다.<input type="button" value="사용하기" onclick="result();">
		   </p>
		   <% 
		   } else if(result == 0) {
			   out.print("중복된 아이디입니다");
		   } else {
			   out.print("에러 발생");
		   }
   %>
   
  	<!-- 팝업창 구현	 -->	
	<form action="idcheck.jsp" method="post" name="wfr">
	  <input type="text" name="id" value="<%=id%>">
	  <input type="submit" value="중복확인">
	</form>
   
	<!-- 선택된 아이디는 중복확인창에서 회원가입 페이지로 정보전달 -->
	<script>
		function result(){
			//팝업창의 아이디정보를 회원가입창에 아이디정보로 전달
			//팝업창은 기존창과 종속관계를 가지고 있으므로 opener를 이용하면 된다.
			
			//회원가입페이지의 userID값에 아이디중복으로 선택된 id값을 대입
			opener.document.fr.id.value = document.wfr.id.value;
			
			//회원가입창 제어
			opener.document.fr.id.readOnly=true;
			
			//창닫기
			window.close();
		}
	
	</script>   
</body>
</html>