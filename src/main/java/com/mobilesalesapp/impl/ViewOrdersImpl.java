package com.mobilesalesapp.impl;

import com.mobilesalesapp.connection.ConnectionPro;
import com.mobilesalesapp.model.OrderPojo;

import jakarta.servlet.http.HttpSession;

import java.sql.*;


public class ViewOrdersImpl {
	public  ResultSet viewAllOrders(OrderPojo orderPojo) {
		
		Connection con=ConnectionPro.connect();
		String query="select order_id,status,price,order_date,address "
				+ "from orders_table where fk_user_id=?";
		ResultSet rs=null;
		try {
			System.out.println(orderPojo.getUserId());
			PreparedStatement pre=con.prepareStatement(query);
			pre.setInt(1, orderPojo.getUserId());
			 rs=pre.executeQuery();
			 System.out.println(rs);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.getMessage();
		}
		return rs;
	}

}
