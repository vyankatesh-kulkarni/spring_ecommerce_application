package com.vksolutions.ecommerce.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="product_id")
	private int productId;
	
	@Column(name="product_name")
	private String productName;
	
	@Column(name="product_description")
	private String productDescription;
	
	@Column(name="product_photo")
	private String productPhoto;
	
	@Column(name="product_price")
	private int productPrice;
	
	@Column(name="product_quantity")
	private int productQuantity;
	
	@ManyToOne
	private Category category;

	public Product(String productName, String productDescription, String productPhoto, int productPrice,
			int productQuantity, Category category) {
		super();
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPhoto = productPhoto;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
		this.category = category;
	}
	
	
}
