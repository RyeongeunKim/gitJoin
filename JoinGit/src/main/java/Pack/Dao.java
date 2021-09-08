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
		String url = "jdbc:mysql://localhost:3306/db01?serverTimezone=UTC"; // database �̸����� db01�� ?server���� �������ֱ�.
		String user = "root";
		String password = "Password@";
		String driverName = "com.mysql.jdbc.Driver";

		try {
			// �� �ε�(īī�� �ýÿ� `com.mysql.cj.jdbc.Driver` ��� ���� �ý� ����̹��� ���)
			// ������ �����ڴ� ������ `com.mysql.cj.jdbc.Driver`�� �ٷ� ���� ����.
			// ���������� JDBC�� �˾Ƽ� �� ���ֱ� ������ �츮�� JDBC�� DriverManager �� ���ؼ� DB���� ������ ������ �ȴ�.
			Class.forName(driverName);

			// �� ����
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("�Ϸ�");
		} catch (ClassNotFoundException e) {
			// `com.mysql.cj.jdbc.Driver` ��� Ŭ������ ���̺귯���� �߰����� �ʾҴٸ� �����߻�
			e.printStackTrace();
		} catch (SQLException e) {
			// DB���������� Ʋ�ȴٸ� �����߻�
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
