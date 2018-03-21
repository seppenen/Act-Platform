package dao;

import java.util.ArrayList;

import model.Company;




public class Dao_business extends dao{
 
public Company haeCompany(String id) throws Exception{		
	Company company = new Company();
	sql = "SELECT * FROM business ";
	sql+= "WHERE business_id = ? "; 
		
	con=yhdista();
	if(con!=null){ //jos yhteys onnistui
		stmtPrep = con.prepareStatement(sql); 
		stmtPrep.setString(1, id);		
			
		rs = stmtPrep.executeQuery();  
		if(rs!=null){ //jos kysely onnistui									
			while(rs.next()){
				company.setId(rs.getString("business_id"));
				company.setName(rs.getString("business_name"));
				company.setAddress(rs.getString("business_address"));
				company.setOpentime(rs.getString("opentime"));	
				company.setClosetime(rs.getString("closetime"));
				company.setDescription(rs.getString("description"));

		
				
			}					
		}
		con.close();
	}			
	return company;
}
}
