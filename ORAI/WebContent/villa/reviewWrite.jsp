<%@page import="user_re.User_reVO"%>
<%@page import="review.RoomVO"%>
<%@page import="roominfo_bk.RoominfoVO"%>
<%@page import="review.ReviewVO"%>
<%@page import="reservation.ReservationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  	     pageEncoding="UTF-8"%>
    
     <%
    ReviewVO vo	  = (ReviewVO)request.getAttribute("vo");
    RoomVO rvo	  = (RoomVO) request.getAttribute("rvo");
    User_reVO uvo = (User_reVO)request.getAttribute("uvo");
    %>
    
    
<!doctype html>
<html>
  <head>
    <title>숙박후기</title>
    <meta charset="utf-8">
    <style type="text/css">
	 #title{
	     width: 800px;
	     height:30px;
	     }
	 #reg_id{
	 	width:100px;
	 	height:20px;
	 	}
	 #room{
	 	width:200px;
	 	height:20px;
	 	}
	#contents{
	     width: 1000px;
	     height:500px;
	     
	   }
	
	th, td {
	    padding: 7px 10px 10px 10px;}
</style>
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

    <div class="page-header" >
	<hr>
	</div>
	<!-- 게시물 form -->
	<div class="table-responsive" style="padding-top:30px; padding-right:500px; padding-left:500px">
		<div class="row">
			<div class="col-sm-5 col-sm-push-7">
		<form name="reviewfrm" id="reviewfrm" 
              action="/ORAI/ReviewView/review.do" method="post" >
    	<input type="hidden" name="work_div" id="work_div"/>
   		<input type="hidden" name="seq" id= "seq" value="${vo.seq}"/>
  		<input type="hidden" name="rtitle" id= "rtitle" value="${vo.title}" />
		<table class="table table-striped table-bordered table-hover">
				<thead class="bg_primary">
				  <tr>
					<td> <input type="hidden" name="seq" id="seq" value="${vo.getSeq()}" ></td>
				  </tr>
				</thead>
					<tr>
					 <td> 
					   <input type="text" name="title" id="title" value="${vo.getTitle()}" placeholder="  [숙박객실] 제목"  maxlength="200"/>
					 </td>
				   </tr>
				    <tr>
				      <td> 
					   <label>작성자</label> &emsp;&emsp; <input type="text" name="reg_id" id="reg_id" size="20" maxlength="20"/>
					   &emsp; <label>예약번호</label>&emsp;<input type="text" name="room" id="room" size="20" style="font-size:13px;"placeholder=" 예약번호입력  ex) 1001-000-000" maxlength="20"/>
					   &emsp; <input  type="button" class="btn-sm " id="numchk" value="번호확인" size="20" style="font-size:10px;" />
					  </td>
					  
					</tr>
				
					
					<tr>
						<tr>
						 <td><textarea id="contents" name="contents" 
						 placeholder="
						 * 쌍용 부띠끄 리뷰게시판을 이용해 주셔서 감사합니다.  
						    리뷰를 남겨주신 분들 중 매월 추첨을 통해 무료 숙박권을 보내드리고 있사오니
						   다음 고객을 위해 알찬 리뷰 부탁드립니다.*" 
						 maxlength="2048"  style="margin-top:20px">${vo.getContents()}</textarea></td>
						</tr>
						
						<tr>
						<td><label>비밀번호</label> &emsp;<input type="text" name="passwd" id="passwd" size="20" maxlength="20"/></td>			
						</tr>
				</tbody>
			</table>
		</form>
			<!-- button area -->
			<div style="padding:10px; ">
				<input  type="button" class="btn btn-primary btn-sm " id="savebtn" value="등록"  />
				<input  type="button" class="btn btn-primary btn-sm " id="backbtn1" value="뒤로가기" />	
			</div>
	<!--// button area -->
		</div>
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
    	//예약번호 확인 
    	$("#numchk").on('click',function(){
    		
    		//alert('numchk');
    		//공백인경우(o), 총 12자가 아닌 경우, 앞자리가 1001인지 확인
    		var room= $("#room").val();
    		if(null == room ||room.trim().length ==0){
				$("#room").focus();
				alert('예약번호를 입력하세요');
				return;	
			}else if(room.length !=12){
				$("#room").focus();
				alert('예약번호 길이를 확인하세요');
				return;	
			
    		}else{
    			alert('확인되었습니다');
				$('#numchk').attr('disabled',true);  
			} 
    		  	
   		 });
    	//등록
		$("#savebtn").on('click',function(){
			//alert('writebtn');
			
			 if(numchk.disabled==false){
    			alert('번호확인이 되지 않았습니다.');
				return;	
    		} 
			var title= $("#title").val();
			//alert("title:"+rtitle)
			if(null == title ||title.trim().length ==0){
				$("#title").focus();
				alert('제목을 입력하세요');
				return;	
			}
			var reg_id=$("#reg_id").val();
			if(null == reg_id || reg_id.trim().length == 0){
				$("#reg_id").focus();
				alert('등록자를 입력 하세요.');
				return ;
			}
			var contents = $("#contents").val();
			if(null == contents || contents.trim().length == 0){
				$("#contents").focus();
				alert('내용을 입력 하세요.');
				return ;
			}   
			/* var room =$("#room").val();
			if(room !='${uvo.nO}'){
				$("#room").focus();
				alert('예약번호를 입력하세요');
				return ;
			} */
			var passwd =$("#passwd").val();
			if(null == passwd || passwd.trim().length == 0){
				$("#passwd").focus();
				alert('비밀번호를 입력하세요');
				return ;
			}
			//"work_div":"do_insert",
			$("#work_div").val("do_insert"); //"do_insert" 세팅
			var param = $("#reviewfrm").serialize(); //값을 가져오는 것
			//alert(param);
			
			if(false==confirm('글을 등록하시겠습니까?')) return;
					
			//ajax
		    $.ajax({
		     type:"POST",
		     url:"/ORAI/villa/review.do",
		     dataType:"html",
		     data: param,
		    success: function(data){
		     var jData = JSON.parse(data);
		     if(null != jData && jData.msgId=="1"){
		      alert(jData.msgContents);
		  	  window.location.href="review.do?work_div=do_retrieve";
		      
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
		
		//뒤로가기
		 $("#backbtn1").on('click',function(){
			 
			window.location.href="review.do?work_div=do_retrieve";
		 });	
		      
		       
		 $(document).ready(function(){
			 if("${admin}"=="Admin"){
					$("#account-wall").css("display", "none ");//안보이게하기
					$("#account-title").css("display", "none ");//안보이게하기
					$("#location").hide(); //관리자일 때 메뉴 숨기기
					$("#sight").hide(); //관리자일 때 메뉴 숨기기
					$("#adreservation").css("display", "inline ");//보이게하기
					$("#reservation").hide(); //관리자일 때 메뉴 숨기기	
					$("#checkreservation").hide(); //관리자일 때 메뉴 숨기기
					$("#imAdmin").css("display", "inline ");//보이게하기
					$("#imUser").hide();
					$("#update_btn2").css("display","none");
				}else{
					$("#imAdmin").hide();
					$("#imUser").css("display", "inline ");//보이게하기
					$("#update_btn2").show();
				
					
				}
		 });
	
	</script>
  </body>
</html>