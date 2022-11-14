package com.vksolutions.ecommerce.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.vksolutions.ecommerce.dao.CategoryDao;
import com.vksolutions.ecommerce.dao.ProductDao;
import com.vksolutions.ecommerce.entity.Category;
import com.vksolutions.ecommerce.entity.Product;
import com.vksolutions.ecommerce.helper.FactoryProvider;

/**
 * Servlet implementation class ProductServlet
 */
@MultipartConfig
public class ProductServlet extends HttpServlet {
    public ProductServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			
			String productName = request.getParameter("productName");

			String productDescription = request.getParameter("productDescription");
			int productPrice =Integer.parseInt(request.getParameter("productPrice").trim());	//productPrice
			int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
			Part part = (Part) request.getPart("productPhoto");
			int categoryId = Integer.parseInt(request.getParameter("categoryId"));
			CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
			
			Category category = catDao.getCategoryById(categoryId);
			
			Product product = new Product();
			product.setProductName(productName);
			product.setProductDescription(productDescription);
			product.setProductPrice(productPrice);
			product.setProductQuantity(productQuantity);
			product.setCategory(category);
			product.setProductPhoto(part.getSubmittedFileName());
			
			String path = request.getRealPath("img")+File.separator+"products" + File.separator  + part.getSubmittedFileName();
			
			System.out.println("path => " + path);
			 
			ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
			
			
			//uploading file on server
			// output stream is used to save file
			FileOutputStream fos = new FileOutputStream(path);
			
			// get input stream from part
			InputStream is = part.getInputStream();
			
			// reading data
			byte[] data = new byte[is.available()];
			
			// read data
			is.read(data);
			
			// wrting the data
			fos.write(data);
			
			fos.close();
			is.close();
			
			boolean result = pDao.saveProuct(product);
			
			HttpSession httpSession = request.getSession();
			
			String message;
			if(result == true) {
				message = "Product saved successfully";
			}
			else {
				message = "failed to save product";
			}
			
			httpSession.setAttribute("message", message);
			response.sendRedirect("admin.jsp");
			return;
			
		
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
