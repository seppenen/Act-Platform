package dao;

import model.User;

public class Dao_user extends dao {

	public User haeAsiakas(String email, String password) {

		User user= null;
		
		sql = "SELECT * FROM users WHERE email = ? AND password=?";
		
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setString(1, email);
			stmtPrep.setString(2, password);
			rs = stmtPrep.executeQuery();	
		
		
			if(rs!=null){ 								
				while(rs.next()){
				user= new User();
				user.setId(rs.getString("user_id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				
				user.setStatus(rs.getInt("status"));
				}
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return user;
	}
	
	public User haeAsiakas(String id) {

		User user= new User();
		sql = "SELECT * FROM users WHERE username = ?";
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setString(1, id);
			
			rs = stmtPrep.executeQuery();
			
			if(rs!=null){ 								
				while(rs.next()){
		
				user.setId(rs.getString("user_id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setStatus(rs.getInt("status"));
				}
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return user;
	}
}
