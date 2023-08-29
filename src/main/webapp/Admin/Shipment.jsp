<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<jsp:include page="../AdminNav.jsp"></jsp:include>
<body style="background-color: white;">
<br><br><br><br>
<%@ page import="java.util.*" %>

<% List<String> data = (List<String>) request.getAttribute("del"); %>
<center><h1>Order Status</h1>
<form class="form-inline" style="width:fit-content;" action="adminships">

  <div class="form-group mx-sm-3 mb-2">
    
    <input type="number" class="form-control" id="inputPassword2" placeholder="Order Id" name="orderid">
  </div>
  <button type="submit" class="btn btn-primary mb-2">Submit</button>
</form></center>
<% if (data != null && !data.isEmpty()) { %>
  <!-- Your code to display data from the 'data' list -->
<form action="adminupdate?id=<%=data.get(0) %>">
  <div class="row">
    <div class="col-md-3">
      <input type="text" class="form-control" value="<%=data.get(0)%>" name="id"  readonly>
    </div>
    <div class="col-md-3">
      <input type="text" class="form-control" value="<%=data.get(1) %>" readonly>
    </div>
                         <div class="form-group col-md-3">
    <select class="form-control" id="inputState" name="update" onchange="summary()">
      <option value="SelectState"><%=data.get(2) %></option>
    <%if(data.get(2).equals("shipped")){ %>
                        <option value="hub">hub</option>
                        <%}else if(data.get(2).equals("placed")){ %>
                        <option value="shipped">shipped</option>
                        <%}else if(data.get(2).equals("hub")) {%>
                         <option value="delivered">delivered</option>
                         <%}else{ %>
                         <option value="Delivered" disabled="disabled">Already Delivered</option>
                         <%} %>
                      </select>
         
                     
  </div>
                 <div class="col-md-3">
   <button type="submit" class="btn btn-primary mb-2">Submit</button>
    </div>
    
  </div>
</form>
<% }%>

</body>
</html>