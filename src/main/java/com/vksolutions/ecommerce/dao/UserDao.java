package com.vksolutions.ecommerce.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.vksolutions.ecommerce.entity.User;

public class UserDao {
	
	private SessionFactory sessionFactory;
	
	public UserDao(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public User getUserDetails(String userEmail, String userPassword) {
		User theUser = null;
		try {
			Session session = sessionFactory.openSession();
			
			Query<User> theQuery = session.createQuery("from User where userEmail=:theEmail and userPassword =: thePassword");
			
			theQuery.setParameter("theEmail", userEmail);
			theQuery.setParameter("thePassword", userPassword);
			
			theUser = (User)theQuery.uniqueResult();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return theUser;
	}

}
