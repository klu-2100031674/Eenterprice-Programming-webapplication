<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="exam">
Item_Id=<input name="itemid" type="number"/>
<br>
Item_Name=<input name="itemname" type="text"/>
<br>
Buyer_Price = <input name="buyerprice" type="text"/>
<br>
Seller_Price = <input name="sellerprice" type="text"/>
<br>
Date_of_Expiry=<input name="expiry" type="datetime"/>
<br>
No_Stocks_Avail =<input name="nostock" type="number"/>
<br>
<input type="submit" value="submit"/>
</form>
<h1><%=request.getAttribute("p") %></h1>
<form action="deleteexp">
Expery_Date = <input type="datetime" name="date"/>
<input type="submit" value="Submit">
</form>

</body>
</html>