package com.mobilesalesapp.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mobilesalesapp.dao.ProductDao;
import com.mobilesalesapp.impl.ProductImpl;
import com.mobilesalesapp.logger.Logger;
import com.mobilesalesapp.model.ProductPojo;

@WebServlet("/addproduct")
public class AddProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		String productName = req.getParameter("product_name");
		String description = req.getParameter("description");

		try {
			double standardCost = Double.parseDouble(req.getParameter("standard_cost"));
			double listPrice = Double.parseDouble(req.getParameter("list_price"));
			ProductPojo obj = new ProductPojo(productName, description, standardCost, (listPrice));
			ProductDao obj2 = new ProductImpl();

			obj2.add(obj);
		} catch (NumberFormatException e) {
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}

		try {
			ProductDao product = new ProductImpl();
			List<ProductPojo> viewProducts = product.showAllProduct();
			req.setAttribute("viewProducts", viewProducts);
			RequestDispatcher rd = req.getRequestDispatcher("productList.jsp");
			rd.forward(req, res);
		} catch (IOException | ServletException e) {
			Logger.printStackTrace(e);
			Logger.runTimeException(e.getMessage());
		}

	}
}
