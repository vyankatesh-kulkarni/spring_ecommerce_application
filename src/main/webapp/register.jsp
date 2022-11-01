<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign up page</title>
<%@include file="components/common_css_js.jsp" %>
</head>

<body>
<%@include file="components/navbar.jsp" %>
	<div class="container-fluid">
				
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<form>
				  <div class="mb-3">
				    <label for="username" class="form-label">Name</label>
				    <input type="text" class="form-control" id="username" aria-describedby="emailHelp">
				  </div>
				  
				   <div class="mb-3">
				    <label for="useremail" class="form-label">Email</label>
				    <input type="email" class="form-control" id="useremail" aria-describedby="emailHelp">
				     <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
				  </div>
				  
				  <div class="mb-3">
				    <label for="userPassword" class="form-label">Password</label>
				    <input type="password" class="form-control" id="userPassword" />
				  </div>
				  
				   <div class="mb-3">
				    <label for="userPhone" class="form-label">Mobile</label>
				    <input type="text" class="form-control" id="userPhone" />
				  </div>
				  
				  <div class="mb-3">
				    <label for="userAddress" class="form-label">Address</label>
				    <input type="text" class="form-control" id="userAddress" />
				  </div>
				 
				  <div class="mb-3 form-check">
				    <input type="checkbox" class="form-check-input" id="exampleCheck1">
				    <label class="form-check-label" for="exampleCheck1">Check me out</label>
				  </div>
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
				
	</div>

</body>
</html>