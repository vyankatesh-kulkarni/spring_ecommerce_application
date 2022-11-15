<%@page import="com.vksolutions.ecommerce.helper.FactoryProvider"%>
<%@page import="com.vksolutions.ecommerce.dao.ProductDao"%>
<%@page import="com.vksolutions.ecommerce.dao.CategoryDao"%>
<%@page import="com.vksolutions.ecommerce.entity.Product"%>
<%@page import="com.vksolutions.ecommerce.entity.Category"%>

<%@page import="java.util.*"%>
<html>
<head>
<title>Ecommerce WebSite</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>

<div class="container-fluid">
	
	<div class="row mt-3 mx-2">
		
		<%
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> categoryList = categoryDao.getCategoryList();
		%>
		
		<!--shwoing categoies -->
		<div class="col-md-2">
			<div class="list-group"> 
				  <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
				    All Categories
				  </a>
				  
			<!-- loop over products -->
			<% 
				for(Category category:categoryList){		
			%>
					<a href="index.jsp?category=<%=category.getCategoryId() %>" class="list-group-item list-group-item-action"><%= category.getCategoryName() %></a>
					
			<%
				}
			
			%>
			
			</div>
		</div>
		
		
		
		
		
		<!-- show products -->
		<%	
		   
		    		
			//String categoryId = request.getParameter("category").trim();
			
			//out.println(categoryId);
			
			ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
			List<Product> productList = null;
			
			 if(request.getParameterMap().containsKey("category")){
				 String categoryId = request.getParameter("category").trim();
				 Integer catId = Integer.parseInt(categoryId);
				 productList = productDao.getAllProductsById(catId);
			 }
			
			else { 
				productList = productDao.getAllProducts();
			}
		%>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-12">
					<div class="card-columns">
						
						<!-- Traverse products -->
						<%
							for(Product product:productList){
						%>
						
						<div class="card">
						<img class="card-img-top" style="max-height:290px" src="img/products/<%=product.getProductPhoto() %>" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title"><%= product.getProductName()  %></h5>
						    
						    <%
						    	String shortDesc = product.getProductDescription();
						    	String[] arr =  shortDesc.split(" ");
						    	
						    	if(arr.length > 10){
						    		shortDesc ="";
						    		for(int i=0;i<9;i++){
						    			shortDesc += arr[i] + " ";
						    		}
						    		shortDesc += "...";
						    	}
						    %>
						    <p class="card-text"><%= shortDesc %></p>
						    
						     <h5 class="card-title">Rs. <%= product.getProductPrice()  %> /-</h5>
						     
						    <a href="#" class="btn btn-primary">Add to cart</a>
						    <a href="#" class="btn btn-primary">oder now</a>
						  </div>
						</div>
						
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
		
		
		
	</div>
	
</div>
	
</body>
</html>
