<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/trackorder.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">

</head>
<body>
<%@ page import="java.util.*" %>
 <%
        List<String> data = (List<String>) request.getAttribute("data");

 if(data == null){
	 out.print("There is no records on this orderid");
 }
 else{
    %>
    <style>
    <%if(data.get(4).equals("shipped")){%>
    .track .step::before {
	height: 7px;
	position: absolute;
	content: "";
	width: 100%;
	left: 0;
	top: 18px
}

    .track .step1::before {
	height: 7px;
	position: absolute;
	content: "";
	width: 100%;
	left: 0;
	top: 18px
	
}
<%} if(data.get(4).equals("placed")){%>


.track .step::before {
	height: 7px;
	position: absolute;
	content: "";
	width: 100%;
	left: 0;
	top: 18px
}
<%} if(data.get(4).equals("hub")){%>
  .track .step::before {
	height: 7px;
	position: absolute;
	content: "";
	width: 100%;
	left: 0;
	top: 18px
}

    .track .step1::before {
	height: 7px;
	position: absolute;
	content: "";
	width: 100%;
	left: 0;
	top: 18px
	
}

    .track .step2::before {
	height: 7px;
	position: absolute;
	content: "";
	width: 100%;
	left: 0;
	top: 18px
	
}
<%} if(data.get(4).equals("delivered")){
%>
  .track .step::before {
	height: 7px;
	position: absolute;
	content: "";
	width: 100%;
	left: 0;
	top: 18px
}

    .track .step1::before {
	height: 7px;
	position: absolute;
	content: "";
	width: 100%;
	left: 0;
	top: 18px
	
}

    .track .step2::before {
	height: 7px;
	position: absolute;
	content: "";
	width: 100%;
	left: 0;
	top: 18px
	
}
  .track .step3::before {
	height: 7px;
	position: absolute;
	content: "";
	width: 100%;
	left: 0;
	top: 18px
	
}
<%}%>
    </style>
    <div class="container">
    <article class="card">
        <header class="card-header"> My Orders / Tracking </header>
        <div class="card-body">
            <h6>Order ID: OD45345345435</h6>
            <article class="card">
                <div class="card-body row">
                    <div class="col"> <strong>Estimated Delivery time:</strong> <br>18 july 2023 </div>
                    <div class="col"> <strong>Shipping BY:</strong> <br> FEDCOM, | <i class="fa fa-phone"></i> +123456789 </div>
                    <div class="col"> <strong>Status:</strong> <br> Picked by the courier </div>
                    <div class="col"> <strong>Tracking #:</strong> <br> FEDCOM <%=data.get(5) %> </div>
                </div>
            </article>
            <div class="track">
                <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Placed</span> </div>
                <div class="step1 active"> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text"> shipped</span> </div>
                <div class="step2 active"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> out for delivery </span> </div>
                <div class="step3 active"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">Delivered</span> </div>
            </div>
            <hr>
            
            <hr>
            <a href="home.jsp" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Back to Home</a>
        </div>
    </article>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<%} %>
</body>
</html>