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
<%@page import="roominfo_bk.RoominfoVO"%>
<%@page import="cmn.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
RoominfoVO vo =(RoominfoVO)request.getAttribute("outVO");
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{
background-color: #F6F8FC;
}
div { text-align: center; }

table {
    width: 1200px;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 1px;
    text-align: center;
  }
  th {
    background-color: #bbdefb;
  }
  td {
    background-color: #e3f2fd;
  }

}

</style>
<link rel="stylesheet" href="/WEB_EX01/js/jquery-ui.css" >
<title>객실 정보</title>

<script src="/WEB_EX01/js/jquery-1.12.4.js"></script>
<script src="/WEB_EX01/js/jquery-ui.js"></script>

</head>
<body>
 <h3></h3>
 <hr/>
<div class ="ptitle">
		
	</div>
 <br><br>
 <div class="table-responsive">
					<table table style="margin-left: auto; margin-right: auto;" id="listTable"  class="table table-striped table-bordered table-hover">
						<thead class="bg_primary">
							<tr>
								<th class="text-center col-sm-1 col-xs-1">방이름</th>
								<th class="text-center col-sm-7 col-xs-7">수용인원</th>
								<th class="text-center col-sm-1 col-xs-1">방번호</th>
								<th class="text-center col-sm-1 col-xs-1">평일</th>
								<th class="text-center col-sm-1 col-xs-1">주말</th>
								<th class="text-center col-sm-1 col-xs-1">성수기</th>
								<th class="text-center col-sm-2 col-xs-2">정보</th>
																	
							</tr>
						</thead>
						<tbody>
							<%
								if(null != vo ){
								
							%>
									<tr>
										<td class="text-center"><%= vo.getRoom() %></td>
										<td class="text-center"><%= vo.getCapacity() %></td>
										<td class="text-center"><%= vo.getRnum() %></td>
										
										<td class="text-center"><%= vo.getWeekday() %></td>
										<td class="text-center"><%= vo.getWeekend() %></td>
										<td class="text-center"><%= vo.getSeason() %></td>
										<td class="text-center"><%= vo.getRinfo() %></td>
										
										
																	
									</tr>
							<%	
								   
								}else{  
							%>
									<tr>
										<td colspan="99">No data found</td>
									</tr>
							
							<%	}//--else %>
						</tbody>
					</table>
					<br><br>
					<img align="center" src="<%=vo.getR_image() %>" alt="My Image">
					<ul class="btn">
					
					</ul>
					
				</div>
				<br><br>
				<br><br>
				<br><br>
				<img alt="center" src="/ORAI/image/캡처.PNG">
 <script>

 $("#btn").click(function(){
		alert("play")
	})

 var content =' <%=vo.getRoom()%>'+'<%=vo.getRcode()%>'; 
 console.log(content);
  $(document).ready(function(){
  });
  
  
  
  
  
  
 </script>
</body>
</html>