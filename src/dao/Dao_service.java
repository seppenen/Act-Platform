package dao;

import java.util.ArrayList;


import model.Services;
import model.User;

public class Dao_service extends dao{
	
	public Services haeService(String id) {

		Services service = new Services();
		
		sql = "SELECT * FROM business_service WHERE service_id = ?";
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setString(1, id);
			
			rs = stmtPrep.executeQuery();
			
			if(rs!=null){ 								
				while(rs.next()){
					service.setId(rs.getString("service_id"));
					service.setTitle(rs.getString("title"));
					service.setPrice(rs.getString("price"));
					service.setDescription(rs.getString("service_desc"));
					service.setBusiness_id(rs.getString("business_id"));
					service.setOwner(rs.getString("owner"));
					service.setImage(rs.getString("picture"));
					service.setHour(rs.getString("hour"));
				
				}
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return service;
		
	}
	
	
	public boolean updateService(Services service) {
		boolean paluuArvo = true;
		
		sql="UPDATE business_service SET title=?, price=?, service_desc=?, picture=?, hour=?  WHERE service_id=?";
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setString(1, service.getTitle());
			stmtPrep.setString(2, service.getPrice());
			stmtPrep.setString(3, service.getDescription());
			stmtPrep.setString(4, service.getImage());
			stmtPrep.setString(5, service.getHour());
			stmtPrep.setString(6, service.getId());

			stmtPrep.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			paluuArvo = false;
		}
		return paluuArvo;
	}
	public void poistaKuva(String id) throws Exception{		
		sql="UPDATE business_service SET picture=? WHERE service_id=?"; 		
		con=yhdista();
		if(con!=null){ //jos yhteys onnistui
			stmtPrep = con.prepareStatement(sql); 
			stmtPrep.setString(1, "");	
			stmtPrep.setString(2, id);
			stmtPrep.executeUpdate();			
			con.close();
		}		
	}
	
	public boolean newService(Services service) {
		boolean paluuArvo = true;
		
		sql = "INSERT INTO business_service (business_id, title, price, service_desc, owner, picture, hour) VALUES (?,?,?,?,?,?,?)";
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setString(1, service.getBusiness_id());
			stmtPrep.setString(2, service.getTitle());
			stmtPrep.setString(3, service.getPrice());
			stmtPrep.setString(4, service.getDescription());
			stmtPrep.setString(5, service.getOwner());
			stmtPrep.setString(6, service.getImage());
			stmtPrep.setString(6, service.getHour());

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
				service.setBusiness_id(rs.getString("business_id"));
				service.setId(rs.getString("service_id"));
				service.setTitle(rs.getString("title"));
				service.setPrice(rs.getString("price"));
				service.setDescription(rs.getString("service_desc"));
				service.setImage(rs.getString("picture"));
				service.setFrom(rs.getString("timefrom"));
				service.setTo(rs.getString("timeto"));
				service.setDays(rs.getString("days"));
				;
				
				list.add(service);
				}
				}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}
	
	public boolean lisaaTunnit(Services service){
		boolean paluuArvo=true;		
		sql="INSERT INTO hours_service (start, end, day, service_id) VALUES(?,?,?,?);";						  
		try {
			con = yhdista();
			stmtPrep=con.prepareStatement(sql); 
			
			stmtPrep.setString(1, service.getFrom());
			stmtPrep.setString(2, service.getTo());
			stmtPrep.setString(3, service.getDays());
			stmtPrep.setString(4, service.getId());
					
			stmtPrep.executeUpdate();
	        con.close();
		} catch (Exception e) {				
			e.printStackTrace();
			paluuArvo=false;
		}				
		return paluuArvo;
	}



	public boolean poistaTunti(String id) throws Exception{		
		boolean ok=false;
		sql = "DELETE FROM hours_service WHERE id = ?"; 		
		con=yhdista();
		if(con!=null){ //jos yhteys onnistui
			stmtPrep = con.prepareStatement(sql); 
			stmtPrep.setString(1, id);			
			stmtPrep.executeUpdate();
			ok=true;
			con.close();
		}
		return ok;		
	}
	
}
