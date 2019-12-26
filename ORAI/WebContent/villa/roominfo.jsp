<%@page import="admin.AdminVO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- page -->
<%@page import="java.util.List"%>
<%@page import="roominfo_bk.ImgVO"%>
<%@page import="roominfo_bk.RoominfoVO"%>
<%@page import="cmn.DTO"%>

<%
    AdminVO user = (AdminVO)session.getAttribute("user");

	RoominfoVO vo =(RoominfoVO)request.getAttribute("outVO");
	ImgVO vo2 = (ImgVO) request.getAttribute("outVO2");

%>
<fmt:setLocale value="en"/>
<fmt:bundle basename="resource.message" >  
<fmt:message  key="key1" var="key1"/>

<!doctype html>

<html lang="en">
  <head>
    <title>쌍용부띠끄펜션</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="/WEB_EX01/js/jquery-1.12.4.js"></script>
	<script src="/WEB_EX01/js/jquery-ui.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Mukta+Mahee:200,300,400|Playfair+Display:400,700" rel="stylesheet">
    <link rel="shortcut icon" href="/ORAI/image/favicon (1).ico" >
    <link rel="stylesheet" href="/ORAI/villa/css/bootstrap.css">
    <link rel="stylesheet" href="/ORAI/villa/css/animate.css">
    <link rel="stylesheet" href="/ORAI/villa/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/ORAI/villa/css/aos.css">
    
    <link rel="stylesheet" href="/ORAI/villa/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/ORAI/villa/fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="/ORAI/villa/css/style.css">
    
    <!-- floating btn css -->
  <style type="text/css">
    	
    
		    body{
		  font-family: 'Roboto';
		  text-align: center;
		  background: #f1f1f1;
		}
		
		h3{
		  color: #555;
		}
		
		#presentation{
		  width: 480px;
		  height: 120px;
		  padding: 20px;
		  margin: auto;
		  background: #FFF;
		  margin-top: 10px;
		  box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23); 
		  transition: all 0.3s; 
		  border-radius: 3px;
		}
		
		#presentation:hover{
		  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
		  transition: all 0.3s;
		  transform: translateZ(10px);
		}
		
		#floating-button{
		  width: 55px;
		  height: 55px;
		  border-radius: 50%;
		  background: #db4437;
		  position: fixed;
		  bottom: 30px;
		  right: 30px;
		  cursor: pointer;
		  box-shadow: 0px 2px 5px #666;
		}
		
		.plus{
		  color: white;
		  position: absolute;
		  top: 0;
		  display: block;
		  bottom: 0;
		  left: 0;
		  right: 0;
		  text-align: center;
		  padding: 0;
		  margin: 0;
		  line-height: 55px;
		  font-size: 38px;
		  font-family: 'Roboto';
		  font-weight: 300;
		  animation: plus-out 0.3s;
		  transition: all 0.3s;
		}
		
		#container-floating{
		  position: fixed;
		  width: 70px;
		  height: 70px;
		  bottom: 30px;
		  right: 30px;
		  z-index: 50px;
		}
		
		#container-floating:hover{
		  height: 400px;
		  width: 90px;
		  padding: 30px;
		}
		
		#container-floating:hover .plus{
		  animation: plus-in 0.15s linear;
		  animation-fill-mode: forwards;
		}
		
		.edit{
		  position: absolute;
		  top: 0;
		  display: block;
		  bottom: 0;
		  left: 0;
		  display: block;
		  right: 0;
		  padding: 0;
		  opacity: 0;
		  margin: auto;
		  line-height: 65px;
		  transform: rotateZ(-70deg);
		  transition: all 0.3s;
		  animation: edit-out 0.3s;
		}
		
		#container-floating:hover .edit{
		  animation: edit-in 0.2s;
		   animation-delay: 0.1s;
		  animation-fill-mode: forwards;
		}
		
		@keyframes edit-in{
		    from {opacity: 0; transform: rotateZ(-70deg);}
		    to {opacity: 1; transform: rotateZ(0deg);}
		}
		
		@keyframes edit-out{
		    from {opacity: 1; transform: rotateZ(0deg);}
		    to {opacity: 0; transform: rotateZ(-70deg);}
		}
		
		@keyframes plus-in{
		    from {opacity: 1; transform: rotateZ(0deg);}
		    to {opacity: 0; transform: rotateZ(180deg);}
		}
		
		@keyframes plus-out{
		    from {opacity: 0; transform: rotateZ(180deg);}
		    to {opacity: 1; transform: rotateZ(0deg);}
		}
		
		.nds{
		  width: 40px;
		  height: 40px;
		  border-radius: 50%;
		  position: fixed;
		  z-index: 300;
		  transform:  scale(0);
		  cursor: pointer;
		}
		
		.nd1{
		  background: #d3a411;
		  right: 40px;
		  bottom: 120px;
		  animation-delay: 0.2s;
		    animation: bounce-out-nds 0.3s linear;
		  animation-fill-mode:  forwards;
		}
		
		.nd3{
		  background: #3c80f6;
		  right: 40px;
		  bottom: 180px;
		  animation-delay: 0.15s;
		    animation: bounce-out-nds 0.15s linear;
		  animation-fill-mode:  forwards;
		}
		
		.nd4{
		  background: #ba68c8;
		  right: 40px;
		  bottom: 240px;
		  animation-delay: 0.1s;
		    animation: bounce-out-nds 0.1s linear;
		  animation-fill-mode:  forwards;
		}
		
		.nd5{
		  background-color:white;
		  background-image: url('/ORAI/villa/img/logout.png');
		  background-size: 100%;
		  right: 40px;
		  bottom: 300px;
		  animation-delay: 0.08s;
		  animation: bounce-out-nds 0.1s linear;
		  animation-fill-mode:  forwards;
		}
		
		@keyframes bounce-nds{
		    from {opacity: 0;}
		    to {opacity: 1; transform: scale(1);}
		}
		
		@keyframes bounce-out-nds{
		    from {opacity: 1; transform: scale(1);}
		    to {opacity: 0; transform: scale(0);}
		}
		
		#container-floating:hover .nds{
		  
		  animation: bounce-nds 0.1s linear;
		  animation-fill-mode:  forwards;
		}
		
		#container-floating:hover .nd3{
		  animation-delay: 0.08s;
		}
		#container-floating:hover .nd4{
		  animation-delay: 0.15s;
		}
		#container-floating:hover .nd5{
		  animation-delay: 0.2s;
		}
		
		.letter{
		  font-size: 23px;
		  font-family: 'Roboto';
		  color: white;
		  position: absolute;
		  left: 0;
		  right: 0;
		  margin: 0;
		  top: 0;
		  bottom: 0;
		  text-align: center;
		  line-height: 40px;
		}
		
		.reminder{
		  position: absolute;
		  left: 0;
		  right: 0;
		  margin: auto;
		  top: 0;
		  bottom: 0;
		  line-height: 40px;
		}
		
		.profile{
		  border-radius: 50%;
		  width: 40px;
		  position: absolute;
		  top: 0;
		  bottom: 0;
		  margin: auto;
		  right: 20px;
		}
	</style>  	
    <!-- //floating btn css -->
  </head>
  <body>
    
    <header class="site-header">
      <div class="container-fluid">
        <div class="row">
        <!-- main form -->
			<form  method="post" name="mainForm" id="mainForm" action="/ORAI/villa/index.jsp">
				<input type="hidden" name="work_div"  >
			</form>
		<!--// main form -->
          <div class="col-4 site-logo" data-aos="fade"><a href="/ORAI/villa/index.jsp"><em><fmt:message key="key1"/></em></a></div>
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
                        <li><a id="sight" href="/ORAI/villa/sightsctrl.do">SIGHT</a></li>
                        <li><a id="reservation" href="/ORAI/villa/Reservation.jsp">RESERVATION</a></li>
                        <li><a id="checkreservation" href="/ORAI/villa/ORAI/userRe.jsp">CHECK RESERVATION</a></li>
                        <li><a id="adreservation" style="display:none;" href="/ORAI/villa/checkres.jsp">RESERVATION</a></li>
                        <li><a href="/ORAI/villa/notice.do?work_div=do_retrieve">NOTICE</a></li>
                        <li><a href="/ORAI/villa/review.do?work_div=do_retrieve">REVIEW</a></li>                     
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
            <h1 class="heading" data-aos="fade-up">Room</h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100"></p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
    </section>
   
    <!-- END section -->

   
    <!-- END section -->

    <section class="section slider-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-8">
            <h3 class="heading" data-aos="fade-up"><%= vo.getRoom() %><p></p></h3>
            <p class="lead" data-aos="fade-up" data-aos-delay="100"><fmt:message key="key13"/></p>
          </div>
        </div>
        <div class="table-responsive">
					<table table style="margin-left: auto; margin-right: auto;" id="listTable"  class="table table-striped table-bordered table-hover">
						<thead class="bg_primary">
							<tr>
								<th class="text-center " width="10%">방이름</th>
								<th class="text-center " width="10%">수용인원</th>
								<th class="text-center " width="10%">방번호</th>
								<th class="text-center " width="10%">평일</th>
								<th class="text-center " width="10%">주말</th>
								<th class="text-center " width="10%">성수기</th>
								<th class="text-center " width="40%">정보</th>
																	
							</tr>
						</thead>
						<tbody>
							<%
								if(null != vo ){
								
							%>
									<tr>
										<td class="text-center"><%= vo.getRoom() %></td>
										<td class="text-center"><%= vo.getCapacity() %></td>
										<td class="text-center"><%= vo.getRnum() %></td>
										
										<td class="text-center"><%= vo.getWeekday() %></td>
										<td class="text-center"><%= vo.getWeekend() %></td>
										<td class="text-center"><%= vo.getSeason() %></td>
										<td class="text-center"><%= vo.getRinfo() %></td>
										
										
																	
									</tr>
							<%	
								   
								}else{  
							%>
									<tr>
										<td colspan="99">No data found</td>
									</tr>
							
							<%	}//--else %>
						</tbody>
					</table>
					<br><br>
					</div>
        <div class="row">
          <div class="col-md-12">
            <div class="home-slider major-caousel owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
              <div class="slider-item">
                <img src="<%=vo2.getImg1()%>" alt="Image placeholder" class="img-fluid">
              </div>
              <div class="slider-item">
                <img src="<%=vo2.getImg2()%>" alt="Image placeholder" class="img-fluid">
              </div>
              <div class="slider-item">
                <img src="<%=vo2.getImg3()%>" alt="Image placeholder" class="img-fluid">
              </div>
              <div class="slider-item">
                <img src="<%=vo2.getImg4()%>" alt="Image placeholder" class="img-fluid">
              </div>
              <div class="slider-item">
                <img src="<%=vo2.getImg5()%>" alt="Image placeholder" class="img-fluid">
              </div>
              <div class="slider-item">
                <img src="/ORAI/villa/img/slider-6.jpg" alt="Image placeholder" class="img-fluid">
              </div>
            </div>
            <!-- END slider -->
            
          </div>
        </div>
      </div>
    </section>
    <!-- END section -->
    
    <!-- Floating Btn section -->
   
     <!-- END Floating Btn section -->
     
  
    <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
            <p><span class="d-block">Address:</span> <span> 강원도 속초시 대포동 543</span></p>
            <p><span class="d-block">Phone:</span> <span> 010-4275-2036</span></p>
            <p><span class="d-block">Email:</span> <span> ssangyounginfo@.naver.com</span></p>
            <p><span class="d-block">Account:</span> <span>KEB하나  497-810008-08205 <br>(예금주: 박지윤) </span></p>
          </div>
            <div class="col-md-3 mb-5" id="login">
            <!-- LOGIN FORM  -->
            <p class="account-title" name="account-title" id="account-title">Admin login</p>
            <div class="account-wall" name="account-wall" id="account-wall">
	            <form action="<c:url value='/admin/admin.json' />" class="footer-login" method="post"
	            	  name="loginForm" id="loginForm">
	              <div class="form-group">
	                <input type="hidden" name="work_div" value="do_login" id="work_div">
	                
	                <input type="text"   name="admin" id="admin"  class="form-control" placeholder="아이디를 입력하세요" autofocus="autofocus">
	                <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호를 입력하세요">
	              </div>
	                <button type="button" id="do_login" class="login_btn"><span class="fa fa-sign-in"></span></button>
	            </form>
            </div>
           <!-- LOGIN FORM  -->
          </div>
        </div>
        <div class="row bordertop pt-5">
          <p class="col-md-6 text-left"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
        </div>
      </div>
    </footer>
    
    <script src="/ORAI/villa/js/jquery-3.2.1.min.js"></script>
    <script src="/ORAI/villa/js/popper.min.js"></script>
    <script src="/ORAI/villa/js/bootstrap.min.js"></script>
    <script src="/ORAI/villa/js/owl.carousel.min.js"></script>
    <!-- <script src="js/jquery.waypoints.min.js"></script> -->
    <script src="/ORAI/villa/js/aos.js"></script>
    <script src="/ORAI/villa/js/main.js"></script>
    
    <script>
   	//로그아웃
   	function doLogout(){
		//alert('doLOGOUT')연결확인;
   		if(false == confirm("로그아웃 하시겠습니까?"))return;
		var frm =document.mainForm;
		frm.work_div.value='do_logout';
		frm.action="<c:url value='/admin/admin.json'/>";
		frm.submit();
	} 
    //로그인 후 메인화면
    function goMain(){
		
    	//alert('goMain');
		var frm = document.mainForm;
		console.log(frm);
		frm.work_div.value ='do_move_to_main';
		frm.action = "<c:url value='/admin/admin.do'/>";
		frm.submit();
    	
    }
    function goLogin(){
    	
		//alert('goLogin');
		    console.log("user_id:"+$("#admin").val());
		    console.log("passwd:"+$("#pw").val());
		    console.log("work_div:"+$("#work_div").val());
		    
		    var user_id = $("#admin").val();
			if(null == user_id || user_id.trim().length == 0){
				$("#admin").focus();
				alert('ID를 입력 하세요.');
				return ;
			}
			
		    var passwd = $("#pw").val();
			if(null == passwd || passwd.trim().length == 0){
				$("#pw").focus();
				alert('비번을(를) 입력 하세요.');
				return ;
			} 
			
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/admin/admin.json' />",
				dataType : "html",
				data : {
					"work_div" : "do_login",
					"user_id" :  $("#admin").val(),
					"passwd" :   $("#pw").val()
			},
			success : function(data) {
				console.log('data:'+data);
				var jData = JSON.parse(data);
				var msgId = jData.msgId;
				var msgContents = jData.msgContents;
				if("10"==msgId){//ID확인
					alert(msgContents);
				    $("#admin").focus();
				    return;
				}else if("20"==msgId){//비번확인
					alert(msgContents);
				    $("#pw").focus();
				    return;
				}else if("1"==msgId){//로그인 성공
					goMain();
				}else{
					alert(msgContents);
				}
				
			},
			complete : function(data) {

			},
			error : function(xhr, status, error) {
				alert("error:" + error);
			}
		});
		//--ajax  			
	}
    	
	    //LOGIN
	    $("#do_login").on("click",function(){
			//alert('do_login');
	    	goLogin();
	    });
	    
	    
	 	 //FLOATING_BTN
	 	 //맨 하단 글쓰기 버튼 -> 공지사항 (연결o)
		$("#floating-button").on('click',function(){
			//alert('notice');
			window.location.href="/ORAI/villa/notice.do?work_div=do_retrieve";
		});	
	 	// 메세지 버튼 ->1:1->대화 (링크 추가요망 )
		$("#messenger_button").on('click',function(){
			alert('messenger');
			window.location.href="";
		});	
		// 달력 버튼 ->예약관리 (연결o)
		$("#adminre_button").on('click',function(){
			//alert('adminre');
			window.location.href="/ORAI/villa/checkres.jsp";
		});	
		// R버튼 ->리뷰관리  (연결o)
		$("#review_button").on('click',function(){
		//	alert('review');
			window.location.href="/ORAI/villa/review.do?work_div=do_retrieve";
		});	
		// 사진버튼->로그아웃 (연결 o)
	    $("#logout").on("click",function(){
	    	//alert('logout');
	    	doLogout();
		});
	 	 
		
	    //로그인 하고 나면 로그인 창 대신 관리자 메뉴 뜨도록 
	    $(document).ready(function(){
			if("${admin}"=="Admin"){
				$("#account-wall").css("display", "none ");//안보이게하기
				$("#account-title").css("display", "none ");//안보이게하기
				$("#floating_action_btn	").css("display", "inline ");//보이게하기
				$("#location").hide(); //관리자일 때 메뉴 숨기기
				$("#sight").hide(); //관리자일 때 메뉴 숨기기
				$("#adreservation").css("display", "inline ");//보이게하기
				$("#reservation").hide(); //관리자일 때 메뉴 숨기기
				$("#checkreservation").hide(); //관리자일 때 메뉴 숨기기
			}
		});
	    
	    //새로고침 하면 화면 맨 위로 이동 
	    window.onload = function(){
	    	setTimeout(function(){
	    		scrollTo(0,0);
	    	}, 100);
	    }
	  //객실정보
	    $("#roominfo_java").click(function(){
	    	var frm = document.searchFrm;
	    	frm.work_div.value ="post";
	    	frm.action = '/ORAI/roominfoctrl/roominfoctrl.do?rcode='+'1001-101';
	    	frm.submit(); 
	    })
	    $("#roominfo_oracle").click(function(){
	    	var frm = document.searchFrm;
	    	frm.work_div.value ="post";
	    	frm.action = '/ORAI/roominfoctrl/roominfoctrl.do?rcode='+'1001-102';
	    	frm.submit(); 
	    })
	    $("#roominfo_jsp").click(function(){
	    	var frm = document.searchFrm;
	    	frm.work_div.value ="post";
	    	frm.action = '/ORAI/roominfoctrl/roominfoctrl.do?rcode='+'1001-103';
	    	frm.submit(); 
	    })
	    $("#roominfo_spring").click(function(){
	    	var frm = document.searchFrm;
	    	frm.work_div.value ="post";
	    	frm.action = '/ORAI/roominfoctrl/roominfoctrl.do?rcode='+'1001-104';
	    	frm.submit(); 
	    })
	    $("#roominfo_html").click(function(){
	    	var frm = document.searchFrm;
	    	frm.work_div.value ="post";
	    	frm.action = '/ORAI/roominfoctrl/roominfoctrl.do?rcode='+'1001-105';
	    	frm.submit(); 
	    })
	   
    </script>
  </body>
</html>
</fmt:bundle>