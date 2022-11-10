package com.vksolutions.ecommerce.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.vksolutions.ecommerce.entity.Product;

public class ProductDao {
private SessionFactory sessionFactory;
	
	public ProductDao(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean saveProuct(Product product) {
		try {
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			
			session.save(product);
			tx.commit();
			session.close();
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
