package com.vksolutions.ecommerce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vksolutions.ecommerce.dao.CategoryDao;
import com.vksolutions.ecommerce.helper.FactoryProvider;

/**
 * Servlet implementation class CategoryServlet
 */
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			PrintWriter out = response.getWriter();
			String categoryName = request.getParameter("categoryName");
			String categoryDescription = request.getParameter("categoryDescription");
			
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
			
			String catName = categoryDao.saveCategory(categoryName,categoryDescription);
			
			String message = "category " + categoryName + " saved successfully !!";
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", message);
			
			response.sendRedirect("admin.jsp");
			
			return;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
