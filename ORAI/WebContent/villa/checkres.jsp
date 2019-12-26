<%@page import="admin_re.AdminReVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>      
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
    <link rel="shortcut icon" href="/ORAI/image/favicon (1).ico" >
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
	   
	   }
	   .fc-day-number.fc-sat { color:#0000FF; }     /* 토요일 */
	   .fc-day-number.fc-sun { color:#FF0000; }    /* 일요일 */
	   
	   #updatebtn{
	   margin-left: 1200px;
	   margin-bottom: 20px;
	   }
	   
	   #chartbtn{
	   margin-left: 1200px;
	   margin-top: 107px;
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
                        <li class="active"><a href="/ORAI/villa/checkres.jsp">RESERVATION</a></li>
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
            <h1 class="heading" data-aos="fade-up">Reservation List</h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100">예약관리</p>
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
        	<input type="hidden" id="messengerWho" value="<c:if test='${!empty Admin}' var='a' ><c:out value='${a }'/></c:if>" />
          <p class="letter">M</p>
      </div>
        <div id="floating-button" data-toggle="tooltip" data-placement="left" data-original-title="Create" >
          <p class="plus">+</p>
          <img class="edit" src="https://ssl.gstatic.com/bt/C3341AA7A1A076756462EE2E5CD71C11/1x/bt_compose2_1x.png">
        </div>
      </div>
      </form>
     <!-- END Floating Btn section -->
   
	<!-- my code -->       
   <div id="calendar"></div>
   <div id="pdate">
      <h5>선택하신 요일은</h5>
      <h5 class="date" id="nows"></h5>
      <h5>입니다.</h5>
   </div>
     <div>
		<input type="submit" id="chartbtn" name="chartbtn" class="btn btn-primary btn-sm " value="통계"/>
		<input type="submit" id="updatebtn" name="updatebtn" class="btn btn-primary btn-sm " value="수정" disabled/>	
  	 </div>
   
   <form name="searchForm" action="/ORAI/admin_re/adminrectrl.do"  method="post" class="form-inline" style="margin-bottom: 50px;">
   <input type="hidden" name="work_div"/> 
   <table id="listTable" class="table table-striped table-bordered table-hover" >
      <thead>
         <tr>
            <th width="8%">선택</th>
            <th width="15%">객실명</th>
            <th width="20%">예약자명</th>
            <th width="10%">숙박인원</th>
            <th width="27%">숙박기간</th>
            <th width="12%">요금</th>   
            <th width="10%">결제여부</th>         
         </tr>
      </thead>
      
      <tbody>
         <c:choose>
            <c:when test="${list.size()>0}">
               <c:forEach var="vo" items="${list}">
                  <tr>
                     <td> 
                        <input type="checkbox" id="checkno" name="checkno" value="${vo.payCode}"/>
                     </td>
                     <td class="text-center"><c:out value="${vo.room}"/></td>
                     <td class="text-center"><c:out value="${vo.rname}"/></td>
                     <td class="text-center"><c:out value="${vo.pnum}"/></td>
                     <td class="text-center"><c:out value="${vo.sdate}"/>~<c:out value="${vo.edate}"/></td>
                     <td class="text-center"><c:out value="${vo.weekday}"/></td>
                     <td class="text-center">
                        <select name="pay" id="pay" class="form-control input-sm" onchange="${vo.pState}.value">
                           <option value="1" <c:if test="${vo.pState=='1'}"> selected</c:if>>결제</option>
                                   <option value="0" <c:if test="${vo.pState=='0'}"> selected</c:if>>미결제</option>
                        </select>
                     </td>
                  </tr>   
                  
               </c:forEach>
             </c:when>
         </c:choose>         
      </tbody>
      </table>
   </form>

<!--// mycode -->
    
   <!-- footer -->      
    <footer class="section footer-section" style="margin-top: 200px;">
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
   	  // 메세지 버튼 ->1:1->대화 (연결o)
      $("#messenger_button").on('click',function(){
    	//alert('messenger');
		var pX = (window.screen.width - 450)/2;
		var pY = (window.screen.height - 600)/2;
		var opt = "width=450, height=600, top=" + pY + ",left=" + pX +", status=0, toolbar=0, location=0, menubar=0";
		var indexWindow = window.open("http://localhost:8080/ORAI/MessengerView/AuxPage.jsp", "_blank", opt);
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
   //체크박스 눌러야 수정버튼 활성화 되는 것
   function check(){
      if($("input:checkbox[name=checkno]").is(":checked")==true){
         updatebtn.disabled=false
      }else{
         updatebtn.disabled=true
      }
      
   }
 	//수정버튼 한번만 클릭
 	 $("#updatebtn").one('click',function(){
 		 if(false==confirm('결제여부를 수정하시겠습니까?')) return;
 		 alert("수정되었습니다"); 
 		 history.go(0);
 	 });
 	
   var rowData = new Array();
  //수정버튼 
  $("#updatebtn").on('click',function(){
  	console.log("length: "+$("input:checkbox[name=checkno]:checked").length);
    //체크된 체크박스 가져오기
    var checkboxin= $("input:checkbox[name=checkno]");
	    checkboxin.each(function(i,elements){
	    	if($(this).is(':checked')){
	    		//console.log("$(this)"+$(this).val());
	    		rowData = new Array();
	    		//선택되는 요소
	    		index=$(elements).index("input:checkbox[name=checkno]")
	    		
	    		var pay = new Object;
	    		pay.code= $("input[name='payCode']")[index].value; //결제번호
		        pay.state= $("select[name='pay']")[index].value;//결제 여부
		        console.log("pay.code:"+pay.code);
		        console.log("pay.state:"+pay.state);
		        
		        rowData.push(pay.code);
		      	rowData.push(pay.state);
		      	console.log("rowData:"+rowData);
		      	
		      //"work_div":"do_update",
	            $("#work_div").val("do_update"); //"do_update" 세팅

	            
	            //객체를 json으로 만듬
		        var jsonData = JSON.stringify(rowData);
	         	console.log("jsonData"+jsonData);
	         	
	            //ajax
	             $.ajax({
	                  type:"POST",
	                  url: "/ORAI/villa/adminRe.do",
	                  dataType:"JSON",
	                  data:{
	                	  "work_div":"do_update",
	                	  "jrowData" : jsonData
	                  },
	             success: function(data){
	            
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
           	           	  
  $("#chartbtn").on('click',function(){
		var pX = (window.screen.width - 740)/2;
		var pY = (window.screen.height - 560)/2;
		var opt = "width=740, height=560, top=" + pY + ",left=" + pX +", status=0, toolbar=0, location=0, menubar=0";
		window.open("/ORAI/ChartView/ChartView.jsp", "_blank", opt);
 });
   
   //달력 클릭할 때 날짜 띄우기 
   $(document).ready(function() {
       function onchangeDay(yy,mm,dd){ 
          
          $("#nows").html(yy+"년"+mm+"월"+dd+"일");
          $("#nows").css('color', 'red');
          $("#nows").css('font-weight', 'bold');
          
         }
       if("${admin}"=="Admin"){
    	   $("#floating_action_btn   ").css("display", "inline ");
       }
       
/*         var date = new Date(); 
         var d = date.getDate(); 
         var m = date.getMonth(); 
         var y = date.getFullYear();  */
        
        // page is now ready, initialize the calendar...
        var calendar = $('#calendar').fullCalendar({
           header: {
               right: "prev, next today"
           },
            titleFormat:{
               month:'YYYY년 MM월'
            },
            dayClick: function(date, jsEvent, view) {
          
                 //alert('Clicked on: ' + date.format());
                 var yy=date.format("YYYY"); //년
                 var mm=date.format("MM"); //월
                 var dd=date.format("DD");//일 
                 onchangeDay(yy,mm,dd);
                 
                 var date= date.format();
                 console.log("date:"+date);
                 //$(this).css('background-color', 'red');
                //ajax
               $.ajax({
                     type:"POST",
                     url: "/ORAI/villa/adminRe.do",
                     dataType:"html",
                     data:{
                        "work_div":"do_retrieve",
                        "today":date
                  },
                  success:function(data){
                     var jData =JSON.parse(data);
                     console.log(jData);
                     var event_data = '';
                           //tbody 비우기.
                          $("#listTable>tbody").empty();
                          $.each(jData,function(index, value){
                              var pState=value.pState+"";
                             // var payCode=value.payCode+"";
                              //var pState = '<c:out value="${value.pState}"/>';
                              //console.log(value.payCode);
                               event_data += '<tr>';
                               event_data += '<td><input type="checkbox"  id="checkno" name="checkno" onClick="check();"></td>';
                               event_data += '<td>'+value.room+'</td>';
                               event_data += '<td>'+value.rname+'</td>';
                               event_data += '<td>'+value.pnum+'</td>'; 
                               event_data += '<td>'+value.sdate+'~'+value.edate+'</td>';
                               event_data += '<td>'+value.weekday+'</td>';
                               event_data += '<td><select name=\"pay\" class=\"pay\">'
                                               if(pState == '1'){ 
                                                   event_data  +="<option  value='1' selected>결제</option>"; 
                                                   event_data  +="<option  value='0' >미결제</option>" 
                                             } else { 
                                                   event_data  +="<option  value='1' >결제</option>" 
                                                   event_data +="<option  value='0' selected>미결제</option>"; 
                                              }  
                               //event_data += "<option value='1' "+(pState==1)? "selected":""+">결제</option>"
                               //event_data += "<option value='0' "+(pState==0)? "selected":""+">미결제</option>"
                               event_data += '</select></td>';
                               event_data += '<td style="display:none;"><input name="payCode" id="payCode" type="hidden" value=\"'+value.payCode+'\" ></td>';
                               event_data += '</tr>';
                               
                              
                          }); 
                          $("#listTable>tbody").append(event_data);
      
                  },complete:function(data){
                  
                  },error: function(xhr,status,error){
                     alert("error:"+error);
                  }
               }); 
               //--ajax      

            },dayNamesShort: ['일','월', '화', '수', '목', '금', '토']
             
          
        })

      });


   </script>
  </body>
</html>