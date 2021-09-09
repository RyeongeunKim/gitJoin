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
     ="insert into regitable values (?,?,?,?,?,?)";
     
     //부모 PreparedStatement인터페이스 타입의 참조변수 pstmt에 
     //SQL문 실행시키는 MySQLPreparedStatementWrapper자식객체 저장
     PreparedStatement pstmt = conn.prepareStatement(sql);
     
     //  ?
     pstmt.setString(1, dto.getId());
     pstmt.setString(2, dto.getPass());
     pstmt.setString(3, dto.getName());
     pstmt.setString(4, dto.getTel());
     pstmt.setString(5, dto.getEmail());
     pstmt.setString(6, dto.getGender());
     
     // 4 sql 실행 
     pstmt.executeUpdate();
     
     System.out.println("회원 가입 성공! ");
     
     /////////////////////////////////////////////////////////////
     
     // 로그인페이지로 이동 (loginForm.jsp)
     // 자바스크립트 사용 이동
   %>
   
   <script type="text/javascript">
     alert(" 회원가입 성공! ");
     location.href="index.jsp";   
   </script>   
</body>
</html>