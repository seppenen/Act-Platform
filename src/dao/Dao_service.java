package dao;

import java.util.ArrayList;

import model.Services;

public class Dao_service extends dao{
	
	
	
	
	public boolean newService(Services service) {
		boolean paluuArvo = true;
		System.out.println(service.getTitle());
		sql = "INSERT INTO business_service (business_id, title, price, service_desc, timefrom, timeto, days, hours, owner, picture) VALUES (?,?,?,?,?,?,?,?,?,?)";
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
			stmtPrep.setString(9, service.getHours());
			stmtPrep.setString(10, service.getImage());

			stmtPrep.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			paluuArvo = false;
		}
		return paluuArvo;
	}
	
	public ArrayList<Services> haeServices(String id) {
		ArrayList <Services> list = new ArrayList<Services>();

		sql = "SELECT * FROM business_service WHERE owner = ?";
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setString(1, id);
			rs = stmtPrep.executeQuery();
			if(rs!=null){ 								
				while(rs.next()){
				
					Services service = new Services();
				service.setBusiness_id(rs.getInt("business_id"));
				service.setService_id(rs.getInt("service_id"));
				service.setTitle(rs.getString("title"));
				service.setPrice(rs.getString("price"));
				service.setDescription(rs.getString("service_desc"));
				service.setImage(rs.getString("picture"));
				service.setFrom(rs.getString("timefrom"));
				service.setTo(rs.getString("timeto"));
				service.setDays(rs.getString("days"));
				service.setHours(rs.getString("hours"));
				
				list.add(service);
				}
				}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}
	
}
