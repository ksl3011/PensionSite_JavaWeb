<%--
  /**
  * @Class Name : notice.jsp
  * @Description : 공지사항 글쓰기 및 단건조회 화면 
  * @Modification Information
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *  2019.08.06     시은지       최초 생성
  *
  * author 실행환경 개발팀
  * since 2019.08.06
  *
  * Copyright (C) 2009 by KandJang  All right reserved.
  */
--%>
<%@page import="admin.AdminVO"%>
<%@page import="notice1.NoticeVO"%>
<%@page import="cmn.SearchVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!doctype html>
<html>
  <head>
  <style type="text/css">

   #tname{
     width: 1000px;
     height:40px;
   }
   #contents{
     width: 1000px;
     height:500px;
   }

</style>
    <title>쌍용부띠끄펜션</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" href="/ORAI/image/favicon (1).ico">
    <link href="https://fonts.googleapis.com/css?family=Mukta+Mahee:200,300,400|Playfair+Display:400,700" rel="stylesheet">

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
          <div class="col-4 site-logo" data-aos="fade"><a href="index.html"><em>PENSION SSANGYOUNG</em></a></div>
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
                        <li class="active"><a href="/ORAI/villa/index.jsp">WELCOME</a></li>
                        <li><a href="hotel.jsp">VILLA</a></li>
                        <li><a href="/ORAI/ReservationView/Reservation.jsp">RESERVATION</a></li>
                        <li><a href="/ORAI/ReviewView/review_list.jsp">REVIEW</a></li>
                        <li><a href="/ORAI/NoticeView/notice_list.jsp">NOTICE</a></li>
                        <li><a href="/ORAI/LocationView/LocationView.html">LOCATION</a></li>
                        <li><a href="/ORAI/LocationView/LocationView.html">SIGHT</a></li>
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
            <h1 class="heading" data-aos="fade-up">공지 글 작성하기</h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100">notice-form</p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
    </section>
    <!-- END section -->
