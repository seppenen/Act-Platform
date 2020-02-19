package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import model.Services;

public class dao {

	public Connection con = null;
	public ResultSet rs = null;
	public PreparedStatement stmtPrep = null;
	public String sql;

	public Connection yhdista() throws Exception {

		String url = "jdbc:mysql://localhost:3306/targo?autoReconnect=true&useSSL=false";

		try {
		
			con = DriverManager.getConnection(url, "root", "");
			return con;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void sulje() throws Exception {
		if (con != null) {
			con.close();
		}
	}

	public void rowDelete(String table, String ehto1, String arvo1, String ehto2, String arvo2) throws Exception {

		sql = "DELETE FROM " + table + " WHERE " + ehto1 + " = ?";

		if (arvo2.length() > 0) {
			sql += " AND " + ehto2 + "=?";
		}

		con = yhdista();
		if (con != null) { // jos yhteys onnistui
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setString(1, arvo1);
			if (arvo2.length() > 0) {
				stmtPrep.setString(2, arvo2);
			}

			stmtPrep.executeUpdate();

			con.close();
		}

	}

	public boolean iftrue(String field, String coulmn, String search, String value1, String ehto,
			String value2) throws Exception {
		boolean paluu = true;
		sql = "SELECT " + field + " FROM " + coulmn + " WHERE " + search + "=?";

		if (value2.length() > 0) {
			sql += " AND " + ehto + "=?";
		}

		try {
			con = yhdista();
			if (con != null) {
				stmtPrep = con.prepareStatement(sql);
				stmtPrep.setString(1, value1);

				if (value2.length() > 0) {
					stmtPrep.setString(2, value2);
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

		return paluu;
	}

	public String haeTiedotJSON(String[] fields, String column, String ehtoSarake, String ehtoArvo, String string)
			throws Exception {
		String returnJSON = "";
		String sarStr = "";
		for (int i = 0; i < fields.length; i++) {
			sarStr += fields[i] + ",";
		}
		sarStr = sarStr.substring(0, sarStr.length() - 1); 
		sql = "SELECT " + sarStr + " FROM " + column;
		if (ehtoSarake.length() > 0) {
			sql += " WHERE " + ehtoSarake + "=?";
		}
		if (string != "") {
			sql += " ORDER BY " + string;
		}

		con = yhdista();
		if (con != null) {
			stmtPrep = con.prepareStatement(sql);
			if (ehtoSarake.length() > 0) {
				stmtPrep.setString(1, ehtoArvo);
			}
			rs = stmtPrep.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			if (rs != null) { 
				int numColumns = rsmd.getColumnCount();
				returnJSON += "[";
				while (rs.next()) {
					returnJSON += "{";
					for (int i = 1; i < numColumns + 1; i++) { 
						returnJSON += "\"";
						returnJSON += rsmd.getColumnName(i);
						returnJSON += "\":";
						returnJSON += "\"";
						try {
							returnJSON += rs.getString(i);
						} catch (Exception e) {
							e.printStackTrace();
						}
						returnJSON += "\"";
						if (i < numColumns) {
							returnJSON += ",";
						}
					}
					returnJSON += "}";
					returnJSON += ",";
				}

				returnJSON += "]";
			}
			con.close();
		}
		
		returnJSON = returnJSON.substring(0, returnJSON.length() - 2) + "]";
		if (returnJSON.length() == 1) {
			returnJSON = "{}";
		}
		return returnJSON;
	}

}
