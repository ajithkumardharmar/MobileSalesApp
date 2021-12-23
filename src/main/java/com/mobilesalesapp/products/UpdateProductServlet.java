package com.mobilesalesapp.products;

import java.io.IOException;

import com.mobilesalesapp.impl.ProductImpl;
import com.mobilesalesapp.model.ProductPojo;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("update");
		int productId =Integer.parseInt(req.getParameter("updateId"));
		System.out.println(productId);
		double standardPrice =Double.parseDouble(req.getParameter("updateStandardPrice"));
		double listPrice =Double.parseDouble(req.getParameter("updateListPrice"));
		System.out.println(standardPrice+" "+listPrice);
		
		ProductPojo obj1=new ProductPojo(productId,standardPrice,listPrice);
		ProductImpl obj2=new ProductImpl();
		obj2.update(obj1);
		try {
			HttpSession session =req.getSession();
			session.setAttribute("updateInfo", "updated Successfully");
			res.sendRedirect("ProductList.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
}
