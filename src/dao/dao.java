package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import model.Services;

public class dao {

	public  Connection con = null;
	public  ResultSet rs = null;
	public  PreparedStatement stmtPrep = null;
	public  String sql;

	public  Connection yhdista() throws Exception {

		String url = "jdbc:mysql://localhost:3306/targo?autoReconnect=true&useSSL=false";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "phbzrtht");
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
	
	public void  rowDelete(String row, String id) throws Exception{		
		
		sql = "DELETE FROM " +row+" WHERE temp = ? AND user_id=?"; 		
		con=yhdista();
		if(con!=null){ //jos yhteys onnistui
			stmtPrep = con.prepareStatement(sql); 
			stmtPrep.setString(1, "1");
			stmtPrep.setString(2, id);
			
			stmtPrep.executeUpdate();
			
			con.close();
		}
			
	}
	



	public boolean iftrue(String sarake, String taulu, String hakusarake, String hakuarvo1, String ehto,
			String hakuarvo2) throws Exception {
		boolean paluu = true;
		sql = "SELECT " + sarake + " FROM " + taulu + " WHERE " + hakusarake + "=?";

		if (hakuarvo2.length() > 0) {
			sql += " AND " + ehto + "=?";
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

				if (!rs.next()) {
					paluu = false;
				}
				con.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("boolean" + " " + paluu);
		return paluu;
	}

	public  String haeTiedotJSON(String[] sarakkeet, String taulu, String ehtoSarake, String ehtoArvo, String string)
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
		if (string!="") {
			sql += " ORDER BY " + string;
		}
System.out.println(sql);
		con = yhdista();
		if (con != null) { 
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
