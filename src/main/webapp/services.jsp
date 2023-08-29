<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
   <%
				String uid = (String)session.getAttribute("loginstatus");
				if (uid == null)
				{
		%>
                    <jsp:forward page="login.jsp"></jsp:forward>>
              <%	
				}
				else
				{
					%>
					
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:include page="navbar.jsp"></jsp:include>
<body>
<div class="col-md-12 justify-content-center">
    <div class="card card-custom pb-4">
      <div class="card-body mt-0 mx-5">
        <div class="text-center mb-3 pb-2 mt-3">
          <h4 style="color: #495057 ;">Delivery Details</h4>
        </div>

<div class="row">
  <div class="col-md-8 mb-4">
    <div class="card mb-4">
      <div class="card-header py-3">
        <h5 class="mb-0">Biling details</h5>
      </div>
      <div class="card-body">
        <form action="service">
          <!-- 2 column grid layout with text inputs for the first and last names -->
          <div class="row mb-4">
            <div class="col">
              <div class="form-outline">
                <input type="text" id="fname" class="form-control" onchange="summery()" name="fname"/>
                <label class="form-label" for="form7Example1">First name</label>
              </div>
            </div>
            <div class="col">
              <div class="form-outline">
                <input type="text" id="lname" class="form-control" onchange="summery()" name="lname"/>
                <label class="form-label" for="form7Example2">Last name</label>
              </div>
            </div>
          </div>
             <div class="row mb-4">
            <div class="col">
              <div class="form-outline">
                <div class="form-group col-md-11">
    <select class="form-control" id="inputState" name="pickup">
                        <option value="SelectState">Select City</option>
                        <option value="	Visakhapatnam">	Visakhapatnam	</option>
                        <option value="	Vijayawada">	Vijayawada</option>
                        <option value="Guntur">Guntur</option>
                        <option value="	Nellore">	Nellore</option>
                        <option value="	Kurnool">	Kurnool</option>
                        <option value="	Kakinada">	Kakinada</option>
                        <option value="	Rajahmundry">	Rajahmundry</option>
                        <option value="Kadapa">	Kadapa</option>
                        <option value="Mangalagiri">Mangalagiri</option>
                        <option value="Tirupati">Tirupati</option>
                        <option value="Anantapuram">Anantapuram</option>
                        <option value="Vizianagaram">Vizianagaram</option>
                        <option value="	Eluru">	Eluru</option>
                        <option value="Nandyal">Nandyal</option>
                        <option value="Ongole">Ongole</option>
                        <option value="Adoni">Adoni</option>
                        <option value="	Madanapalle">Madanapalle</option>
                        <option value="Machilipatnam">Machilipatnam</option>
                        <option value="Tenali">Tenali</option>
                        <option value="Proddatur">Proddatur</option>
                    
                      </select>
  </div>
                <label class="form-label" for="form7Example1">pick up</label>
              </div>
            </div>
            <div class="col">
              <div class="form-outline">
                          <div class="form-group col-md-11">
    <select class="form-control" id="inputState" name="droploc" onchange="summary()">
                        <option value="SelectState">Select City</option>
                        <option value="	Visakhapatnam">	Visakhapatnam	</option>
                        <option value="	Vijayawada">	Vijayawada</option>
                        <option value="Guntur">Guntur</option>
                        <option value="	Nellore">	Nellore</option>
                        <option value="	Kurnool">	Kurnool</option>
                        <option value="	Kakinada">	Kakinada</option>
                        <option value="	Rajahmundry">	Rajahmundry</option>
                        <option value="Kadapa">	Kadapa</option>
                        <option value="Mangalagiri">Mangalagiri</option>
                        <option value="Tirupati">Tirupati</option>
                        <option value="Anantapuram">Anantapuram</option>
                        <option value="Vizianagaram">Vizianagaram</option>
                        <option value="	Eluru">	Eluru</option>
                        <option value="Nandyal">Nandyal</option>
                        <option value="Ongole">Ongole</option>
                        <option value="Adoni">Adoni</option>
                        <option value="	Madanapalle">Madanapalle</option>
                        <option value="Machilipatnam">Machilipatnam</option>
                        <option value="Tenali">Tenali</option>
                        <option value="Proddatur">Proddatur</option>
                        
                      </select>
  </div>
                <label class="form-label" for="form7Example2">Drop</label>
              </div>
            </div>
          </div>
                    <div class="row mb-4">
            <div class="col">
              <div class="form-outline">
                <input type="text" id="weight" class="form-control" onchange="myFunction()" name="weight"/>
                <label class="form-label" for="form7Example1">Weight</label>
              </div>
            </div>
         
          </div>

          <!-- Text input -->
          <div class="form-outline mb-4">
            <input type="text" id="content" class="form-control" onchange="summery()" name="coparcel"/>
            <label class="form-label" for="form7Example3">Content of Parcel</label>
          </div>
          
          <!-- Text input -->
          <div class="form-outline mb-4">
            <input type="text" id="address" class="form-control" onchange="summery()" name="address"/>
            <label class="form-label" for="form7Example4">Address</label>
          </div>

          <!-- Email input -->
          <div class="form-outline mb-4">
            <input type="email" id="email" class="form-control" onchange="summery()" name="email" value="<%=session.getAttribute("loginstatus")%>" readonly/>
            <label class="form-label" for="form7Example5">Email</label>
          </div>

          <!-- Number input -->
          <div class="form-outline mb-4">
            <input type="number" id="phno" class="form-control" onchange="summery()" name="phnum"/>
            <label class="form-label" for="form7Example6">Phone</label>
          </div>
<p id="price" name="price" ></p>
          <!-- Message input -->
          <div class="form-outline mb-4">
            <textarea class="form-control" id="form7Example7" rows="4" name="addinfo"></textarea>
            <label class="form-label" for="form7Example7">Additional information</label>
          </div>
           
             <input type="submit" class="btn btn-primary btn-lg btn-block">
          
        
</form>
          <!-- Checkbox -->
       
        
      </div>
    </div>
  </div>

  <div class="col-md-4 mb-4">
    <div class="card mb-4">
      <div class="card-header py-3">
        <h5 class="mb-0">Summary</h5>
      </div>
      <div class="card-body">
        <ul class="list-group list-group-flush">
          <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
            Name:
            <span id="name"></span>
          </li> 
          <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
            Content of Parcel:
            <span id="parcel"></span>
          </li> 
          <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
            Email:
            <span id="em"></span>
          </li> 
          <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
            Phone Number:
            <span id="phnum"></span>
          </li> 
          <li class="list-group-item d-flex justify-content-between align-items-center px-0">
            Shipping:
            <span id="addrs"></span>
          </li>
          <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
            <div>
              <strong>Total amount</strong>
              <strong>
                <p class="mb-0">(including VAT)</p>
              </strong>
            </div>
            
            <span>&#8377<strong id="prise"></strong></span>
          </li>
        </ul>

     
        
      </div>
    </div>
  </div>
</div>
      </div>
    </div>
  </div>
<script type="text/javascript">
function myFunction() {
     var x= parseInt(document.getElementById("weight").value);
     var p =x*50
 	document.getElementById("prise").innerHTML = p;
     document.getElementById("prise1").innerHTML = p;
}
function summery()
{
    var fname= document.getElementById("fname").value;
    var lname =document.getElementById("lname").value;
    var con =document.getElementById("content").value;
    var email =document.getElementById("email").value;
    var pn =document.getElementById("phno").value;
    var addr =document.getElementById("address").value;
	document.getElementById("name").innerHTML = fname.concat(lname);
	document.getElementById("parcel").innerHTML = con;
	document.getElementById("em").innerHTML = email;
	document.getElementById("phnum").innerHTML = pn;
	document.getElementById("addrs").innerHTML = addr;
}
</script>


</body>
</html>
			
				<%}
		%>
