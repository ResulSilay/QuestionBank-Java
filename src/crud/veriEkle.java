package crud;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class veriEkle {

	private Connection con;
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/qbdb";//?characterEncoding=ISO-8859-9
	private Statement stm;
	private ResultSet resultSet = null;

	public veriEkle() {
		try {
			Class.forName(driver).newInstance();
			System.out.println("JDBC surucu basari ile yüklendi.");
		} catch (Exception e) {
			System.out.println("JDBC surucu Yuklenemedi. Hata:" + e.getMessage());
			System.exit(0);
		}

		try {
			con = DriverManager.getConnection(url, "root", "root");
			System.out.println("baglandi");
		} catch (Exception e) {
			System.out.println("Veri Taban. Hata:" + e.getMessage());

		}
		try {
			stm = con.createStatement();
		} catch (Exception e) {
			System.out.println("Hata:" + e.getMessage());

		}
	}

	public ResultSet selectAllData() {
		try {
			String query = "SELECT * FROM kullanicilar";
			resultSet = stm.executeQuery(query);
		} catch (Exception e) {
			System.out.println("Hata:" + e.getMessage());
		}
		return resultSet;

	}

}