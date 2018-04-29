package dao;

import java.util.ArrayList;

import model.Hour;


public class Dao_hour extends dao {

	public ArrayList<Hour> haeTunnit(String id) {
		ArrayList <Hour> list = new ArrayList<Hour>();

		sql = "SELECT * FROM hours_service WHERE service_id = ?";
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setString(1, id);
			rs = stmtPrep.executeQuery();
			if(rs!=null){ 								
				while(rs.next()){
				
					Hour hour = new Hour();
				hour.setId(rs.getString("business_id"));
							
				list.add(hour);
				}
				}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}
	
}
