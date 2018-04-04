package dao;

import java.util.ArrayList;

import model.Services;

public class Dao_service extends dao{
	
	public boolean newService(Services service) {
		boolean paluuArvo = true;
		System.out.println(service.getTitle());
		sql = "SELECT * FROM business_service WHERE email = ?";
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
	
	public ArrayList haeServices(String id) {
		ArrayList palvelut =null;
		
		sql = "SELECT * FROM business_service WHERE id = ?";
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setString(1, id);
			rs = stmtPrep.executeQuery();
			if(rs!=null){ 								
				while(rs.next()){
				
				palvelut.add(rs.getInt("service_id"));
				
				}
				}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return palvelut;
	}
	
}
