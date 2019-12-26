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
<%@page import="java.util.List"%>
<%@page import="roominfo_bk.ImgVO"%>
<%@page import="roominfo_bk.RoominfoVO"%>
<%@page import="cmn.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
RoominfoVO vo =(RoominfoVO)request.getAttribute("outVO");
ImgVO vo2 = (ImgVO) request.getAttribute("outVO2");

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
					</div>
		  <CENTER>
<TABLE border="0" cellpadding="3" bgcolor="#000000" width="300">
	<TR height="300">
		<TD align="center">
	<!-- 맨처음 보여줄 이미지 설정 -->
	
	<img align="center" src="<%=vo2.getImg1() %>" name="gallery">
		</TD>
	</TR>
	<TR>
		<TD align="center">
		<FORM name="menu">


				

				
 <script type="text/javascript">
 
 		
		var photos = new Array();
		var which = 0;

		// 보여줄 이미지들을 아래의 방법으로 설정
		
		var photos=['<%=vo2.getImg1()%>','<%=vo2.getImg2()%>','<%=vo2.getImg3()%>','<%=vo2.getImg4()%>','<%=vo2.getImg5()%>','<%=vo2.getImg6()%>',];
				
		
		function backward()

		{
			if (which > 0) {
				which--;
				document.images.gallery.src = photos[which];
			}
		}

		function forward() {
			if (which < photos.length - 1) {
				which++;
				document.images.gallery.src = photos[which];
			}
		}
	</SCRIPT>

<INPUT type="button" value="<<이전" class="B2" onClick="backward();" onFocus="this.blur();" >
<INPUT type="button" value="처음으로" onClick="which=1; backward();" onFocus="this.blur();">
<INPUT type="button" value=">>다음" class="B1" onClick="forward();" onFocus="this.blur();">
</FORM>
</TD>
</TR>
</TABLE>
</CENTER>
</body>
</html>