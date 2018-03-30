package dao;

import model.Services;

public class Dao_service extends dao{
	
	public boolean newService(Services service) {
		boolean paluuArvo = true;
		System.out.println(service.getTitle());
		sql = "INSERT INTO business_service(business_id, picture, title, price,service_desc,tags) VALUES(?,?,?,?,?,?)";
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
}
