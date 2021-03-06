package com.mobilesalesapp.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mobilesalesapp.dao.ProductDao;
import com.mobilesalesapp.logger.Logger;
import com.mobilesalesapp.model.ProductPojo;
import com.mobilesalesapp.util.ConnectionUtil;

public class ProductImpl implements ProductDao {
	@Override
	public void add(ProductPojo obj) {

		Connection con = ConnectionUtil.connect();

		String query = "insert into products (product_name,description,standard_price,list_price) values(?,?,?,?)";
		PreparedStatement pre = null;
		try {
			pre = con.prepareStatement(query);
			pre.setString(1, obj.getProductName());
			pre.setString(2, obj.getDescription());
			pre.setDouble(3, obj.getStandardCost());
			pre.setDouble(4, obj.getListCost());
			pre.executeUpdate();

		} catch (SQLException e) {
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());

		} finally {
			ConnectionUtil.close(null, pre, con);
		}

	}

	@Override
	public int delete(ProductPojo obj1) {
		Connection con = ConnectionUtil.connect();
		String query = "Delete from products where pk_product_id=?";
		int i = 0;
		PreparedStatement pre = null;
		try {
			pre = con.prepareStatement(query);
			pre.setInt(1, obj1.getId());
			i = pre.executeUpdate();

		} catch (SQLException e) {
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());

		} finally {
			ConnectionUtil.close(null, pre, con);
		}
		return i;

	}

	@Override
	public void update(ProductPojo obj1) {
		String query = "update products set standard_price=?,list_price=? where pk_product_id=?";
		Connection con = ConnectionUtil.connect();
		PreparedStatement pre = null;
		try {
			pre = con.prepareStatement(query);
			pre.setDouble(1, obj1.getStandardCost());
			pre.setDouble(2, obj1.getListCost());
			pre.setInt(3, obj1.getId());
			pre.executeUpdate();

		} catch (SQLException e) {
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());

		} finally {
			ConnectionUtil.close(null, pre, con);
		}

	}

	@Override
	public List<ProductPojo> showAllProduct() {
		StringBuilder query = new StringBuilder();
		query.append("select pk_product_id,product_name,description,standard_price,list_price,url from ");
		query.append("products order by pk_product_id ");

		Connection con = ConnectionUtil.connect();
		List<ProductPojo> productList = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement pre = null;
		try {
			pre = con.prepareStatement(query.toString());
			rs = pre.executeQuery();
			while (rs.next()) {
				ProductPojo productPojo = new ProductPojo(rs.getInt("pk_product_id"), rs.getString("product_name"),
						rs.getString("description"), rs.getDouble("standard_price"), rs.getDouble("list_price"),
						rs.getString("url"));
				productList.add(productPojo);
			}
		} catch (SQLException e) {
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());

		} finally {
			ConnectionUtil.close(rs, pre, con);
		}
		return productList;
	}

	@Override
	public List<ProductPojo> selectProduct(int productId) {
		StringBuilder query = new StringBuilder();
		query.append("select pk_product_id,product_name,description,standard_price,list_price,url from ");
		query.append("products where pk_product_id=?");

		Connection con = ConnectionUtil.connect();
		List<ProductPojo> productList = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement pre = null;
		try {
			pre = con.prepareStatement(query.toString());
			pre.setInt(1, productId);
			rs = pre.executeQuery();
			while (rs.next()) {
				ProductPojo productPojo = new ProductPojo(rs.getInt("pk_product_id"), rs.getString("product_name"),
						rs.getString("description"), rs.getDouble("standard_price"), rs.getDouble("list_price"),
						rs.getString("url"));
				productList.add(productPojo);
			}
		} catch (SQLException e) {
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());

		} finally {
			ConnectionUtil.close(rs, pre, con);
		}
		return productList;
	}

	@Override
	public List<ProductPojo> searchProduct(String product) {
		StringBuilder query = new StringBuilder();
		query.append("select pk_product_id,product_name,description,standard_price,list_price,url from ");
		query.append("products where lower(product_name) like ?");

		Connection con = ConnectionUtil.connect();
		List<ProductPojo> productList = new ArrayList<>();
		PreparedStatement pre = null;
		try {
			pre = con.prepareStatement(query.toString());
			pre.setString(1, product + "%");

			ResultSet rs = pre.executeQuery();
			while (rs.next()) {

				ProductPojo productPojo = new ProductPojo(rs.getInt("pk_product_id"), rs.getString("product_name"),
						rs.getString("description"), rs.getDouble("standard_price"), rs.getDouble("standard_price"),
						rs.getString("url"));
				productList.add(productPojo);
			}
		} catch (SQLException e) {

			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());

		} finally {
			ConnectionUtil.close(null, pre, con);
		}
		return productList;

	}
}
