package dao;

import java.util.ArrayList;

import model.Services;

public class Dao_service extends dao{
	
	public boolean newService(Services service) {
		boolean paluuArvo = true;
		System.out.println(service.getTitle());
		sql = "INSERT INTO business_service (business_id, title, price, service_desc, timefrom, timeto, days, hours, owner) VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setInt(1, service.getBusiness_id());
			stmtPrep.setString(2, service.getTitle());
			stmtPrep.setString(3, service.getPrice());
			stmtPrep.setString(4, service.getDescription());
			stmtPrep.setString(5, service.getFrom());
			stmtPrep.setString(6, service.getTo());
			stmtPrep.setString(7, service.getDays());
			stmtPrep.setString(8, service.getHours());
			stmtPrep.setString(9, service.getOwner());

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
