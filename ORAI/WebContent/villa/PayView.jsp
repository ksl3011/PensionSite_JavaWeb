<%@page import="reservation.TempVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%TempVO tempVO = (TempVO)request.getAttribute("vo"); %>
<!doctype html>
<html>
  <head>
    <title>쌍용부띠끄펜션</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Mukta+Mahee:200,300,400|Playfair+Display:400,700" rel="stylesheet">
	<link rel="stylesheet" href="/ORAI/fullcalendar-2.7.3/fullcalendar.css">
    <link rel="stylesheet" href="/ORAI/fullcalendar-2.7.3/fullcalendar.min.css">
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
      #Table1{
      
	   margin-left:400px;
	   margin-right:300px;
	   text-align: center;
	   margin-top: 150px;
	   
	   }
	   #Table2{
	   margin-left:400px;
	   margin-right:300px;
	   text-align: center;
	   margin-top: 150px;
	   
	   }
   </style>     
    
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
                        <li><a id="location"  href="/ORAI/villa/Location.jsp">LOCATION</a></li>
                        <li><a id="sight"  href="/ORAI/villa/sightsctrl.do">SIGHT</a></li>
                        <li class="active"><a id="reservation" href="/ORAI/villa/Reservation.jsp">RESERVATION</a></li>
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
            <h1 class="heading" data-aos="fade-up">Detail Reservation</h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100">상세 예약</p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
    </section>
    <!-- END section -->
   
   
	<!-- my code -->       

<div style="margin-left:300px;margin-right:300px; ">
	<table  class="table table-striped table-bordered table-hover" id="table1" name="table1" >
		<h3 align="center" style="margin-top:50px;margin-bottom:20px;">객실 이용 현황</h3>
		<tr>
			
			<td>객실명</td>
			<td>이용일자</td>
			<td>기간</td>
			<td>인원</td>
			<td>객실요금</td>
		</tr>
		<tr>
			<td><%=tempVO.getROOM() %></td>
			<td><%=tempVO.getTODAY() %></td>
			<td><%=tempVO.getPERIOD()%>박<%=tempVO.getPERIOD()+1%>일</td>
			<td><%=tempVO.getPNUM() %></td>
			<td><%=tempVO.getPAY()*tempVO.getPERIOD() %></td>
		</tr>
		
	</table>

</div>
<br><br><br><br><br>
<div style="margin-left:300px;margin-right:300px; " >
	<table  id="table2" name="table2" class="table table-striped table-bordered table-hover"  >
	<h3 align="center" style="margin-bottom:20px;">최종 결제 금액</h3>
		<tr>
			<td>총 이용요금</td>
			<td><%=tempVO.getPAY()*tempVO.getPERIOD() %></td>
			
		</tr>
		<tr>
			<td>예약금</td>
			<td><%=tempVO.getPAY()*tempVO.getPERIOD()/4 %></td>
			
		</tr>
		<tr>
			<td>결제방법</td>
			<td><input type="radio">무통장입금</td>
			
		</tr>
	</table>
</div>
<br><br><br><br><br>
<div style="margin-left:300px;margin-right:300px; ">
	<table  class="table table-striped table-bordered table-hover"  style="margin-left: auto; margin-right: auto; ">
	<h3 align="center">예약자정보입력</h3>
		<tr>
			<td>예약자명</td>
			<td><input id="rname" name="rname"  type="text" ></td>
			
		</tr>
		<tr>
			<td>핸드폰</td>
			<td><select name="phone" id="phone"  style="width:80px; height:33px;">
  				<option value="010">010</option>
  				<option value="011">011</option>
  				<option value="016">016</option>
  				<option value="017">017</option>
  				<option value="018">018</option>
  				<option value="019">019</option>
  				<option value="019" selected="selected">선택</option>
				</select>
				- <input maxlength="4" type="text" id="mp" name="mp"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"> 
				- <input maxlength="4" type="text" id="lp" name="lp" onKeyup="this.value=this.value.replace(/[^0-9]/g,'' )">
				</td>
		</tr>
	
		
		
	</table>
</div>
<br><br>
<div>
		<button class="btn btn-primary btn-sm"  id="btn" align="center" style="margin-bottom:50px;" >이전단계</button> 
		<button class="btn btn-primary btn-sm"  id="btn2" align="center" style="margin-bottom:50px;">예약하기</button>
