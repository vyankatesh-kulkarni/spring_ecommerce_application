package com.vksolutions.ecommerce.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="category_id")
	private int categoryId;
	
	@Column(name="category_name")
	private String categoryName;
	
	@Column(name="category_description")
	private String categoryDescription;
	
	@OneToMany(mappedBy="category")
	private List<Product> productList = new ArrayList();

	public Category(String categoryName, String categoryDescription, List<Product> productList) {
		super();
		this.categoryName = categoryName;
		this.categoryDescription = categoryDescription;
		this.productList = productList;
	}
	
	
}
