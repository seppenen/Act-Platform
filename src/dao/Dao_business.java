package dao;

import java.sql.Statement;
import java.util.ArrayList;

import model.Company;
import model.Hour;
import model.Services;
import model.User;





public class Dao_business extends dao{
 
public Company haeCompany(String id) throws Exception{		
	Company company = new Company();
	sql = "SELECT * FROM business ";
	sql+= "WHERE business_id=? "; 
	
		
	con=yhdista();
	if(con!=null){ //jos yhteys onnistui
		stmtPrep = con.prepareStatement(sql); 
		stmtPrep.setString(1, id);
		
			
		rs = stmtPrep.executeQuery();  
		if(rs!=null){ //jos kysely onnistui									
			while(rs.next()){
				company.setId(rs.getString("business_id"));
				company.setName(rs.getString("business_name"));
				company.setLat(rs.getString("lat"));
				company.setLng(rs.getString("lng"));
				company.setAlias(rs.getString("alias"));
				company.setPhone(rs.getString("phone"));
				company.setAddress(rs.getString("business_address"));			
				company.setDescription(rs.getString("description"));
				company.setOwner(rs.getString("user_id"));

				
			}					
		}
		con.close();
	}			
	return company;
}

public Company newCompanyID(User user, Company company) {
	
	
	sql = "INSERT INTO business (user_id, temp) VALUES (?,?)";
	try {
		con = yhdista();
		stmtPrep = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		stmtPrep.setString(1, user.getId());
		stmtPrep.setString(2, "1");

		stmtPrep.executeUpdate();
		rs=stmtPrep.getGeneratedKeys();
		
		if (rs.next()) {
			String id = rs.getString(1);
			company.setId(id);
			
		}
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
		
	}
	return company;

}
public boolean newCompany(Company Company) {
	boolean paluuArvo = true;
	
	sql = "INSERT INTO business(user_id, business_name, business_address, lat, lng, description, alias, phone) VALUES(?,?,?,?,?,?,?,?)";
	try {
		con = yhdista();
		stmtPrep = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		stmtPrep.setString(1, Company.getOwner());
		stmtPrep.setString(2, Company.getName());
		stmtPrep.setString(3, Company.getAddress());
		stmtPrep.setString(4, Company.getLat());
		stmtPrep.setString(5, Company.getLng());
		stmtPrep.setString(6, Company.getDescription());
		stmtPrep.setString(7, Company.getAlias());
		stmtPrep.setString(8, Company.getPhone());

		stmtPrep.executeUpdate();
		rs=stmtPrep.getGeneratedKeys();
		
		if (rs.next()) {
			String id = rs.getString(1);
			Company.setId(id);
		}
		
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
		paluuArvo = false;
	}
	return paluuArvo;
}

public boolean updateCompany(Company Company) {
	boolean paluuArvo = true;
	
	sql="UPDATE business SET business_name=?, business_address=?, lat=?, lng=?, description=?, alias=?, phone=?,temp= ? WHERE business_id=?";
	try {
		con = yhdista();
		stmtPrep = con.prepareStatement(sql);
		stmtPrep.setString(1, Company.getName());
		stmtPrep.setString(2, Company.getAddress());
		stmtPrep.setString(3, Company.getLat());
		stmtPrep.setString(4, Company.getLng());
		stmtPrep.setString(5, Company.getDescription());
		stmtPrep.setString(6, Company.getAlias());
		stmtPrep.setString(7, Company.getPhone());
		stmtPrep.setString(8, "0");
		stmtPrep.setString(9, Company.getId());
		stmtPrep.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
		paluuArvo = false;
	}
	return paluuArvo;
}


public boolean lisaaTunnit(Company company, Hour hour, String temp){
	boolean paluuArvo=true;		
	sql="INSERT INTO hours (start, end, day, business_id, temp, user_id) VALUES(?,?,?,?,?,?);";						  
	try {
		con = yhdista();
		stmtPrep = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); 
		
		stmtPrep.setString(1, company.getOpentime());
		stmtPrep.setString(2, company.getClosetime());
		stmtPrep.setString(3, company.getDay());
		stmtPrep.setString(4, company.getId());
		stmtPrep.setString(5, temp);
		stmtPrep.setString(6, company.getOwner());
				
		stmtPrep.executeUpdate();
		rs=stmtPrep.getGeneratedKeys();
		
		if (rs.next()) {
			String id = rs.getString(1);
			hour.setId(id);
		}
        con.close();
	} catch (Exception e) {				
		e.printStackTrace();
		paluuArvo=false;
	}				
	return paluuArvo;
}

public boolean vahvistaTunnit(Company company) {
	boolean paluuArvo = true;
	
	sql="UPDATE hours SET temp=?  WHERE business_id=?";
	try {
		con = yhdista();
		stmtPrep = con.prepareStatement(sql);
		stmtPrep.setString(1, "0");
		stmtPrep.setString(2, company.getId());

		stmtPrep.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
		paluuArvo = false;
	}
	return paluuArvo;
}

public boolean poistaTunti(String id) throws Exception{		
	boolean ok=false;
	sql = "DELETE FROM hours WHERE id = ?"; 		
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
