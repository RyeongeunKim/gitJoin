package Pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

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
		System.out.println("������ ����� �����ϼ���.");
		System.out.println("1.insert 2.read 3.update 4.delete");
		Scanner sc = new Scanner(System.in);
		int num = sc.nextInt();

		PreparedStatement pstmt = null;
		
		
		switch (num) {
		case 1:
			String name = "insert into table01 values('ȣ����', 10, 2000);";

			try {
				pstmt = connection.prepareStatement(name);
				pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case 2:
			String name1 = "select * from table01;";
			try {
				pstmt = connection.prepareStatement(name1);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					System.out.print(rs.getString("fullName"));
//					System.out.println("");
					System.out.print(rs.getString("Age"));
					System.out.print(rs.getString("Salary"));
					System.out.println("");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case 3:
			String name2 = "update table01 table01 set salary = 9999 where Fullname='ȣ����';";
			try {
				pstmt = connection.prepareStatement(name2);
				pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case 4:
			String name3 = "delete from  table01 where Fullname = '�ڳ���'; ";
			try {
				pstmt = connection.prepareStatement(name3);
				pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;

		default:
			System.out.println("�ٽ� ������ �ּ���.");
			break;
		}
	}
}
