package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import model.Company;
import model.Services;
import model.User;


public class dao {

	public Connection con = null;
	public ResultSet rs = null;
	public PreparedStatement stmtPrep = null;
	public String sql;

	public Connection yhdista() throws Exception {

		String url = "jdbc:sqlite:/Users/alexandrseppenen/Apache/targo.sqlite";

		try {

			Class.forName("org.sqlite.JDBC");
			con = DriverManager.getConnection(url);
			System.out.println("DB OK!");
			return con;

		} catch (SQLException e) {

			throw new RuntimeException(e);

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);

		}
	}

	public void sulje() throws Exception {
		if (con != null) {
			con.close();
		}
	}

	public boolean newService(Services service) {
		boolean paluuArvo = true;
		System.out.println(service.getTitle());
		sql = "INSERT INTO business_service(business_id, kuva_id, title, price,service_desc,tags) VALUES(?,?,?,?,?,?)";
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setInt(1, service.getBusiness_id());
			stmtPrep.setInt(2, 1);
			stmtPrep.setString(3, service.getTitle());
			stmtPrep.setInt(4, service.getPrice());
			stmtPrep.setString(5, service.getDescription());
			stmtPrep.setString(6, service.getTag());

			stmtPrep.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			paluuArvo = false;
		}
		return paluuArvo;
	}
	public boolean newCompany(Company Company) {
		boolean paluuArvo = true;
		System.out.println(Company.getName());
		sql = "INSERT INTO business(user_id, business_name, business_address, lat, lng) VALUES(?,?,?,?,?)";
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setString(1, Company.getOwner());
			stmtPrep.setString(2, Company.getName());
			stmtPrep.setString(3, Company.getAddress());
			stmtPrep.setString(4, Company.getLat());
			stmtPrep.setString(5, Company.getLng());

			stmtPrep.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			paluuArvo = false;
		}
		return paluuArvo;
	}

	public boolean dataCheck(String sarake, String taulu, String hakusarake, String hakuarvo1, String ehto,
			String hakuarvo2) throws Exception {
		boolean paluu = true;
		sql = "SELECT " + sarake + " FROM " + taulu + " WHERE " + hakusarake + "=?";
		if (hakuarvo2.length() > 0) {
			sql += " and " +ehto+ "=?";
		}
		try {
			con = yhdista();
			if (con != null) { 
				stmtPrep = con.prepareStatement(sql);
				stmtPrep.setString(1, hakuarvo1);
				if (hakuarvo2.length() > 0) {
					stmtPrep.setString(2, hakuarvo2);
				}
				rs = stmtPrep.executeQuery();
				if (rs != null) { 
					if (!rs.next())
						paluu = false;
				}		
				con.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("boolean" + " "+paluu);
		return paluu;
		
	}

	public User loginData(String username) {

		User user= new User();
		sql = "SELECT * FROM users WHERE username = ?";
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setString(1, username);
			rs = stmtPrep.executeQuery();

			while (rs.next()) {
				user.setId(rs.getInt("user_id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setStatus(rs.getInt("status"));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return user;
	}


	public String haeTiedotJSON(String[] sarakkeet, String taulu, String ehtoSarake, String ehtoArvo, int sort)
			throws Exception {
		String palautusJSON = "";
		String sarStr = "";
		for (int i = 0; i < sarakkeet.length; i++) {
			sarStr += sarakkeet[i] + ",";
		}
		sarStr = sarStr.substring(0, sarStr.length() - 1); // poistetaan viimeinen pilkku
		sql = "SELECT " + sarStr + " FROM " + taulu;
		if (ehtoSarake.length() > 0) {
			sql += " WHERE " + ehtoSarake + "=?";
		}
		if (sort > 0) {
			sql += " ORDER BY " + sort;
		}
		System.out.println(sql);
		con = yhdista();
		if (con != null) { // jos yhteys onnistui
			stmtPrep = con.prepareStatement(sql);
			if (ehtoSarake.length() > 0) {
				stmtPrep.setString(1, ehtoArvo);
			}
			rs = stmtPrep.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			if (rs != null) { // jos kysely onnistui
				int numColumns = rsmd.getColumnCount();
				palautusJSON += "[";
				while (rs.next()) {// Kдydддn tietueet lдpi
					palautusJSON += "{";
					for (int i = 1; i < numColumns + 1; i++) {// Kдydддn sarakkeet lдpi
						palautusJSON += "\"";
						palautusJSON += rsmd.getColumnName(i);
						palautusJSON += "\":";
						palautusJSON += "\"";
						try {
							palautusJSON += rs.getString(i);
						} catch (Exception e) {
							e.printStackTrace();
						}
						palautusJSON += "\"";
						if (i < numColumns) {
							palautusJSON += ",";
						}
					}
					palautusJSON += "}";
					palautusJSON += ",";
				}
				palautusJSON += "]";
			}
			con.close();
		}
		// Siivotaan viimeinen pilkku pois
		palautusJSON = palautusJSON.substring(0, palautusJSON.length() - 2) + "]";
		if (palautusJSON.length() == 1) {
			palautusJSON = "{}";
		}
		return palautusJSON;
	}

}