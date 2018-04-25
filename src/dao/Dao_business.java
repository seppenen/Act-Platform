package dao;

import java.sql.Statement;
import java.util.ArrayList;

import model.Company;





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

				
			}					
		}
		con.close();
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
	
	sql="UPDATE business SET name=?, alias=?, phone=?, business_address=?, lat=?, lng=?, description=? WHERE business_id=?";
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


public boolean lisaaTunnit(Company company){
	boolean paluuArvo=true;		
	sql="INSERT INTO hours (start, end, day, business_id) VALUES(?,?,?,?);";						  
	try {
		con = yhdista();
		stmtPrep=con.prepareStatement(sql); 
		
		stmtPrep.setString(1, company.getOpentime());
		stmtPrep.setString(2, company.getClosetime());
		stmtPrep.setString(3, company.getDay());
		stmtPrep.setString(4, company.getId());
				
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
