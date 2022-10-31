<%@page import="com.vksolutions.ecommerce.test.FactoryProvider"%>
<html>
<body>
<h2>Hello World!</h2>
<h2> creating session factory</h2>

	<%
		out.println(FactoryProvider.getFactory() + "<br>");
		out.println(FactoryProvider.getFactory() + "<br>");
		out.println(FactoryProvider.getFactory() + "<br>");
	
	%>
</body>
</html>
