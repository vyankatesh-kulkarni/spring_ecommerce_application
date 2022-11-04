<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
			<div class = "col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style = "max-width:125px" class = "img-fluid" src="img/plus.png"  alt="users-icon" />
						</div>
						<h3>Add product</h3>
					</div>
				</div>
			</div>
			
			<div class = "col-md-6">
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
	
	
	
</body>
</html>