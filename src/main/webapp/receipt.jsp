<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Receipt</title>
</head>
<jsp:include page="navbar.jsp"></jsp:include>
<body>
<br><br><br><br>
<h1>Order successful</h1>
  <h2>Receipt</h2>
  <!-- Add a download link for the receipt file -->
  <a href="receipt?id=<%= request.getAttribute("oid") %>">Download Receipt</a>
</body>
</html>