</div>

<!--// mycode -->
    
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

 <script src="/ORAI/js/jquery-1.12.4.js"></script>
    <script src="/ORAI/villa/js/bootstrap.min.js"></script>
    <script src="/ORAI/fullcalendar-2.7.3/lib/moment.min.js"></script>
    <script src="/ORAI/js/jquery-ui.js"></script> 
    <script src="/ORAI/fullcalendar-2.7.3/fullcalendar.min.js"></script> 
	<script src="/ORAI/fullcalendar-2.7.3/fullcalendar.js"></script> 
    <script src="/ORAI/villa/js/owl.carousel.min.js"></script>
    <script src="/ORAI/villa/js/jquery-3.2.1.min.js"></script>
    <script src="/ORAI/villa/js/popper.min.js"></script>
    <!-- <script src="js/jquery.waypoints.min.js"></script> -->
    <script src="/ORAI/villa/js/aos.js"></script>
    <script src="/ORAI/villa/js/main.js"></script>
    
     <script>
   
   
     //로그아웃
       function doLogout(){
       //alert('doLOGOUT')연결확인;
          if(false == confirm("로그아웃 하시겠습니까?"))return;
       var frm =document.searchForm;
       frm.work_div.value='do_logout';
       frm.action='/ORAI/admin/admin.json';
       frm.submit();
   	 } 
       $(document).ready(function() {
    		
    	})
    	 $("#btn").on('click',function(){
    		 window.location.href="/ORAI/villa/Reservation.jsp";
    	 })
    	 $("#btn2").on('click',function(){
           	//alert('save_btn');
           	//validation:필수 check
           	var rname = $("#rname").val();
   			if(null == rname || rname.trim().length == 0){
   				$("#rname").focus();
   				alert('얘약자명을(를) 입력 하세요.');
   				return ;
   			} 
   			var phone = $("#phone").val();
   			var mp=$("#mp").val();
   			var lp=$("#lp").val();
   			if(null == phone || phone .trim().length  == 0 ||null == mp || mp.trim().length==0||null == lp || lp.trim().length==0){
   				$("#phone").focus();
   				alert('전화번호를(를) 입력 하세요.');
   				return ;
   			}
           	
           	
           	
   			
   			
   			//alert(param);
   			
           	if( false==confirm(rname+'을(를)\n예약 하시겠습니까?'))return;
           	rowData = new Array();
       		//선택되는 요소
       		    		
       		var rv = new Object;
       		rv.rcode= "<%=tempVO.getRcode()%>"
       		rv.pnum=<%=tempVO.getPNUM()%>
       		rv.today= "<%=tempVO.getTODAY()%>"
       		rv.period=<%=tempVO.getPERIOD()%>
       		rv.pay=<%=tempVO.getPAY()%>
       		rv.icode=<%=tempVO.getICODE()%>
       		rv.name= document.getElementById("rname").value; 
       		rv.phone=document.getElementById("phone").value+"-"+document.getElementById("mp").value+"-"+document.getElementById("lp").value;
   	        rowData.push(rv.rcode);
   	    	rowData.push(rv.pnum);
   	      	rowData.push(rv.today);
   	      	rowData.push(rv.period);
   	    	rowData.push(rv.pay);
   	    	rowData.push(rv.icode);
   	    	rowData.push(rv.name);
   	    	rowData.push(rv.phone);
   	      	console.log("rowData:"+rowData);
       		
   	      	$("#work_div").val("do_insert");//"do_insert" set
   	      	 var jsonData = JSON.stringify(rowData);
           	//ajax
               $.ajax({
                  type:"POST",
                  url:"/ORAI/reservationctrl/reservationctrl.do",
                  dataType:"html",
                  data:{
                	  "work_div":"do_insert",
                	  "jrowData" : jsonData
                  },

               success: function(data){
                 var jData = JSON.parse(data);
                 if(null != jData && jData.msgId=="1"){
                   alert(jData.msgContents);
                   window.location.href="/ORAI/villa/Reservation.jsp";
                 }else{
                   alert(jData.msgId+"|"+jData.msgContents);
                 }
               },
               complete:function(data){
                
               },
               error:function(xhr,status,error){
                   alert("error:"+error);
               }
              }); 
              //--ajax          	
           });


   </script>
  </body>
</html>