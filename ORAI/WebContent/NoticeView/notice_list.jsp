

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
<%@page import="notice1.NoticeVO"%>
<%@page import="cmn.SearchVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%	Logger LOG = Logger.getLogger(this.getClass());
	//화면 목록읽기
	List<NoticeVO> list= (List<NoticeVO>)request.getAttribute("list");

	//param 선언
	String pageNum = "1";
    String searchDiv = "";
    String searchWord = "";
    String pageSize = "10";
    
  //paging
    int maxNum=0; //총 글수
    int currPageNo =1; //현재 페이지
    int rowPerPage =10; //row cnt 
    int bottomCount =10;//bottom cnt
    String  url = "/ORAI/NoticeView/notice.do";
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
<link rel="stylesheet" href="/ORAI/js/jquery-ui.css">
<link href="/ORAI/css/bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" href="/ORAI/image/favicon (1).ico" >
<title>Insert title here</title>
<script src="/ORAI/js/jquery-1.12.4.js"></script>
<script src="/ORAI/js/jquery-ui.js"></script> 
<script src="/ORAI/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" >
	<div class="page-header">
		<h3>공지사항</h3>
		  
	</div>
	<!-- 검색영역 -->
	<div class="table-responsive" style="padding-top:30px; padding-right:30px; padding-left:30px">
		<table id="listTable" class="table table-striped table-bordered table-hover" >
			<thead class="bg_primary">
				<tr>
					<th class="text-center col-sm-1 col-xs-1">NO</th>
					<th class="text-center col-sm-6 col-xs-6">제목</th>
					<th class="text-center col-sm-2 col-xs-2" >작성자</th>
					<th class="text-center col-sm-2 col-xs-2">작성일</th>
					<th class="text-center col-sm-1 col-xs-1">조회수</th>
					<th class="text-center col-sm-1 col-xs-1" style="display:none;">SEQ</th> 
				</tr>
			</thead>
			<tbody>
				<%
				if(null !=list && list.size()>0){
					for(NoticeVO vo:list){
				%>
					<tr>
						<td><%=vo.getNum() %> </td>
						<td ><%=vo.getTitle() %></td>
						<td><%=vo.getReg_id()%></td>
						<td><%=vo.getReg_dt()%></td>
						<td><%=vo.getRead_cnt()%></td>
						<td style="display:none;"><%=vo.getSeq()%></td>
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
	<!--버튼 -->
	</div>		
	<div class="row" >
			<div class="col-sm-5 col-sm-push-7">
				<form name="searchForm" action="/ORAI/NoticeView/notice.do"  method="post" class="form-inline">
				<input type="hidden" name="work_div" /> 
		 		<input type="hidden" name="page_num" />
					<div class="form-group" >
						<select name="search_div" id="search_div" class="form-control input-sm">
							<option value="">전체</option>
							<option value="10" <%if(searchDiv.equals("10"))out.print("selected"); %>>제목</option>
							<option value="20" <%if(searchDiv.equals("20"))out.print("selected"); %>>작성자</option>
						</select>	
							<input class="form-control input-sm" type="text" name="search_word" id="search_word" value="<%=searchWord %>"/>
						<select name="page_size" id="page_size" class="form-control input-sm">
							<option value="">전체</option>
							<option value="10"  <%if(pageSize.equals("10"))out.print("selected='selected' "); %>>10</option>
							<option value="50"  <%if(pageSize.equals("50"))out.print("selected='selected' "); %>>50</option>
							<option value="100" <%if(pageSize.equals("100"))out.print("selected"); %> >100</option>
						</select>
						<input type="button" class="btn btn-default btn-sm" value="검색" onclick="javascript:do_retrieve();"/>	
						</div>
						<div style="padding-top:20px; padding-right:0px; padding-left:320px">
						<input type="button" class="btn btn-primary btn-sm " style="display:none;" value="글쓰기" name="writebtn" id="writebtn" onclick="javascript:do_write_move();"/>	
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
		//페이지 이동
		function doSearchPage(url,page_num){
			//alert(url+","+page_num);	
			var frm = document.searchForm;
			frm.work_div.value ="do_retrieve";
			frm.page_num.value = page_num;
			frm.action = url;
			frm.submit(); 
		}
		//새 글 작성 
		function do_write_move(){
			//alert("do_save_move"); //연결유무 확인용
			if(confirm("새글을 작성하시겠습니까")==false)return;
			var frm = document.searchForm;
			frm.work_div.value ='do_write_move'; //단순이동
			frm.action = '/ORAI/NoticeView/notice.do';
			frm.submit(); //전송
		}
		//검색
		function do_retrieve(){
	 		//alert('do_retrieve');
	 		var frm = document.searchForm
	 		frm.work_div.value  ='do_retrieve';
	 		frm.page_num.value  ='1';
	 		frm.action		    = '/ORAI/NoticeView/notice.do';
	 		
	 		//alert('frm_work_div.value:'+frm.work_div.value);
	 		frm.submit();	
	 	}
		
		//단건조회
		$("#listTable>tbody").on("dblclick","tr",function(){
			var cTrs = $(this);
			var cTds = cTrs.children();
			console.log(cTds);
			var seq = cTds.eq(5).text();
			console.log("seq:"+seq);
			
			var frm = document.searchForm;
			frm.work_div.value ="do_selectone";
			frm.action = '/ORAI/NoticeView/notice.do?seq='+seq;
			frm.submit();
			
		});
		
		$(document).ready(function(){
			if("${admin}"=="Admin"){
				$("#writebtn").css("display", "inline ");//보이게하기
			}
		});
	</script>
</body>
</html>