<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
<%@include file="components/common_css_js.jsp" %>
<%@include file="components/navbar.jsp" %>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header">
						<h3>Login here !</h3>
					</div>
					<div class="card-body">
						<form action="LoginServlet" method="post">
						  <div class="mb-3">
						    <label for="exampleInputEmail1" class="form-label">Email address</label>
						    <input type="email" name="useremail" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
						    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
						  </div>
						  <div class="mb-3">
						    <label for="exampleInputPassword1" class="form-label">Password</label>
						    <input type="password" name ="userpassword" class="form-control" id="exampleInputPassword1">
						  </div>
						  
						  <button type="submit" class="btn btn-success custom-bg text-dark">Submit</button>
						   <button type="reset" class="btn btn-warning ">Reset</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	
	</div>

</body>
</html>