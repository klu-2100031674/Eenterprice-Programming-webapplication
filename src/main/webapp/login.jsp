<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/login.css" />
</head>
<body>
<div class="container">
    <div class="cover">
      <div class="front">
        <img src="images/login.jpg" alt="" />
      </div>
    </div>
     <div class="wrapper">
         <div class="title-text">
            <div class="title login">
               Login Form
            </div>
         </div>
         <div class="form-container">
           
            <div class="form-inner">
               <form action="login" class="login">   <% if(request.getAttribute("status")==null){%><%}else{ %>
           <label>
               <input type="checkbox" class="alertCheckbox" autocomplete="off" />
  <div class="alert error">
    <span class="alertClose">X</span>
    <span class="alertText"><%=request.getAttribute("status") %>
    <br class="clear"/></span>
  </div>
</label> 
 
               <%} %>
                  <div class="field">
                     <input type="text" placeholder="Email Address" name="email" required />
                  </div>
                  <div class="field">
                     <input  type="password" placeholder="Password" name="pass" required />
                  </div>
                  <div class="pass-link">
                     <a href="#">Forgot password?</a>
                  </div>
                  <div class="field btn">
                     <div class="btn-layer"></div>
                    <input type="submit"  value="Login" />
                  </div>
                  <div class="signup-link">
                     Not a member? <a href="Register.jsp" >click here</a>
                  </div>
               </form>
             
            </div>
         </div>
      </div>
    
      </div>
</body>
</html>