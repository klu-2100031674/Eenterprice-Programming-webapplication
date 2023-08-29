<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/home.css" />
   <link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" href="css/responsive.css">
     
</head>
<jsp:include page="navbar.jsp"></jsp:include>
<body>
 <section class="banner_main">
         <div id="banner1" class="carousel slide banner_slide" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#banner1" data-slide-to="0" class="active"></li>
               <li data-target="#banner1" data-slide-to="1"></li>
               <li data-target="#banner1" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container-fluid">
                     <div class="carousel-caption">
                        <div class="row">
                           <div class="col-md-7 col-lg-5">
                              <div class="text-bg" >
                                 <h1 >Best Courier Company</h1>
                                 <span>Contrary to popular belief, Lorem Ipsum is not simply random text. It has i</span>
                                 <a class="read_more" href="contact.jsp">Contact Us</a>
                              </div>
                           </div>
                           <div class="col-md-12 col-lg-7">
                              <div class="row">
                                 <div class="col-md-6">
                                    <div class="ban_track">
                                       <figure><img src="images/track.png" alt="#"/></figure>
                                    </div>
                                 </div>
                                 <div class="col-md-6">
                                    <form class="transfot" action="track">
                                       <div class="col-md-12">
                                          <span>Professional Services</span>
                                          <h3>Track Your Parcel</h3>
                                       </div>
                                       <div class="col-md-12">
                                          
                                       </div>
                                       <div class="col-md-12">
                                        
                                       </div>
                                       <div class="col-md-12">
                                       
                                       </div>
                                       <div class="col-md-12">
                                          <input class="transfot_form" placeholder="Order Id" type="text" name="orderid">
                                       </div>
                                       <div class="col-md-12">
                                          <input type="submit" value="Track" class="get_now"/>
                                       </div>
                                    </form>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container-fluid">
                     <div class="carousel-caption">
                        <div class="row">
                           <div class="col-md-7 col-lg-5">
                              <div class="text-bg">
                                 <h1>Best Logistic Company</h1>
                                 <span>Contrary to popular belief, Lorem Ipsum is not simply random text. It has i</span>
                                 <a class="read_more" href="#">Contact Us</a>
                              </div>
                           </div>
                           <div class="col-md-12 col-lg-7">
                              <div class="row">
                                 <div class="col-md-6">
                                    <div class="ban_track">
                                       <figure><img src="images/track.png" alt="#"/></figure>
                                    </div>
                                 </div>
                                 <div class="col-md-6">
                                    <form class="transfot">
                                       <div class="col-md-12">
                                          <span>Professional Services</span>
                                          <h3>Track Your Parcel</h3>
                                       </div>
                                       <div class="col-md-12">
                                          
                                       </div>
                                       <div class="col-md-12">
                                        
                                       </div>
                                       <div class="col-md-12">
                                       
                                       </div>
                                       <div class="col-md-12">
                                          <input class="transfot_form" placeholder="Order Id" type="text" name="Order Id">
                                       </div>
                                       <div class="col-md-12">
                                          <button class="get_now">Track</button>
                                       </div>
                                    </form>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container-fluid">
                     <div class="carousel-caption">
                        <div class="row">
                           <div class="col-md-7 col-lg-5">
                              <div class="text-bg">
                                 <h1>Best Logistic Company</h1>
                                 <span>Contrary to popular belief, Lorem Ipsum is not simply random text. It has i</span>
                                 <a class="read_more" href="#">Contact Us</a>
                              </div>
                           </div>
                           <div class="col-md-12 col-lg-7">
                              <div class="row">
                                 <div class="col-md-6">
                                    <div class="ban_track">
                                       <figure><img src="images/track.png" alt="#"/></figure>
                                    </div>
                                 </div>
                                 <div class="col-md-6">
                                    <form class="transfot">
                                       <div class="col-md-12">
                                          <span>Professional Services</span>
                                          <h3>Track Your Parcel</h3>
                                       </div>
                                       <div class="col-md-12">
                                          
                                       </div>
                                       <div class="col-md-12">
                                        
                                       </div>
                                       <div class="col-md-12">
                                       
                                       </div>
                                       <div class="col-md-12">
                                          <input class="transfot_form" placeholder="Order Id" type="text" name="Order Id">
                                       </div>
                                       <div class="col-md-12">
                                          <button class="get_now">Track</button>
                                       </div>
                                    </form>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a class="carousel-control-prev" href="#banner1" role="button" data-slide="prev">
            <i class="fa fa-angle-left" aria-hidden="true"></i>
            </a>
            <a class="carousel-control-next" href="#banner1" role="button" data-slide="next">
            <i class="fa fa-angle-right" aria-hidden="true"></i>
            </a>
         </div>
      </section>
      <!-- end banner -->
      
      <!-- service section -->
      <div id="service" class="service">
         <div class="container">
            <div class="row">
               <div class="col-md-10 offset-md-1">
                  <div class="titlepage">
                     <h2>Our Services</h2>
                     <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, There </p>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div class="service_main">
                     <div class="service_box blu_colo">
                        <i><img src="images/ser1.png" alt="#"/></i>
                        <h4>FLY ANYWHERE</h4>
                     </div>
                     <div class="service_box yelldark_colo">
                        <i><img src="images/ser2.png" alt="#"/></i>
                        <h4>Cargo service</h4>
                     </div>
                     <div class="service_box yell_colo">
                        <i><img src="images/ser3.png" alt="#"/></i>
                        <h4> COURIER SERVICES</h4>
                     </div>
                     <div class="service_box yelldark_colo">
                        <i><img src="images/ser4.png" alt="#"/></i>
                        <h4>BOX STORAGE</h4>
                     </div>
                     <div class="service_box yell_colo">
                        <i><img src="images/ser5.png" alt="#"/></i>
                        <h4>100% safe</h4>
                     </div>
                  </div>
               </div>
               <div class="col-md-12">
                  <a class="read_more" href="#">Read More</a>
               </div>
            </div>
         </div>
      </div>
      <!-- end service section -->
      
      
      <!-- choose section -->
      <div class="choose">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>Why Choose Us</h2>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-5">
                  <div class="choose_box">
                     <i><img src="images/why1.png" alt="#"/></i>
                     <h3>Our Vission</h3>
                     <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,</p>
                     <a class="read_more" href="#">Read More</a>
                  </div>
               </div>
               <div class="col-md-5 offset-md-2">
                  <div class="choose_box">
                     <i><img src="images/why2.png" alt="#"/></i>
                     <h3>Estimate Shipping</h3>
                     <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,</p>
                     <a class="read_more" href="#">Read More</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   
      <footer>
         <div class="footer bottom_cross1">
            <div class="container">
               <div class="row">
                  <div class="col-md-4">
                     <ul class="location_icon">
                        <li><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i></a> Address : Lorem Ipsum <br> is simply dummy 
                        </li>
                        <li><a href="#"><i class="fa fa-phone" aria-hidden="true"></i></a>Phone :  +(1234) 567 890</li>
                        <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a>Email : demo@gmail.com</li>
                     </ul>
                     <form class="bottom_form">
                        <h3>Newsletter</h3>
                        <input class="enter" placeholder="Enter your email" type="text" name="Enter your email">
                        <button class="sub_btn">subscribe</button>
                     </form>
                  </div>
                  <div class="col-md-8">
                     <div class="map">
                        <figure><img src="images/map.png" alt="#"/></figure>
                     </div>
                  </div>
               </div>
            </div>
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <p>© 2019 All Rights Reserved. Design by<a href="https://html.design/"> Free Html Templates</a></p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
        <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <script>
         function openNav() {
           document.getElementById("mySidepanel").style.width = "250px";
         }
         
         function closeNav() {
           document.getElementById("mySidepanel").style.width = "0";
         }
      </script>
</body>
</html>