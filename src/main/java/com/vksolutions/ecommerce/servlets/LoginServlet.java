package com.vksolutions.ecommerce.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vksolutions.ecommerce.dao.UserDao;
import com.vksolutions.ecommerce.entity.User;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	
    public LoginServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userEmail = request.getParameter("useremail");
		String userPassword = request.getParameter("userpassword");
		
		//now we need to authenticate the user
		User user = UserDao.getUserDetails(userEmail,userPassword);
		
	}

}
