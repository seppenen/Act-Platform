package dao;

import java.util.ArrayList;


import model.Order;



public class Dao_order extends dao{

	public ArrayList<Order> haeTilaukset(String hakusana) throws Exception{	
		ArrayList<Order> tilaukset = new ArrayList<Order>();
		sql = "SELECT * FROM orders WHERE business_id=?"; 		
		con=yhdista();
		if(con!=null){ 
			stmtPrep = con.prepareStatement(sql); 
			stmtPrep.setString(1, hakusana);
			
    		rs = stmtPrep.executeQuery();  
			if(rs!=null){ //jos kysely onnistui									
				while(rs.next()){
					Order tilaus = new Order();
					tilaus.setId(rs.getString("id"));
					tilaus.setService_id(rs.getString("service_id"));
					tilaus.setStart(rs.getString("start"));
					tilaus.setEnd(rs.getString("end"));
					tilaus.setTitle(rs.getString("title"));
					tilaus.setUser_id(rs.getString("user_id"));
					tilaus.setStatus(rs.getString("status"));
					tilaukset.add(tilaus);
				}					
			}
			con.close();
		}			
		return tilaukset;
	}
	
	public boolean uusiTulaus(Order order) {
		boolean paluuArvo = true;
		
		sql = "INSERT INTO orders (user_id, service_id, business_id, title, time, date, status) VALUES(?,?,?,?,?,?,?)";
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql);
			stmtPrep.setString(1, order.getUser_id());
			stmtPrep.setString(2, order.getService_id());
			stmtPrep.setString(3, order.getBusiness_id());
			stmtPrep.setString(4, order.getTitle());
			stmtPrep.setString(5, order.getStart());
			stmtPrep.setString(6, order.getEnd());
			stmtPrep.setString(7, order.getStatus());

			stmtPrep.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			paluuArvo = false;
		}
		return paluuArvo;
	}
}