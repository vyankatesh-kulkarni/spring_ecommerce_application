package com.vksolutions.ecommerce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vksolutions.ecommerce.dao.UserDao;
import com.vksolutions.ecommerce.entity.User;
import com.vksolutions.ecommerce.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	
    public LoginServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			PrintWriter out = response.getWriter();
			
			String userEmail = request.getParameter("useremail");
			String userPassword = request.getParameter("userpassword");
			 
			//now we need to authenticate the user
			UserDao userdao = new UserDao(FactoryProvider.getFactory());
			User user = userdao.getUserDetails(userEmail,userPassword);
			
			HttpSession httpSession = request.getSession();
			if(user == null) {
				String message = "Please enter valid credentials !";
				httpSession.setAttribute("message", message);
				response.sendRedirect("login.jsp");
			}
			else {
				//create session for user
				httpSession.setAttribute("currentUser", user);
				response.sendRedirect("user-home.jsp");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
