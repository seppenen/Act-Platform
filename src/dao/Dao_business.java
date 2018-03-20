package dao;

import java.util.ArrayList;

import model.Company;




public class Dao_business extends dao{
 
public ArrayList<Company> haeCompany() throws Exception{		
	ArrayList<Company> ravintolat = new ArrayList<Company>();
	sql = "SELECT * FROM restaurants ";
	sql+= "WHERE user_id = ? "; 
		
	con=yhdista();
	if(con!=null){ //jos yhteys onnistui
		stmtPrep = con.prepareStatement(sql); 
		stmtPrep.setInt(1, 1);		
			
		rs = stmtPrep.executeQuery();  
		if(rs!=null){ //jos kysely onnistui									
			while(rs.next()){
				Company business = new Company();
				business.setName(rs.getString("business_name"));
				business.setAddress(rs.getString("business_address"));
				business.setHashtag(rs.getString("business_hashtag"));
			
				ravintolat.add(business);
			}					
		}
		con.close();
	}			
	return ravintolat;
}
}
