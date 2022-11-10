<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.vksolutions.ecommerce.entity.Category" %>    
<%@ page import="com.vksolutions.ecommerce.dao.CategoryDao" %>
<%@ page import="com.vksolutions.ecommerce.helper.FactoryProvider" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<% 
		User user2 = (User)session.getAttribute("currentUser"); 
		if(user2 == null){
			String message = "Please first login !";
			session.setAttribute("message",message);
			response.sendRedirect("login.jsp");
			return;
		}
		String userName = user2.getUserName();
%>
<%@include file="components/navbar.jsp" %>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
	<%@include file="message.jsp" %>
	<div class="container admin">
		<div class = "row mt-4">
			<!-- coloumns -->
			<div class="col-md-4">
			
				<div class="card test">
					<div class="card-body text-center">
						<div class="container">
							<img style = "max-width:125px" class = "img-fluid" src="img/man.png"  alt="users-icon" />
						</div>
						<h3>4113</h3>
						<h3>Users</h3>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style = "max-width:125px" class = "img-fluid" src="img/app.png"  alt="categories-icon" />
						</div>
						<h3>713</h3>
						<h3>Catrgories</h3>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style = "max-width:125px" class = "img-fluid" src="img/products.png"  alt="products-icon" />
						</div>
						<h3>663113</h3>
						<h3>Products</h3>
					</div>
				</div>
			</div>
			
		</div>
		<div class = "row mt-4">
			<div class = "col-md-6" data-bs-toggle="modal" data-bs-target="#add-product-modal">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style = "max-width:125px" class = "img-fluid" src="img/plus.png"  alt="users-icon" />
						</div>
						<h3>Add product</h3>
					</div>
				</div>
			</div>
			
			<div class = "col-md-6" data-bs-toggle="modal" data-bs-target="#add-category-modal">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style = "max-width:125px" class = "img-fluid" src="img/add.png"  alt="users-icon" />
						</div>
						<h3>Add category</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Add category modal -->
	<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header custom-bg">
        <h5 class="modal-title" id="exampleModalLabel">Add category here</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="CategoryServlet" method="post">
        	<div class="form-group">
        		<input class="form-control" name="categoryName" placeholder="Enter category name" required />
        	</div>
        	
        	<div class="form-group mt-2">
        		<textarea style="height:100px" class="form-control" name="categoryDescription" placeholder="Enter category description" required></textarea>
        	</div>
        	<div class="mt-4">
	        	<button class="btn btn-outline-success">
	        		Save category
	        	</button>
	        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>
	
	<!-- End category modal -->
	
	
	
	
	<!-- Add product modal -->
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog ">
	    <div class="modal-content">
	      <div class="modal-header custom-bg">
	        <h5 class="modal-title" id="exampleModalLabel">Add Product here</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="ProductServlet" method="post">
	        	<div class="form-group">
	        		<input class="form-control" name="productName" placeholder="Enter product name" required />
	        	</div>
	        	
	        	<div class="form-group mt-2">
	        		<input style="height:75px" class="form-control" name="productDescription" placeholder="Enter product description" required />
	        	</div>
	        		        	
	        	<div class="form-group mt-2">
        			<input  class="form-control" name="productPrice" placeholder="Enter category price" required/>
        		</div>
        	
        	<div class="form-group mt-2">
        		<input class="form-control" name="productQuantity" placeholder="Enter category quantity" required>
        	</div>
        	
        	
			<!-- first create scriplet tag to get all categories -->
			<%
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				List<Category> categoryList = categoryDao.getCategoryList();
			%>        	
        	<div class="form-group mt-2">
	        		<select name="categoryId" class="form-control">
	        			<%
	        				for(Category category:categoryList){
	        			%>
	        			<option value="<%= category.getCategoryId()%>"><%= category.getCategoryName() %></option>
	        			
	        			<%
	        				}
	        			%>
	        		</select>
	        </div>
        	
        	<div class="form-group mt-2">
	        		<input type = "file" class="form-control" name="productPhoto" placeholder="Enter category photo" required />
	        </div>
	        	
	        	<div class="mt-4">
		        	<button class="btn btn-outline-success">
		        		Save Product
		        	</button>
		        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        	</div>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- end product modal -->
</body>
</html>





