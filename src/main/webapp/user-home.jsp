<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.vksolutions.ecommerce.entity.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
		User user = (User)session.getAttribute("currentUser"); 
		if(user == null){
			String message = "Please first login !";
			session.setAttribute("message",message);
			response.sendRedirect("login.jsp");
			return;
		}
		String userName = user.getUserName();
%>
<%@include file="components/common_css_js.jsp" %>
<%@include file="components/navbar.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>	
		<h2> Welcome to site <%= userName %>	</h2>
</body>
</html>