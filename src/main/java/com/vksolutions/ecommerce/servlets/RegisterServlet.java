package com.vksolutions.ecommerce.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.vksolutions.ecommerce.entity.User;
import com.vksolutions.ecommerce.helper.FactoryProvider;


public class RegisterServlet extends HttpServlet {
	public RegisterServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		
		try {
			String userName = request.getParameter("username");
			String userEmail = request.getParameter("useremail");
			String userPassword = request.getParameter("userpassword");
			String userPhone = request.getParameter("userphone");
			String userAddress = request.getParameter("useraddress");
			
			//creating user object
			User user = new User(userName, userEmail, userPassword, userPhone, "default.jpj", userAddress, "user");
			
			Session session = FactoryProvider.getFactory().openSession();
			
			Transaction transaction = session.beginTransaction();
			
			int userId = (Integer)session.save(user);
			
			transaction.commit();
		 	session.close();
			
			
		 	HttpSession httpSession = request.getSession();
		 	httpSession.setAttribute("message", "User is saved successfully" + userName);
		 	
		 	response.sendRedirect("register.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
