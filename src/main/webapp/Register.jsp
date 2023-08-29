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

<br><br><br><br><br><br><br><br><br>
   <div class="container">
    <div class="cover">
      <div class="front">
        <img src="images/login.jpg" alt="" />
      </div>
    </div>
     <div class="wrapper">
         <div class="title-text">
            <div class="title login">
               SignUp Form
            </div>
         </div> 
         <div class="form-container">
           
            <div class="form-inner">
               <form class="login" action="regs">
                 <% if(request.getAttribute("status")==null){%><%}else{ %>
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
                     <input  type="text" placeholder="First Name" name="fname" required>
                  </div>
                  <div class="field">
                     <input  type="text" placeholder="Last Name" name="lname" required>
                  </div>
                    <div class="field">
                     <input  type="email" placeholder="Email" name="email" required />
                  </div>
                   <div class="field">
                     <input  type="number" placeholder="Mobile" required />
                  </div>
                    <div class="field">
                      <input type="password" class="input-field" placeholder="create a password"id="psw" name="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
       
                  
                  </div>
                  <div class="field btn">
                     <div class="btn-layer"></div>
                     <input  type="submit" value="Submit" />
                  </div>
                  
                  <div class="signup-link">
                     Already a member? <a href="login.jsp">click here</a>
                  </div>
                  <div class="signup-link">
                     Admin Registration? <a href="Admin.jsp">click here</a>
                  </div>
                  <div id="message">
                <p id="letter" class="invalid">A lowercase letter</p>
                <p id="capital" class="invalid">A capital (uppercase) letter</p>
                <p id="number" class="invalid">A number</p>
                <p id="length" class="invalid">Minimum 8 characters</b></p>
              </div>
               </form>
            </div>
         </div>
      </div>
    
      </div>
      <script>
    var myInput = document.getElementById("psw");
    var letter = document.getElementById("letter");
    var capital = document.getElementById("capital");
    var number = document.getElementById("number");
    var length = document.getElementById("length");
    
    // When the user clicks on the password field, show the message box
    myInput.onfocus = function() {
      document.getElementById("message").style.display = "block";
    }
    
    // When the user clicks outside of the password field, hide the message box
    myInput.onblur = function() {
      document.getElementById("message").style.display = "none";
    }
    
    // When the user starts to type something inside the password field
    myInput.onkeyup = function() {
      // Validate lowercase letters
      var lowerCaseLetters = /[a-z]/g;
      if(myInput.value.match(lowerCaseLetters)) {
        letter.classList.remove("invalid");
        letter.classList.add("valid");
      } else {
        letter.classList.remove("valid");
        letter.classList.add("invalid");
    }
    
      // Validate capital letters
      var upperCaseLetters = /[A-Z]/g;
      if(myInput.value.match(upperCaseLetters)) {
        capital.classList.remove("invalid");
        capital.classList.add("valid");
      } else {
        capital.classList.remove("valid");
        capital.classList.add("invalid");
      }
    
      // Validate numbers
      var numbers = /[0-9]/g;
      if(myInput.value.match(numbers)) {
        number.classList.remove("invalid");
        number.classList.add("valid");
      } else {
        number.classList.remove("valid");
        number.classList.add("invalid");
      }
    
      // Validate length
      if(myInput.value.length >= 8) {
        length.classList.remove("invalid");
        length.classList.add("valid");
      } else {
        length.classList.remove("valid");
        length.classList.add("invalid");
      }
    }
    $().alert('close')

    </script>
</body>
</html>