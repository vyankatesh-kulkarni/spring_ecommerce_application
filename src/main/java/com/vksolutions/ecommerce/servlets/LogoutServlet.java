package com.vksolutions.ecommerce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			try {
				PrintWriter out = response.getWriter();
				
				HttpSession httpSession = request.getSession();
				httpSession.removeAttribute("currentUser");
				
				String message = "log out successful !";
				httpSession.setAttribute("message", message);
				
				response.sendRedirect("login.jsp");
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	

}
