<%@page import="com.vksolutions.ecommerce.helper.FactoryProvider"%>
<html>
<head>
<title>Ecommerce WebSite</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<h2>Hello World!</h2>
<h2> creating session factory</h2>

	<%
		out.println(FactoryProvider.getFactory() + "<br>");
		out.println(FactoryProvider.getFactory() + "<br>");
		out.println(FactoryProvider.getFactory() + "<br>");
	
	%>
</body>
</html>
