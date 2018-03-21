package dao;

import java.util.ArrayList;

import model.Company;




public class Dao_business extends dao{
 
public ArrayList<Company> haeCompany(int id) throws Exception{		
	ArrayList<Company> companies = new ArrayList<Company>();
	sql = "SELECT * FROM business ";
	sql+= "WHERE user_id = ? "; 
		
	con=yhdista();
	if(con!=null){ //jos yhteys onnistui
		stmtPrep = con.prepareStatement(sql); 
		stmtPrep.setInt(1, id);		
			
		rs = stmtPrep.executeQuery();  
		if(rs!=null){ //jos kysely onnistui									
			while(rs.next()){
				Company company = new Company();
				company.setName(rs.getString("business_name"));
				company.setAddress(rs.getString("business_address"));
				company.setHashtag(rs.getString("business_hashtag"));
			
				companies.add(company);
			}					
		}
		con.close();
	}			
	return companies;
}
}
