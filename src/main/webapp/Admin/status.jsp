<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:include page="../AdminNav.jsp"></jsp:include>
<body>
<br><br><br><br>
<% String s = (String)request.getAttribute("order");%>
<%if(s!=null) {%>
<h1><%=s %></h1>
<%}else{ %><h1>Update unsuccessful</h1><% }%>
</body>
</html>