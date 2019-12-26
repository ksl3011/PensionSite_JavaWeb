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


<%@page import="cmn.StringUtil"%>
<%@page import="cmn.SearchVO"%>
<%@page import="review.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

  	
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <%	
  	Logger LOG = Logger.getLogger(this.getClass());
  //화면 목록 
  	List<ReviewVO> list = (List<ReviewVO> )request.getAttribute("list");
  
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
    String  url = "/ORAI/ReviewView/review.do";
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
   <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
   <link rel="stylesheet" href="/WEB_EX01/js/jquery-ui.css">
   <!-- 부트스트랩 -->
   <link href="/WEB_EX01/css/bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" href="/ORAI/image/favicon (1).ico">
<title>Insert title here</title>
<script src="/WEB_EX01/js/jquery-1.12.4.js"></script>
<script src="/WEB_EX01/js/jquery.validate.js"></script>
<script src="/WEB_EX01/js/additional-methods.js"></script>
<script src="/WEB_EX01/js/messages_ko.js"></script>
<script src="/WEB_EX01/js/jquery-ui.js"></script> 
</head>
<body>

	<!--div container  -->
	<div class="container" >
	<!-- 제목 -->
	<div class="page-header">
		<h3>숙박후기</h3>
	</div>
	<!-- //제목 -->
	</div>
	
	<!-- 검색영역 -->
	<div class="table-responsive" style="padding-top:30px; padding-right:500px; padding-left:500px">
	    <div>
	       <input type="button" class="btn btn-primary btn-sm pull-right" value="글쓰기" onclick="javascript:do_save_move();"style="margin:10px ;table-layout: fixed;"/>
		   <input type="button" class="btn btn-primary btn-sm pull-right" id="backbtn1" value="메인화면" style="margin:10px"/>
		</div>
			<table id="listTable" class="table table-striped table-bordered table-hover" >
			  <thead class="bg_primary">
				<tr>
					<th class="text-center" value="10">NO</th>
					<th class="text-center" value="90">제목</th>
					<th class="text-center" value="20" >작성자</th>
					<th class="text-center" value="20">작성일</th>
					<th class="text-center" value="10">조회수</th>
					<th class="text-center" value="10" style="display:none;">SEQ</th> 
					<th class="text-center" value="5" id="rowCheckbox" >선택</th>
				</tr>
			</thead>
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
					<td  class="checkbox-inline-box" style="text-align:center;"id="rowCheck1"><input class="checkbox-inline"   type="checkbox" name="rowCheck"  id="rowCheck" value="${vo.getSeq}"/></td>
				</tr>
			<%
				     }//-for
				}else{  %>
				
				<tr>
					<td colspan="99">No data found</td>
				</tr>
			<% }//-else %>
			
		
	</table>
	</div>
	<!--// 그리드영역 -->
	
	<!-- data list -->
	<!--버튼 -->
	<div class="row">
		<div class="col-sm-5 col-sm-push-6">
			<form name="searchForm" action="/ORAI//ReviewView/review.do" class="form-inline" method="post">
			<input type="hidden" name="work_div" /> 
			<input type="hidden" name="page_num" />
				<div class="form-group">
					<select class="form-control input-sm" style="" name="search_div" id="search_div">
						<option value="">전체</option>
						<option value="10" <%if(searchDiv.equals("10"))out.print(""); %>>제목</option>
						<option value="20" <%if(searchDiv.equals("20"))out.print(""); %>>내용</option>							
						<option value="30" <%if(searchDiv.equals("30"))out.print(""); %>>작성자</option>
					</select>
						<input type="text" class="form-control input-sm" id="seacrch_word" name="search_word" value="<%=searchWord %>"placeholder="검색어">
	                <select name="page_size" id="page_size">
	                   	<option value="10"  <%if(pageSize.equals("10"))out.print("selected='selected' "); %> >10</option>
						<option value="50"  <%if(pageSize.equals("50"))out.print("selected='selected' "); %> >50</option>
						<option value="100" <%if(pageSize.equals("100"))out.print("selected"); %> >100</option>
					</select>
	                  <input type="button" class="btn btn-primary btn-sm " value="조회" style ="10px" onclick="javascript:do_retrieve();"/>
                      <input type="button" class="btn btn-primary btn-sm "   id="selectBtn" value="선택삭제" />
                      </div>                    
				</form>
			</div>
		</div>
		
	   <!-- paging -->      
            <nav class="text-center">
                  <ul class="pagination">
                     <li>
                        <%=StringUtil.renderPaing(maxNum, currPageNo, rowPerPage, bottomCount, url, scriptName) %>
                     </li>
                  </ul>
               </nav>
       <!-- //paging -->		
	 <script>
	
	 //메인페이지로
	 $("#backbtn1").on('click',function(){
		 
		window.location.href="/ORAI/admin/admin.json";
	 });	
	 function setCheckUserList(){

		 //체크된 체크박스의 값을 반복해 불러옴.
		checkbox.each(function(i) {
		// checkbox.parent() : checkbox의 부모는 td.
		// checkbox.parent().parent() : td의 부모는 tr.
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();
				
		var num = td.eq(5).text(); // td의 0번째는 번호
		var title = td.eq(1).text(); // td의 1번째는 title
				
			
		});
					
	}
			
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
	     url: "/ORAI/ReviewView/review.do",
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
	        window.location.href="/ORAI/ReviewView/review.do?work_div=do_retrieve";
	        }else{
	        //	alert(jData.msgId+"|"+jData.msgContents);
	        }
	        //alert("success:" + data);
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
		 frm.action  = '/ORAI/ReviewView/review.do';
		 frm.submit();
		 }
	 
	 	function do_retrieve(){
	 		//alert('do_retrieve');
	 		var frm = document.searchForm
	 		frm.work_div.value  ='do_retrieve';
	 		frm.page_num.value  ='1';
	 		frm.action		    = '/ORAI//ReviewView/review.do';
	 		
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
			frm.action = '/ORAI/ReviewView/review.do?seq='+seq;
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
			alert('notice');
			window.location.href="/ORAI/NoticeView/notice.do?work_div=do_retrieve";
		});	
	 	// 메세지 버튼 ->1:1->대화 (링크 추가요망 )
		$("#messenger_button").on('click',function(){
			alert('messenger');
			window.location.href="";
		});	
		// 달력 버튼 ->예약관리 (연결o)
		$("#adminre_button").on('click',function(){
			alert('adminre');
			window.location.href="/ORAI/AdminReView/adminRe.jsp";
		});	
		// R버튼 ->리뷰관리  (연결o)
		$("#review_button").on('click',function(){
			alert('review');
			window.location.href="/ORAI/ReviewView/review_list.jsp";
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
				
				$("#floating_action_btn	").css("display", "inline ");
			}else{//checkbox 줄 안보이게하기
				$("#selectBtn").hide();
				$(".checkbox-inline").hide();
				$(".checkbox-inline-box").hide();
				$("#rowCheckbox").hide();
				
			}
		});
		 	

	</script>
</body>
</html>