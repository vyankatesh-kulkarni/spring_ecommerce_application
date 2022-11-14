package com.vksolutions.ecommerce.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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
	
	public List<Product> getAllProducts(){
		
			Session session = sessionFactory.openSession();
			
			Query theQuery = session.createQuery("from Product");
			
			List<Product> productList = theQuery.list();
			
			return productList;
	}
}
