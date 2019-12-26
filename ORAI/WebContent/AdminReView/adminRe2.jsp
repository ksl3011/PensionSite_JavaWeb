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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#container{
	padding-top:30px; 
	padding-left:250px; 
	padding-right:500px;
	width:600px; 
	height: 300px;
	}
	.form-inline{
		padding-left: 900px;
		margin-bottom: 900px;
	}

</style>
<link rel="stylesheet" href="/ORAI/js/jquery-ui.css">
<link rel="stylesheet" href="/ORAI/fullcalendar-2.7.3/fullcalendar.css">
<link rel="stylesheet" href="/ORAI/fullcalendar-2.7.3/fullcalendar.min.css">
<link rel="shortcut icon" href="/ORAI/image/favicon (1).ico" >
<title>Insert title here</title>
<script src="/ORAI/js/jquery-1.12.4.js"></script>
<script src="/ORAI/js/bootstrap.min.js"></script>
<script src="/ORAI/fullcalendar-2.7.3/lib/moment.min.js"></script>
<script src="/ORAI/js/jquery-ui.js"></script> 
<script src="/ORAI/fullcalendar-2.7.3/fullcalendar.min.js"></script> 
<script src="/ORAI/fullcalendar-2.7.3/fullcalendar.js"></script> 

</head>
<body>
<div id='container'>
	<div id="calendar"></div>
</div>

	<div class="form-inline">
		<h5>선택하신 요일은</h5>
		<h5 class="date" id="nows"></h5>
		<h5 class="not" id="not"></h5>
		<h5>입니다.</h5>
	</div>
	
	<script>
	
	$(document).ready(function() {
		 function onchangeDay(yyyy,mm,dd){ 
			 $("#nows").html(yyyy+"년"+mm+"월"+dd+"일");
			 $("#nows").css('color', 'red');
			 $("#nows").css('font-weight', 'bold');
			}
		  var date = new Date(); 
	      var d = date.getDate(); 
	      var m = date.getMonth(); 
	      var y = date.getFullYear(); 
	     
		  // page is now ready, initialize the calendar...
		  var calendar = $('#calendar').fullCalendar({
			  header: {
				   right: "prev, next today"
			  },
		      titleFormat:{
		    	  month:'YYYY년 MM월'
		      },
		      dayClick: function(date, jsEvent, view) {
		    	  if (moment().format('YYYY-MM-DD') === date.format('YYYY-MM-DD') || date.isAfter(moment())) {
		    			//alert('Clicked on: ' + date.format());
		    			var yyyy =date.format("YYYY");
		    			var mm=date.format("MM");
		    			var dd=date.format("DD");
			    	    onchangeDay(yyyy,mm,dd);
			    	    $("#not").html("");
			    	    
		    	    } else {
		    	    	 $("#not").html("선택할 수 없는 요일");
		    	    	 $("#not").css('font-weight', 'bold');
		    			 $("#not").css('color', 'red');
		    			 $("#nows").html("");

		    	    }
		    	 
		    	    
		      }, 
		      
		    
		  })

		});
	

	</script>
</body>
</html>