<!-- my code -->
<div class="container">
		<div style="padding-top:20px; padding-right:0px; padding-left:990px;">
		<input type="button" class="btn btn-primary btn-sm "  id="backbtn1" value="뒤로가기" />
		</div>	
		<!-- 글쓰기 form -->
		<div class="table-responsive" style="padding-top:30px; padding-right:1300px; padding-left:30px">
			<div class="row">
				<div class="col-sm-5 col-sm-push-7">
					<form name="frmMng"  id="frmMng"  method="post" action="/ORAI/NoticeView/notice.do" class="form-inline">
					<input type="hidden" name="work_div" id="work_div"/> 
					<input type="hidden" name="seq" id= "seq" value="${vo.seq}"/>
						<table class="table table-striped table-bordered table-hover" >
							<thead class="bg_primary">
								<tr>
									<th class="text-center col-sm-10 col-xs-10">공지게시판 양식</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="hidden" name="seq" id="seq" value="${vo.getSeq()}" ></td>
								</tr>	
								<tr>
									<td><input type="text" name="tname" id="tname" value="${vo.getTitle()}" placeholder="글 제목" name="bbsTitle" maxlength="50"/></td>
								</tr>
								<tr>
									<td><textarea id="contents" name="contents" placeholder="글 내용" name="bbsContent" maxlength="2048" >${vo.getContents()}</textarea></td>
								</tr>
							</tbody>
						</table>
					</form>
					<div class="container">
						<div class="row">
							<div style="padding-top:10px; padding-right:0px; padding-left:920px;">
									<input type="button" class="btn btn-primary btn-sm " id="savebtn"  style="display:none;" value="등록" />
									<input type="button" class="btn btn-primary btn-sm " id="reset_btn"  style="display:none;" value="초기화" />
									<input type="button" class="btn btn-primary btn-sm " id="cancelbtn" style="display:none;" value="취소" />
									<input type="button" class="btn btn-primary btn-sm " id="update_btn" style="display:none;" value="수정" />
									<input type="button" class="btn btn-primary btn-sm " id="del_btn"  style="display:none;" value="삭제" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>	
	<script>
	function doDel(){
		if(false ==confirm('삭제하시겠습니까?'))return;
		var frm = document.frmMng;
		frm.work_div.value = "do_delete";
		frm.action ="/ORAI/villa/notice.do";
		frm.submit();
	}	
	//등록
		$("#savebtn").on('click',function(){
			//alert('writebtn');
			
			var title= $("#tname").val();
			if(null == title ||title.trim().length ==0){
				$("#tname").focus();
				alert('제목을 입력하세요');
				return;
			}
			//"work_div":"do_insert",
			$("#work_div").val("do_insert"); //"do_insert" 세팅
			var param = $("#frmMng").serialize(); //값을 가져오는 것
			//alert(param);
			
			if(false==confirm('글을 등록하시겠습니까?')) return;
					
			//ajax
		    $.ajax({
		     type:"POST",
		     url:"/ORAI/villa/notice.do",
		     dataType:"html",
		     data: param,
		    success: function(data){
		     var jData = JSON.parse(data);
		     if(null != jData && jData.msgId=="1"){
		      alert(jData.msgContents);
		  	  window.location.href="/ORAI/villa/notice.do?work_div=do_retrieve";
		      
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
	//취소
	$("#cancelbtn").on('click',function(){
		if(false ==confirm('게시글 작성을 취소하시겠습니까?'))return;
		window.location.href="/ORAI/villa/notice.do?work_div=do_retrieve";
	});	
	//뒤로가기
	$("#backbtn1").on('click',function(){
		window.location.href="/ORAI/villa/notice.do?work_div=do_retrieve";
	});	
	
	//삭제
	$("#del_btn").on('click',function(){
		//console.log('del_btn');
		//console.log($("#seq").val());
		//validation
		var title= $("#tname").val();
		if(null ==title ||title.trim().length ==0){
			$("#tname").focus();
			alert('제목을 입력하세요');
			return;
		}
		if(false ==confirm('삭제하시겠습니까'))return;
		
		//ajax
		$.ajax({
				type:"POST",
				url: "/ORAI/villa/notice.do",
				dataType:"html",
				data:{
					"work_div":"do_delete",
					"seq":$("#seq").val()
			},
			success:function(data){
				var jData =JSON.parse(data);
				console.log(jData.msgId+"|"+jData.msgContents);
				
				if(null != jData && jData.msgId =="1"){
					alert(jData.msgContents);
					window.location.href="/ORAI/villa/notice.do?work_div=do_retrieve";
				}else{
					alert(jData.msgId+"|"+jData.msgContents);
				}
				//alert("success:"+data);
				
			},complete:function(data){
				
			},error: function(xhr,status,error){
				alert("error:"+error);
			}
		});
		//--ajax
	});	
	
	
	
	//수정
	$("#update_btn").on('click',function(){
		//validation
		var title= $("#tname").val();
		if(null ==title ||title.trim().length ==0){
			$("#tname").focus();
			alert('제목을 입력하세요');
			return;
		}
		//"work_div":"do_update",
		$("#work_div").val("do_update"); //"do_update" 세팅
		var param = $("#frmMng").serialize(); //값을 가져오는 것
		//alert(param);
		
		if(false==confirm('게시글을 수정하시겠습니까?')) return;
				
		//ajax
	    $.ajax({
	     type:"POST",
	     url:"/ORAI/villa/notice.do",
	     dataType:"html",
	     data: param,
	    success: function(data){
	     var jData = JSON.parse(data);
	     if(null != jData && jData.msgId=="1"){
	      alert(jData.msgContents);
	  	  window.location.href="/ORAI/villa/notice.do?work_div=do_retrieve";
	      
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
	
	//초기화
	$("#reset_btn").on('click',function(){
			//채워져있는 것 비우기 
			$("#tname").val("");
			$("#contents").val("");	
	});
	
	$(document).ready(function(){	
		console.log('mode:'+'${mode}');
		if("${admin}"=="Admin"){
			if(null!='${mode}' && 'insert'=='${mode}'){
				console.log('2 mode:'+'${mode}');
				$("#savebtn").css("display", "inline ");//보이게하기
				$("#reset_btn").css("display", "inline");//보이게하기
				$("#cancelbtn").css("display", "inline ");//보이게하기
				}
			else if(null!='${mode}' && 'udlate'=='${mode}'){
				console.log('2 mode:'+'${mode}');
				$("#update_btn").css("display", "inline");//보이게하기
				$("#del_btn").css("display", "inline");//보이게하기
				}
		}
	});
	</script>
<!--// my code -->
    
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
  </body>
</html>