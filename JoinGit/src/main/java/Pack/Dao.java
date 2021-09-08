package Pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Dao {
	public static void main(String[] args) {
		DBConnection dbconn = new DBConnection();

		dbconn.connect();
	}
}

class DBConnection {
	Connection connection;

	public void connect() {
		String url = "jdbc:mysql://localhost:3306/db01?serverTimezone=UTC"; // database 이름으로 db01로 ?server전에 수정해주기.
		String user = "root";
		String password = "Password@";
		String driverName = "com.mysql.jdbc.Driver";

		try {
			// ① 로드(카카오 택시에 `com.mysql.cj.jdbc.Driver` 라는 실제 택시 드라이버를 등록)
			// 하지만 개발자는 실제로 `com.mysql.cj.jdbc.Driver`를 다룰 일은 없다.
			// 내부적으로 JDBC가 알아서 다 해주기 때문에 우리는 JDBC의 DriverManager 를 통해서 DB와의 연결을 얻으면 된다.
			Class.forName(driverName);

			// ② 연결
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("완료");
		} catch (ClassNotFoundException e) {
			// `com.mysql.cj.jdbc.Driver` 라는 클래스가 라이브러리로 추가되지 않았다면 오류발생
			e.printStackTrace();
		} catch (SQLException e) {
			// DB접속정보가 틀렸다면 오류발생
			e.printStackTrace();
		}
			PreparedStatement pstmt = null;
		
			String name1 = "select * from table01;";
			try {
				pstmt = connection.prepareStatement(name1);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					System.out.print(rs.getString("fullName"));
					System.out.print(rs.getString("Age"));
					System.out.print(rs.getString("Salary"));
					System.out.println("");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}
