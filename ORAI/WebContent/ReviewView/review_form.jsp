<%--
  /**
  * @Class Name : useOutObject.jsp
  * @Description : Sample Register 화면
  * @Modification Information
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *  2019.07.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2019.07.01
  *
  * Copyright (C) 2009 by KandJang  All right reserved.
  */
--%>
<%@page import="review.RoomVO"%>
<%@page import="roominfo_bk.RoominfoVO"%>
<%@page import="review.ReviewVO"%>
<%@page import="reservation.ReservationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ReviewVO vo	  = (ReviewVO)request.getAttribute("vo");
    RoomVO rvo	  = (RoomVO) request.getAttribute("rvo");
    %>
   

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<style type="text/css">
<style type="text/css">
 #title{
     width: 1000px;
     height:40px;
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/WEB_EX01/js/jquery-ui.css">
<link rel="shortcut icon" href="/ORAI/image/favicon (1).ico">
<title>숙박후기</title>
<script src="/WEB_EX01/js/jquery-1.12.4.js"></script>
<script src="/WEB_EX01/js/jquery-ui.js"></script> 
</head>
<body>
<div class="container">
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
   		      	 <input type="hidden" name="title" id= "title" value="${vo.title}"/>
				 <table class="table-striped">
					<tbody>
					   <tr>
				 		 <td><input type="hidden" name="seq" id="seq" value="${vo.getSeq()}" ></td>
					   </tr>	
					    <tr>
		    			  <td><input type="text" name="title" id="title" style="background-color:transparent;border:0px;"font-size:large" value="${vo.getTitle()}" placeholder="글 제목"  style="height:30px; width:1000px;" maxlength="50"/></td>
						</tr>		
						 <tr>	
						  <td>
		  				 	<label>등록일</label>&emsp;<input type="text" name="reg_dt" id="reg_dt" value="${vo.getReg_dt()}"size="20" maxlength="20" />
		  				 	<label>작성자</label> &emsp;<input type="text" name="reg_id" id="reg_id" value="${vo.getReg_id()}"size="20" maxlength="20" readonly="readonly" />
							<label>투숙객실(지금코드로뜸)</label>&emsp;<input type="text" name="room" id="room" value="${vo.getNo()}" maxlength="20" readonly="readonly" />
						  </td>
				        </tr>
				         <tr>
						  <td><textarea id="contents" name="contents" maxlength="2048" readonly="readonly" >${vo.getContents()}</textarea></td>
						</tr>
						
						<tr>
				 <td><label>비밀번호</label> &emsp;<input type="text" name="passwd" id="passwd" size="20" maxlength="20"/></td>				
				</tr>
			</tbody>
		</table>
		</form>
			<!-- button area -->
			<div style=padding:10px;>
				<input  type="button" class="btn btn-primary btn-sm " id="update_btn2" value="수정" />
				<input  type="button" class="btn btn-primary btn-sm " id="update_btn"  style="display:none;" value="등록" />
				<input  type="button" class="btn btn-primary btn-sm " id="del_btn"  value="삭제"  />
				<input type="button" class="btn btn-primary btn-sm " id="reset_btn"  style="display:none;" value="초기화" />
				<input type="button" class="btn btn-primary btn-sm " id="backbtn1" value="게시판" />	
			</div>
	<!--// button area -->
		</div>
	  </div>	
	</div>
	</div>	
	<script>
	 //뒤로가기
		 $("#backbtn1").on('click',function(){
			 
			window.location.href="/ORAI/ReviewView/review.do?work_div=do_retrieve";
		 });	
		//삭제 function
		function doDel(){
			if(false == confirm('삭제하시겠습니까?'))return;
	
			var frm = document.reviewfrm;
			frm.work_div.value = "do_delete";
			frm.action = "/ORAI/ReviewView/review.do";
			frm.submit();
			
		}
		//초기화
		$("#reset_btn").on('click',function(){
			//채워져있는 것 비우기 
			$("#title").val("");
			$("#contents").val("");	
			});
		
		//삭제 btn event
		$("#del_btn").on('click',function(){
		//	alert($("#seq").val());
		//console.log('del_btn');//화면 띄우고 삭제 누르면 콘솔창에 뜨는지 확인
			var passwd =$("#passwd").val();
			if(null == passwd || passwd.trim().length == 0){
				$("#passwd").focus();
				alert('삭제하시려면 비밀번호를 입력하세요');
				return ;
         	}
		
			var passwd =$("#passwd").val();
			if(passwd !='${vo.passwd}'){
		     	$("#passwd").focus();
				alert('비밀번호 오류입니다.');
				return ;
			}
			       
			//ajax
	         $.ajax({
	               type:"POST",
	               url: "/ORAI/ReviewView/review.do",
	               dataType:"html",
	               data:{
	                  "work_div":"do_delete",
	                  "seq":$("#seq").val()
	            },
	            success:function(data){
	            	var jData = JSON.parse(data);
	            	console.log(jData.msgId+"|"+jData.msgContents);
	            	if(null !=jData && jData.msgId=="1"){
	            		alert(jData.msgContents);
	            		window.location.href="/ORAI/ReviewView/review.do?work_div=do_retrieve";
	            	}else{
	            		alert(jData.msgId+"|"+jData.msgContents);
	            	}
	              // alert("success:" + data);
	            },complete:function(data){
	               
	            },error: function(xhr,status,error){
	            	 alert("error:" + error);
	            }
	            
	         });
	         //--ajax  	
		});
		
		//수정 
		$("#update_btn2").on('click',function(){
			//console.log("999999:"+${vo.passwd});
         	//alert('update_btn');
         	//validation
			var passwd =$("#passwd").val();
			if(null == passwd || passwd.trim().length == 0){
				$("#passwd").focus();
				alert('수정하시려면 비밀번호를 입력하세요');
				return ;
         	}
			var passwd =$("#passwd").val();
			if(passwd !='${vo.passwd}'){
		     	$("#passwd").focus();
				alert('비밀번호 오류입니다.');
				return ;
         	}
			var passwd =$("#passwd").val();
			if(passwd ='${vo.passwd}'){
		     	$("#passwd").focus();
		     	//alert('수정가능');
		     	$("#update_btn").css("display", "inline ");//보이게하기
		     	$("#reset_btn").css("display", "inline ");//보이게하기
		     	$("#update_btn2").hide();//수정버튼 사라지게 하기 
		     	$("#del_btn").hide();//삭제버튼 사라지게 하기 
		     	$("#title").removeAttr("readonly");//타이틀 수정 가능
		     	$("#contents").removeAttr("readonly");//내용 수정 가능 
		     	
         	}
        	
		//수정등록
		$("#update_btn").on('click',function(){
			//alert('writebtn');
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
				alert('내용를 입력 하세요.');
				return ;
			}   
			var room =$("#room").val();
			if(null == room || room.trim().length == 0){
				$("#room").focus();
				alert('예약번호를입력하세요');
				return ;
			}
			var passwd =$("#passwd").val();
			if(null == passwd || passwd.trim().length == 0){
				$("#passwd").focus();
				alert('비밀번호를 입력하세요');
				return ;
         	}
		
		    $("#work_div").val("do_update");//"do_update"값 세팅 
		    var param =$("#reviewfrm").serialize();
		   	//alert(param);
		   // alert($("#seq").val());
		    
         	if (false ==confirm('게시글을 수정하시겠습니까?')) return;
         	
		        //ajax
		        $.ajax({
		         type:"POST",
		         url:"/ORAI//ReviewView/review.do",
		         dataType:"html",
		         data: param, 
		        success: function(data){
		         var jData = JSON.parse(data);
		         if(null != jData && jData.msgId=="1"){
		          alert(jData.msgContents);
		          window.location.href="/ORAI//ReviewView/review.do?work_div=do_retrieve";
		          
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
		 $(document).ready(function(){
		 });
		      
		
     	 });
	
	</script>
	
</body>
</html>