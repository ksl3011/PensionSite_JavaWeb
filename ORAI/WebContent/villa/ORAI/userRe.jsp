<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="user_re.User_reVO"%>
<%@page import="user_re.User_reService"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%
	User_reService ser = new User_reService();
	User_reVO vo = new User_reVO();
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:bundle basename="user_re.Userre" >
<fmt:message  key="TITLE" var="title"/> 
<fmt:message  key="INFO_INFOINPUT" var="info_infoinput"/> 
<fmt:message  key="INFO_CAUTION" var="info_caution"/> 
<fmt:message  key="INFO_CAUTION2" var="info_caution2"/> 
<fmt:message  key="INFO_CAUTION3" var="info_caution3"/> 
<fmt:message  key="INFO_CAUTION4" var="info_caution4"/> 
<fmt:message  key="INFO_CAUTION5" var="info_caution5"/> 
<fmt:message  key="STR_BOOKER" var="str_booker"/> 
<fmt:message  key="STR_PHONE" var="str_phone"/> 
<fmt:message  key="STR_CONFIRM" var="str_confirm"/> 
<fmt:message  key="INFO_CANCEL" var="info_cancel"/> 
<fmt:message  key="INFO_CANCEL2" var="info_cancel2"/> 
<fmt:message  key="INFO_CANCEL3" var="info_cancel3"/> 
<fmt:message  key="STR_INFO" var="str_info"/> 
<fmt:message  key="STR_INFO2" var="str_info2"/> 
<fmt:message  key="STR_INPUT" var="str_input"/> 
<!doctype html>
<html>
  <head>
    <title>쌍용부띠끄펜션</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="/ORAI/image/favicon (1).ico" >
    <link href="https://fonts.googleapis.com/css?family=Mukta+Mahee:200,300,400|Playfair+Display:400,700" rel="stylesheet">

	<link rel="stylesheet" href="/ORAI/User_reView/UserRe.css">

    <link rel="stylesheet" href="/ORAI/villa/css/bootstrap.css">
    <link rel="stylesheet" href="/ORAI/villa/css/animate.css">
    <link rel="stylesheet" href="/ORAI/villa/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/ORAI/villa/css/aos.css">
    
    <link rel="stylesheet" href="/ORAI/villa/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/ORAI/villa/fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="/ORAI/villa/css/style.css">
  </head>
  <body>
    
    <header class="site-header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-4 site-logo" data-aos="fade"><a href="/ORAI/villa/index.jsp"><em>PENSION SSANGYOUNG</em></a></div>
          <div class="col-8">


            <div class="site-menu-toggle js-site-menu-toggle"  data-aos="fade">
              <span></span>
              <span></span>
              <span></span>
            </div>
            <!-- END menu-toggle -->

            <div class="site-navbar js-site-navbar">
              <nav role="navigation">
                <div class="container">
                  <div class="row full-height align-items-center">
                    <div class="col-md-6">
                      <ul class="list-unstyled menu">
                        <li><a id="location" href="/ORAI/villa/Location.jsp">LOCATION</a></li>
                        <li ><a id="sight"  href="/ORAI/villa/sightsctrl.do">SIGHT</a></li>
                        <li><a id="reservation" href="/ORAI/villa/Reservation.jsp">RESERVATION</a></li>
                        <li class="active"><a id="checkreservation" href="/ORAI/villa/ORAI/userRe.jsp">CHECK RESERVATION</a></li>
                        <li><a href="/ORAI/villa/notice.do?work_div=do_retrieve">NOTICE</a></li>
                        <li ><a href="/ORAI/villa/review.do?work_div=do_retrieve">REVIEW</a></li>   
                       </ul>
                    </div>
                    <div class="col-md-6 extra-info">
                      <div class="row">
                        <div class="col-md-6 mb-5">
                          <h3>Contact Info</h3>
                          <p> 강원도 속초시 대포동 543 </p>
                          <p>ssangyounginfo@.naver.com</p>
                          <p>010-4275-2036</p>
                        </div>
                          <div class="col-md-6 mb-5">
	                          <h3>Account</h3>
	                          <p>KEB하나 497-810008-08205</p>
	                          <p>(예금주: 박지윤)</p>
                      	 </div>
                      </div>
                    </div>
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- END head -->

   <section class="site-hero overlay page-inside" style="background-image: url(/ORAI/villa/img/hero_2.jpg)">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center">
            <h1 class="heading" data-aos="fade-up">Check Reservation</h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100">예약 확인</p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
    </section>
    <!-- END section -->

    <!-- Main Contents -->

	<input type="hidden" name="from" value="user_re"/>
	<input type="hidden" name="what" value="reference"/>
	
	<div class="main_top" style="margin-left:400px; margin-right: 400px; margin-top: 100px;">
		<span style="font-size:25px">${info_infoinput }</span>
	</div>
	<div style=" padding: 10px; margin-left:400px; margin-right: 400px;">
		<span style="font-size:10px; color:#FA5050; font:bold;" id="info" ></span>
		<hr/>
			<ul><li>
				<span style=" padding:7px; font-size:15px;"><b>${str_booker }</b></span>
				<input type="text" size="10" name="name" id="name"/>
				<span style="color:gray; font-size:8px;"> ${info_caution }</span>
			</li></ul>
			<hr/>
			<ul><li>
				<span style="font-size:15px"><b>${str_phone }</b> </span>
				<input type="text" name="phone" id="phone"/>
				<span style="color:gray; font-size:8px;"> ${info_caution2 }</span>
			</li></ul>
			<hr/>
			<div align="center" style="margin-bottom: 80px;"><input type="button" class="SM" id="submit_btn" value="${str_confirm }" onclick="submit()" ></div>
	</div>

	<script>
		function submit(){
			if($("#name").val()+$("#phone").val() == 0)
				$("#info").text("${info_caution3}");
			else if($("#name").val() == 0)
				$("#info").text("${info_caution5}");
			else if($("#phone").val() == 0)
				$("#info").text("${info_caution4}");
			else{
				var pX = (window.screen.width - 900)/2;
				var pY = (window.screen.height - 320)/2;
				var opt = "width=900, height=320, top=" + pY + ",left=" + pX +", status=0, toolbar=0, location=0, menubar=0";
				var indexWindow = window.open("/ORAI/User_reView/AuxPage.jsp", "_blank", opt);

			}
		};
	</script>
    
   <!--/ Main Contents -->

   <!-- footer -->      
    <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
            <p><span class="d-block">Address:</span> <span> 강원도 속초시 대포동 543</span></p>
            <p><span class="d-block">Phone:</span> <span> 010-4275-2036</span></p>
            <p><span class="d-block">Email:</span> <span> ssangyounginfo@.naver.com</span></p>
            <p><span class="d-block">Account:</span> <span>KEB하나  497-810008-08205 <br>(예금주: 박지윤) </span></p>
          </div>
        </div>
        <div class="row bordertop pt-5">
          <p class="col-md-6 text-left"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
        </div>
      </div>
    </footer>
<!-- //footer --> 

    <script src="/ORAI/villa/js/jquery-3.2.1.min.js"></script>
    <script src="/ORAI/villa/js/popper.min.js"></script>
    <script src="/ORAI/villa/js/bootstrap.min.js"></script>
    <script src="/ORAI/villa/js/owl.carousel.min.js"></script>
    <!-- <script src="js/jquery.waypoints.min.js"></script> -->
    <script src="/ORAI/villa/js/aos.js"></script>
    <script src="/ORAI/villa/js/main.js"></script>
  </body>
</html>
</fmt:bundle>