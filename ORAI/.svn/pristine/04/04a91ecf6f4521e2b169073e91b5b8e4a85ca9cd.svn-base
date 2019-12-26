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
<%@page import="admin.AdminVO"%>
<%@page import="notice1.NoticeVO"%>
<%@page import="cmn.SearchVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% NoticeVO vo = (NoticeVO)request.getAttribute("vo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" href="/ORAI/image/favicon (1).ico">
<link href="/ORAI/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<script src="/WEB_EX01/js/jquery-1.12.4.js"></script>
<script src="/WEB_EX01/js/jquery-ui.js"></script> 
<script src="/ORAI/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="page-header">
		<h3>글 작성하기</h3>
	</div>
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
		frm.action ="/ORAI/NoticeView/notice.do";
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
		     url:"/ORAI/NoticeView/notice.do",
		     dataType:"html",
		     data: param,
		    success: function(data){
		     var jData = JSON.parse(data);
		     if(null != jData && jData.msgId=="1"){
		      alert(jData.msgContents);
		  	  window.location.href="/ORAI/NoticeView/notice.do?work_div=do_retrieve";
		      
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
		window.location.href="/ORAI/NoticeView/notice.do?work_div=do_retrieve";
	});	
	//뒤로가기
	$("#backbtn1").on('click',function(){
		window.location.href="/ORAI/NoticeView/notice.do?work_div=do_retrieve";
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
				url: "/ORAI/NoticeView/notice.do",
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
					window.location.href="/ORAI/NoticeView/notice.do?work_div=do_retrieve";
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
	     url:"/ORAI/NoticeView/notice.do",
	     dataType:"html",
	     data: param,
	    success: function(data){
	     var jData = JSON.parse(data);
	     if(null != jData && jData.msgId=="1"){
	      alert(jData.msgContents);
	  	  window.location.href="/ORAI/NoticeView/notice.do?work_div=do_retrieve";
	      
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
</body>
</html>