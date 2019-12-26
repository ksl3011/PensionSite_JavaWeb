
<%@page import="cmn.StringUtil"%>
<%@page import="cmn.SearchVO"%>
<%@page import="review.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!doctype html>
<html>
  <head>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Mukta+Mahee:200,300,400|Playfair+Display:400,700" rel="stylesheet">
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
  
	<%	
  	Logger LOG = Logger.getLogger(this.getClass());
  //화면 목록 
  	List<ReviewVO> list = (List<ReviewVO>)request.getAttribute("list");
  
 // param 목록
 	String pageNum 		= "1";
    String searchDiv 	= "";
    String searchWord	= "";
    String pageSize		= "10";
    
  //paging
    int maxNum=0; //총 글수
    int currPageNo =1; //현재 페이지
    int rowPerPage =10; //row cnt 
    int bottomCount =10;//bottom cnt
    String  url = "/ORAI/villa/review.do";
    String scriptName = "doSearchPage"; //아까 만든 자바스크립트 이름
    
   SearchVO paramVO = (SearchVO) request.getAttribute("paramVO");
   if(null !=paramVO){
      pageNum = paramVO.getNum()+""; //string으로 변환한 것
       searchDiv = paramVO.getSearchDiv();
       searchWord = paramVO.getSearchWord();
       pageSize = paramVO.getPageSize()+""; //string으로 변환한 것
       LOG.debug("=======================");
       LOG.debug("paramVO"+paramVO);
       LOG.debug("=======================");
       
       rowPerPage = Integer.parseInt(pageSize);
       currPageNo = Integer.parseInt(pageNum);
      
       maxNum = (Integer)request.getAttribute("totalCnt");
  
 	}
  %>
   <!-- 부트스트랩 -->
   <link rel="shortcut icon" href="/ORAI/image/favicon (1).ico">
   
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
                        <li><a id="reservation" href="/ORAI/villa/Reservation.jsp">RESERVATION</a></li>
                        <li><a id="checkreservation" href="/ORAI/villa/ORAI/userRe.jsp">CHECK RESERVATION</a></li>
                        <li><a id="adreservation" style="display:none;" href="/ORAI/villa/checkres.jsp">RESERVATION</a></li>
                        <li><a href="/ORAI/villa/notice.do?work_div=do_retrieve">NOTICE</a></li>
                        <li class="active"><a href="/ORAI/villa/review.do?work_div=do_retrieve">REVIEW</a></li>                    

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
            <h1 class="heading" data-aos="fade-up">Customer Review</h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100">숙박 후기</p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
    </section>
    <!-- END section -->

    <!-- 검색영역 -->
 
	<div class="table-responsive" style="padding-top:30px; padding-right:300px; padding-left:300px">
	    <div >
	       <input type="button" class="btn btn-primary btn-sm pull-right" value="글쓰기" onclick="javascript:do_save_move();"style="margin:10px;"/>
		</div>
			<table id="listTable" class="table table-striped table-bordered table-hover"  >
			  <thead class="bg_primary" >
				<tr>
					<th class="text-center" >NO</th>
					<th class="text-center" >제목</th>
					<th class="text-center"  >작성자</th>
					<th class="text-center" >작성일</th>
					<th class="text-center" >조회수</th>
					<th class="text-center"  style="display:none;">SEQ</th> 
					<th class="text-center"  id="rowCheckbox" >선택</th>
				</tr>
			</thead>
			<tbody>
			<%
			if(null !=list && list.size()>0){
				for(ReviewVO vo:list){
			%>
			
				<tr>
					<td  class="text-center"><%=vo.getNum() %></td>
					<td  class="text-left"><%=vo.getTitle() %></td>
					<td  class="text-center"><%=vo.getReg_id()%></td>
					<td  class="text-center"><%=vo.getReg_dt()%></td>
					<td  class="text-center"><%=vo.getRead_cnt()%></td>
					<td  style="display:none;"><%=vo.getSeq()%></td>
					<td  class="checkbox-inline-box" style="text-align:center; "id="rowCheck1"><input class="checkbox-inline"   type="checkbox" name="rowCheck"  id="rowCheck" value="${vo.getSeq}"/></td>
				</tr>
			<%
				   }//-for
				}else{  %>
				<tr>
					<td colspan="99">No data found</td>
				</tr>
			<% }//-else %>
			</tbody>
		</table>
     </div>
	
	
	<!-- data list -->
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
   
	<!--버튼 -->
	<div class="row" style="padding-top:20px;  ">
		<div class="col-sm-5 col-sm-push-6" style="padding-left:1030px;" >
			<form name="searchForm" action="/ORAI/villa/review.do" class="form-inline" method="post">
			<input type="hidden" name="work_div" /> 
			<input type="hidden" name="page_num" />
				<div class="form-group" >
					<select class="form-control input-sm" style="font-size:15px; height:40px;" name="search_div" id="search_div">
						<option value="">전체</option>

						<option value="20" <%if(searchDiv.equals("20"))out.print(""); %>>제목</option>							
						<option value="30" <%if(searchDiv.equals("30"))out.print(""); %>>작성자</option>
					</select>
						<input type="text" class="form-control input-sm"  id="seacrch_word" name="search_word" style=" height:40px;"value="<%=searchWord %>"placeholder="검색어">
	                <select class="form-control input-sm" style="font-size:15px; height:40px;" name="page_size" id="page_size">
	                   	<option value="10"  <%if(pageSize.equals("10"))out.print("selected='selected' "); %> >10</option>
						<option value="50"  <%if(pageSize.equals("50"))out.print("selected='selected' "); %> >50</option>
						<option value="100" <%if(pageSize.equals("100"))out.print("selected"); %> >100</option>
					</select> 
					<input type="button" class="btn btn-primary btn-sm " value="조회" style ="margin:10px;" onclick="javascript:do_retrieve();"/>
             		<input type="button" class="btn btn-primary btn-sm "   id="selectBtn" value="선택삭제" />
                 </div>
                 <!-- //data list -->
				                   
			</form> 
			<!-- paging -->      
     			<nav class="text-center" style="margin-right:2000px;" >
         			<ul class="pagination"  >
            		 <li>
              		  <%=StringUtil.renderPaing(maxNum, currPageNo, rowPerPage, bottomCount, url, scriptName) %>
             		 </li>
         		    </ul>
    			</nav>
   				 <!-- //paging -->	  
		</div>
		
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
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <!-- <script src="js/jquery.waypoints.min.js"></script> -->
    <script src="js/aos.js"></script>
    <script src="js/main.js"></script>
    
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
     
	 //메인페이지로
	 $("#backbtn1").on('click',function(){
		window.location.href="/ORAI/admin/admin.json";
	 });	
	 
	$("#selectBtn").on('click',function(){ 	
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=rowCheck]:checked");

		checkbox.each(function(i) {

		// checkbox.parent() : checkbox의 부모는 <td>이다.
		// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();
			
		// 체크된 row의 모든 값을 배열에 담는다.
		rowData.push(tr.text());
		
		var seq = td.eq(5).text()
		var title = td.eq(1).text()
			
		tdArr.push(seq);
		tdArr.push(title);
			
		console.log("seq : " + seq);
		console.log("title : " + title);
			 
		//ajax
	     $.ajax({
	     type:"POST",
	     url: "/ORAI/villa/review.do",
	     dataType:"html",
	     data:{
	            "work_div":"do_delete",
	            "seq":seq
	   		   },
	   		   
	    success:function(data){
	    	var jData = JSON.parse(data);
	        console.log(jData.msgId+"|"+jData.msgContents);
	        if(null !=jData && jData.msgId=="1"){
	        //alert(jData.msgContents);
	        window.location.href="/ORAI/villa/review.do?work_div=do_retrieve";
	        }else{
	        //	alert(jData.msgId+"|"+jData.msgContents);
	        }
	       // alert("success:" + data);
	        },complete:function(data){
	               
	        },error: function(xhr,status,error){
	          alert("error:" + error);
	        }
	     });	
	  });
   });
	
		//page이동
		function doSearchPage(url,page_num){
			//alert(url+","+page_num);
			var frm = document.searchFrm;
			frm.work_div.value = "do_retrieve";
			frm.page_num.value = page_num;
			frm.action = url;
			frm.submit();	
			}
		
		 //등록화면
		 function do_save_move(){
			 //alert('do_save_move');
			 if(confirm("숙박후기를 작성 하시겠습니까?")==false)return;
			 var frm = document.searchForm
			 frm.work_div.value = "do_save_move";
			 frm.action  = '/ORAI/villa/review.do';
			 frm.submit();
			 }
		 
		 function do_retrieve(){
		 	//alert('do_retrieve');
		 	var frm = document.searchForm
		 	frm.work_div.value  ='do_retrieve';
		 	frm.page_num.value  ='1';
		 	frm.action		    = '/ORAI/villa/review.do';
		 		
		 	//alert('frm_work_div.value:'+frm.work_div.value);
		 	frm.submit();
		 	}
		 	
		 	//수정화면으로 이동:servlet
			$("#listTable>tbody").on("dblclick","tr",function(){
				var cTrs = $(this);
				var cTds = cTrs.children();
				console.log(cTds);
				
				var seq = cTds.eq(5).text();
				console.log("seq:"+seq);
				
				var frm = document.searchForm;
				frm.work_div.value ="do_selectone";
				frm.action = '/ORAI/villa/review.do?seq='+seq;
				frm.submit();
			});
		 	
 			$(function() {
				$("#searchFrm").validate();
			});
			 
			
			$("#search_word").keypress(function(e){
				//console.log("search_word:"+e);
				if(e.which == 13){//enter
					do_retrieve();
				}
			});
			
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
			//	alert('review');
				window.location.href="review.do?work_div=do_retrieve";
			});	
			// 사진버튼->로그아웃 (연결 o)
		    $("#logout").on("click",function(){
		    	//alert('logout');
		    	doLogout();
			});
			$(document).ready(function(){	
				if("${admin}"=="Admin"){//로그인시 checkbox 줄 보이게하기 + floating btn
					$("#selectBtn").show();
					$(".checkbox-inline").show();
					$(".checkbox-inline-box").show();
					$("#rowCheckbox").show();
					$("#sight").hide();//메뉴토글에서 SIGHT메뉴 숨기기
					$("#reservation").hide();//메뉴토글에서 SIGHT메뉴 숨기기
					$("#location").hide();//메뉴토글에서 LOCATION숨기기 
					$("#checkreservation").hide();//메뉴토글에서 LOCATION숨기기 
					$("#floating_action_btn	").css("display", "inline");
					$("#adreservation").css("display", "inline ");
			

				}else{//checkbox 줄 안보이게하기
					$("#selectBtn").hide();
					$(".checkbox-inline").hide();
					$(".checkbox-inline-box").hide();
					$("#rowCheckbox").hide();
					
					
					
					
				}
				$("#selectBtn").one("click",function(){
					alert("삭제되었습니다.")
				});
			});
			 	
		</script>
  </body>
</html>