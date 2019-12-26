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
<%@page import="review.ReviewVO"%>
<%@page import="reservation.ReservationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
    ReservationVO rvo = (ReservationVO)request.getAttribute("rvo");
    ReviewVO rvvo	  = (ReviewVO) request.getAttribute("rvvo");
    %>
   

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
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
<title>숙박후기 </title>
<script src="/WEB_EX01/js/jquery-1.12.4.js"></script>
<script src="/WEB_EX01/js/jquery-ui.js"></script> 
</head>
<body>
<div class="container">
	<div class="page-header" style="padding-right:500px; padding-left:500px" >
		<h3>숙박후기 작성하기</h3>
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
						 <td><input type="hidden" name="seq" id="seq" value="${vo.getSeq()}" ></td>
					</tr>	
				</thead>
					<tr>
						 <td>
						 	<label>작성자</label> &emsp;&emsp; <input type="text" name="reg_id" id="reg_id" size="20" maxlength="20"/>
							&emsp; <label>투숙객실(지금코드로뜸)</label>&emsp;<input type="text" name="room" id="room" placeholder="예약번호를 입력하세요" maxlength="20"/></td>
						
					</tr>
					<tr>
						<td><input type="text" name="title" id="title" value="${vo.getTitle()}" placeholder="글 제목"  maxlength="50"/></td>
					</tr>
					
					<tr>
						<tr>
						 <td><textarea id="contents" name="contents" placeholder="내용" maxlength="2048"  style="margin-top:20px">${vo.getContents()}</textarea></td>
						</tr>
						
						<tr>
						<td><label>비밀번호</label> &emsp;<input type="text" name="passwd" id="passwd" "size="20" maxlength="20"/></td>			
						</tr>
				</tbody>
			</table>
		</form>
			<!-- button area -->
			<div style=padding:10px;>
				<input  type="button" id="savebtn" value="등록"  />
				<input type="button" id="backbtn1" value="뒤로가기" />	
			</div>
	<!--// button area -->
		</div>
	</div>	
	</div>
	</div>
	 <script>
	//등록
		$("#savebtn").on('click',function(){
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
				alert('내용을 입력 하세요.');
				return ;
			}   
			var room =$("#room").val();
			if(null == room || room.trim().length == 0){
				$("#room").focus();
				alert('예약번호를 입력하세요');
				return ;
			}
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
		     url:"/ORAI/ReviewView/review.do",
		     dataType:"html",
		     data: param,
		    success: function(data){
		     var jData = JSON.parse(data);
		     if(null != jData && jData.msgId=="1"){
		      alert(jData.msgContents);
		  	  window.location.href="/ORAI/ReviewView/review.do?work_div=do_retrieve";
		      
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
			 
			window.location.href="/ORAI/ReviewView/review.do?work_div=do_retrieve";
		 });	
		      
		       
		 $(document).ready(function(){
		 });
		      
	
	</script>
	
</body>
</html>