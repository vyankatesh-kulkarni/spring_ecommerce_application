package com.vksolutions.ecommerce.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.vksolutions.ecommerce.entity.Category;

public class CategoryDao {
	
	private SessionFactory sessionFactory;
	
	public CategoryDao(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public String saveCategory(String categoryName, String categoryDescription) {
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		Category category = new Category(categoryName,categoryDescription, null);
		session.save(category);
		tx.commit();
		session.close();
		return category.getCategoryName();
	}
	
	
 	// to get all categories from db
	public List<Category> getCategoryList(){
		
		Session session = sessionFactory.openSession();
		Query<Category> query = session.createQuery("from Category");
		
		List<Category> categoryList = query.list();
		return categoryList;
	}

	public Category getCategoryById(int categoryId) {
		Category category = null;
		try {
			Session session = sessionFactory.openSession();
			category = session.get(Category.class, categoryId);
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return category;
	} 
	
}



