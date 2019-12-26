<%@page import="admin_re.AdminReVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   Logger LOG = Logger.getLogger(this.getClass());
   //화면 목록읽기
   List<AdminReVO> list= (List<AdminReVO>)request.getAttribute("list");
%>
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
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/aos.css">
    
    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="css/style.css">
    
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
    <style type="text/css">
	   #calendar{
	   padding-top:50px; 
	   width:600px; 
	   height: 300px;
	   margin-left:400px;
	   }
	   #pdate{
	      width:200px; 
	      height: 50px;
	      margin-left: 1070px;
	      margin-bottom: 80px;
	   }
	   #listTable{
	   margin-left:400px;
	   margin-right:300px;
	   text-align: center;
	   margin-top: 150px;
	   
	   }
	   .fc-day-number.fc-sat { color:#0000FF; }     /* 토요일 */
	   .fc-day-number.fc-sun { color:#FF0000; }    /* 일요일 */
	   
	   #updatebtn{
	   margin-left: 1510px;
	   margin-top: 150px;
	   margin-bottom: 20px;
	   }
	   
	</style>  
  </head>
  <body>
    
    <header class="site-header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-4 site-logo" data-aos="fade"><a href="index.jsp"><em>PENSION SSANGYOUNG</em></a></div>
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
                        <li class="active"><a id="reservation" href="/ORAI/villa/Reservation.jsp">RESERVATION</a></li>
                        <li><a id="checkreservation" href="/ORAI/villa/ORAI/userRe.jsp">CHECK RESERVATION</a></li>
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

   <section class="site-hero overlay page-inside" style="background-image: url(img/hero_2.jpg)">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center">
            <h1 class="heading" data-aos="fade-up">Reservation</h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100">예약하기</p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
    </section>
    <!-- END section -->
    <!-- Floating Btn section -->
       <form id="floating_action_btn" style="display:none;">
      <div id="container-floating" >
        <div id="logout" class="nd5 nds" data-toggle="tooltip" data-placement="left" ></div>
        <div id="review_button" class="nd4 nds" data-toggle="tooltip" data-placement="left" >
          <p class="letter">R</p>
      </div>
        <div id="adminre_button" class="nd3 nds" data-toggle="tooltip" data-placement="left" ><img class="reminder" src="//ssl.gstatic.com/bt/C3341AA7A1A076756462EE2E5CD71C11/1x/ic_reminders_speeddial_white_24dp.png" /></div>
        <div id="messenger_button" class="nd1 nds" data-toggle="tooltip" data-placement="left" ><img class="reminder">
          <p class="letter">M</p>
      </div>
        <div id="floating-button" data-toggle="tooltip" data-placement="left" data-original-title="Create" >
          <p class="plus">+</p>
          <img class="edit" src="https://ssl.gstatic.com/bt/C3341AA7A1A076756462EE2E5CD71C11/1x/bt_compose2_1x.png">
        </div>
      </div>
      </form>
     <!-- END Floating Btn section -->
   
   
	<div  id="calendar"></div>
	<div id=pdate class="pdate">
			<h5>선택하신 요일은</h5>
      		<h5 class="date" id="nows"></h5>
     		<h5>입니다.</h5>
	</div>
	<form name="searchForm" id="searchForm" action="/ORAI/reservationctrl/reservationctrl.do" method="post" class="form-inline">
				<input type="hidden"  name="work_div"   />	
			<table id="listTable" class="table table-striped table-bordered table-hover" >
					<thead>
						<tr>
							<th width="8%">선택</th>
							<th width="50%">객실명</th>
							<th width="9%">기준/최대</th>
							<th width="11%">기간</th>
							<th width="9%">인원</th>
							<th width="13%">요금</th>
						
							<!-- style="visibility: hidden;" 공간차지 -->
							<!-- style="display: none;" 공간도 사라짐-->									
						</tr>
					</thead>
					<tbody>
				
					
				
								
					</tbody>
					
				</table>
				</form>
	
 
   <div>
      <input type="submit" class="btn btn-primary btn-sm" id="paybtn" name="paybtn" value="다음 페이지" style="margin-top:30px;;margin-bottom:30px;"disabled/>
   </div>
    
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
    <script src="js/bootstrap.min.js"></script>
    <script src="/ORAI/fullcalendar-2.7.3/lib/moment.min.js"></script>
    <script src="js/jquery-ui.js"></script> 
    <script src="/ORAI/fullcalendar-2.7.3/fullcalendar.min.js"></script> 
	<script src="/ORAI/fullcalendar-2.7.3/fullcalendar.js"></script> 
    <script src="js/owl.carousel.min.js"></script>
    <script src="/ORAI/js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <!-- <script src="js/jquery.waypoints.min.js"></script> -->
    <script src="js/aos.js"></script>
    <script src="js/main.js"></script>
    
     <script>
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
   //   alert('review');
      window.location.href="review.do?work_div=do_retrieve";
   });   
   // 사진버튼->로그아웃 (연결 o)
    $("#logout").on("click",function(){
       //alert('logout');
       doLogout();
   });
  //로그아웃
    function doLogout(){
    //alert('doLOGOUT')연결확인;
       if(false == confirm("로그아웃 하시겠습니까?"))return;
    var frm =document.searchForm;
    frm.work_div.value='do_logout';
    frm.action='/ORAI/admin/admin.json';
    frm.submit();
	 } 
	//date 포멧 케스팅
	var today;
	Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var d = this;
	     
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
	
	$(document).ready(function() {
		if("${admin}"=="Admin"){
			 $("#location").hide(); //관리자일 때 메뉴 숨기기
	         $("#sight").hide(); //관리자일 때 메뉴 숨기기
	         $("#reservation").hide(); //관리자일 때 메뉴 숨기기
	         $("#checkreservation").hide(); //관리자일 때 메뉴 숨기기
		}
		 
		

		
		  var date = new Date(); 
	      var d = date.getDate(); 
	      var m = date.getMonth(); 
	      var y = date.getFullYear(); 
	      var seasonin = new Date("2019-07-15");
	      var seasonout = new Date("2019-08-15");
	      var seasonin= seasonin.format("yyyy-MM-dd");
	      var seasonout= seasonout.format("yyyy-MM-dd");
		
	      
	    	 
	    	


	    	
		  var calendar = $('#calendar').fullCalendar({
			  header: {
				   right: "prev, next today"
			  },
		      titleFormat:{
		    	  month:'YYYY년 MM월'
		      },
		      
		      dayNamesShort: ['일','월', '화', '수', '목', '금', '토'],
		      dayClick: function(date,allDay, jsEvent, view) {
		    	  
		    	  if (moment().format('YYYY-MM-DD') === date.format('YYYY-MM-DD') || date.isAfter(moment())) {
		    			//alert('Clicked on: ' + date.format());
		    			var yyyy =date.format("YYYY");
		    			var mm=date.format("MM");
		    			var dd=date.format("DD");
		    			var ss=date.format("dd");
		    			onchangeDay(yyyy,mm,dd);
		    			
			    	    today=date.format();
			    	    var weekend=ss;
			    	   console.log(ss);
// 			    	    var frm = document.frmMng;
// 			    	 	frm.work_div.value ="do_retrieve";
// 			    	 	frm.action = '/ORAI/reservationctrl/reservationctrl.do?today='+date.format();
// 			    	 	frm.submit();
			    	 	
			    	 	$.ajax({
			    	 
			                type:"POST",
			                url:"/ORAI/reservationctrl/reservationctrl.do",
			                dataType:"html",
			                data:{
								"work_div":"do_retrieve",
								"today":today
						    },  
						    success: function(data){
						    var jData = JSON.parse(data);
					             
					              var event_data = '';
					              //tbody 비우기.
					              $("#listTable>Tbody").empty();
					              $.each(jData,function(index, value){
					            	  
					                   event_data += '<tr>';
					                   event_data += '<td class="text-center"><input class="checkbox" type="checkbox" name="checkbox" id="checkbox" value="'+index+'" >';
					                   event_data += '<td><input type="text" name="room" id="room" value="'+value.room+'" readonly style="background-color:transparent;border:0 solid black;text-align:center ;" /></td>';
					                   event_data += '<td><input type="text" name="capacity" id="capacity" value="'+value.capacity+'" readonly style="background-color:transparent;border:0 solid black;text-align:center ;"  /></td>';
					                   event_data += '<td class="text-center">';
					                   event_data += '<select name="period" id="period"  class="form-control input-sm">';
					                   for(var i=1;i<=6;i++){
					                   event_data += '<option value="'+i+'">'+i+'박'+(i+1)+'일</option>';
					                   }
					                   event_data += '</select></td>';
					                   event_data += '<td><select name="pnum" id="pnum"  class="form-control input-sm">';
					                  
					                   var count=value.capacity +0;
					                   for(var i=1;i<=count;i++){
					                	   event_data +='<option value="'+i+'">'+i+'명</option>' ;  
					                   }
					                   event_data += '</select></td>';
					                 if(today>seasonin&&today<seasonout){
					                	 event_data += '<td><input type="text" name="pay" id="pay" value="'+value.season+'" readonly style="background-color:transparent;border:0 solid black;text-align:center;" /></td>';
					                 }
					                 else if(weekend=="Su"||weekend=="Sa"){
					                	 event_data += '<td><input type="text" name="pay" id="pay" value="'+value.weekend+'" readonly style="background-color:transparent;border:0 solid black;text-align:center;" /></td>';
					                 }
					                 else{
					                	 event_data += '<td><input type="text" name="pay" id="pay" value="'+value.weekday+'" readonly style="background-color:transparent;border:0 solid black;text-align:center;" /></td>';
					                 }

 					                 event_data += '<td style="display:none;"><input  name="icode" id="icode" value="'+value.icode+'"  /></td>'; 
 					                event_data += '<td style="display:none;"><input  name="rcode" id="rcode" value="'+value.rcode+'"  /></td>'; 
					                   event_data += '</tr>';
					                   
					              });
					         
					              $("#listTable>tbody").append(event_data);
					              
					          },
					          error: function(d){
					              /*console.log("error");*/
					              alert("404. Please wait until the File is Loaded.");
					          }
					      });     
					 
						//--ajax     	
			    	    $("#not").html("");
			    	   
		    	    } else {
		    	    	 $("#not").html("선택할 수 없는 요일");
		    	    	 $("#not").css('font-weight', 'bold');
		    			 $("#not").css('color', 'red');
		    			 $("#nows").html("선택할수없는 요일");
		    			
		    	    }
		    	 
		    	   
		    	  function onchangeDay(yy,mm,dd,ss){ 
		 			 $("#nows").html(yy+"년"+mm+"월"+dd+"일");
		 			 $("#nows").css('color', 'red');
		 			 $("#nows").css('font-weight', 'bold');
		 			 $("#day").html(weekend);
		 			
		 			}
		    	  
		    	 
				
	
		    		
		    	    
		    	    
		      }
	  
		  })
		





			
		 
		 
	
		
		
	    });
	
	

	   function check(){
		      if($("input:checkbox[name=checkbox]").is(":checked")==true){
		         paybtn.disabled=false
		      }else{
		    	  paybtn.disabled=true
		      }
		      
		   }
	$(document).on("click","#checkbox", function() {
		  $(".checkbox").prop("checked", false); //uncheck all checkboxes
		  $(this).prop("checked",true);  //check the clicked one
		  check()
		})

   var rowData = new Array();
	$("#paybtn").on('click',function(){
	  	console.log("length: "+$("input:checkbox[name=checkbox]:checked").length);
	    //체크된 체크박스 가져오기
	    var checkboxin= $("input:checkbox[name=checkbox]");
		    checkboxin.each(function(i,elements){
		    	if($(this).is(':checked')){
		    		//console.log("$(this)"+$(this).val());
		    		rowData = new Array();
		    		//선택되는 요소
		    		index=$(elements).index("input:checkbox[name=checkbox]")
		    		
		    		var rv = new Object;
		    		rv.room= $("input[name='room']")[index].value; //방이름
					rv.period= $("select[name='period']")[index].value;//기간
		    		rv.pnum= $("select[name='pnum']")[index].value;//예약자 인원
		    		rv.pay= $("input[name='pay']")[index].value;//요금	
		    		rv.icode= $("input[name='icode']")[index].value;//아이템 코드
		    		rv.rcode= $("input[name='rcode']")[index].value;//방코드
			        rv.today=today;
			        rowData.push(rv.room);
			    	rowData.push(rv.period);
			      	rowData.push(rv.pnum);
			      	rowData.push(rv.pay);
			    	rowData.push(rv.icode);
			    	rowData.push(rv.today);
			    	rowData.push(rv.rcode);
			      	console.log("rowData:"+rowData);
			        
			      //"work_div":"do_insert",
		            $("#work_div").val("do_insert_temp"); //"do_insert" 세팅
		            var jsonData = JSON.stringify(rowData);
		            $.ajax({
		                  type:"POST",
		                  url: "/ORAI/reservationctrl/reservationctrl.do",
		                  dataType:"html",
		                  data:{
		                	  "work_div":"do_insert_temp",
		                	  "jrowData" : jsonData
		                  },
		             success: function(data){
		            	 console.log(typeof data);
		            	var jData = JSON.parse(data);
		              
 		               window.location.href='/ORAI/reservationctrl/reservationctrl.do?work_div=do_nextpage&jData='+jData;
		              
		              
		             },
		             complete:function(data){
		              
		             },
		             error:function(xhr,status,error){
		              alert("error:"+error);
		             }
		               }); 
		            //--ajax 
		            
		            
		          
		            
		         
		            
		    	}//checked
		    })//checkboxin.each
	           	  
	  });//updatebtn	




	
	</script>
  </body>
</html>