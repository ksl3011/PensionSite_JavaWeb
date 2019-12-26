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
<%@page import="reservation.ListVO"%>
<%@page import="roominfo_bk.RoominfoVO"%>
<%@page import="java.util.List"%>
<% List<ListVO> list = (List<ListVO>)request.getAttribute("list"); 
	String today=(String)request.getAttribute("today");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#calendar{
	padding-top:30px; 
	padding-left:100px; 
	width:600px; 
	height: 300px;
	margin-right: -1px;
	}
	#date{
	width:200px; 
	height: 50px;
	margin-left: 800px;}
	#list_table{
	margin-top:200px;
	text-align: center;
	}
	#button{
	margin-left: 770px;}
	#frmMng{
	width:1200px; 
	
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




	<div  id="calendar"></div>
	<div id=date class="date">
			<p id="day">선택하신 요일은 </p>
			<p class="date" id="nows"></p>
			<p>입니다.</p>
	</div>
	<form name="frmMng" id="frmMng" action="/ORAI/reservationctrl/reservationctrl.do" method="post" class="form-inline">
				<input type="hidden"  name="work_div"   />	
			<table id="list_table">
					<thead>
						<tr>
							<th width="8%">선택</th>
							<th width="50%">객실명</th>
							<th width="9%">기준/최대</th>
							<th width="11%">기간</th>
							<th width="9%">인원</th>
							<th width="13%">요금</th>
						
							<!-- style="visibility: hidden;" 공간차지 -->
							<!-- style="display: none;" 공간도 사라짐-->									
						</tr>
					</thead>
					<tbody>
				
					
				
								
					</tbody>
					
				</table>
				</form>
	
 
   <div>
      <input type="submit" id="paybtn" name="paybtn" value="다음 페이지" disabled/>
   </div>
	<script>
	//date 포멧 케스팅
	var today;
	Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var d = this;
	     
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
	
	$(document).ready(function() {
			
		

		
		  var date = new Date(); 
	      var d = date.getDate(); 
	      var m = date.getMonth(); 
	      var y = date.getFullYear(); 
	      var seasonin = new Date("2019-07-15");
	      var seasonout = new Date("2019-08-15");
	      var seasonin= seasonin.format("yyyy-MM-dd");
	      var seasonout= seasonout.format("yyyy-MM-dd");
		
	      
	    	 
	    	


	    	
		  var calendar = $('#calendar').fullCalendar({
			  header: {
				   right: "prev, next today"
			  },
		      titleFormat:{
		    	  month:'YYYY년 MM월'
		      },
		      
		      dayNamesShort: ['일','월', '화', '수', '목', '금', '토'],
		      dayClick: function(date,allDay, jsEvent, view) {
		    	  
		    	  if (moment().format('YYYY-MM-DD') === date.format('YYYY-MM-DD') || date.isAfter(moment())) {
		    			//alert('Clicked on: ' + date.format());
		    			var yyyy =date.format("YYYY");
		    			var mm=date.format("MM");
		    			var dd=date.format("DD");
		    			var ss=date.format("dd");
		    			onchangeDay(yyyy,mm,dd);
		    			
			    	    today=date.format();
			    	    var weekend=ss;
			    	   console.log(ss);
// 			    	    var frm = document.frmMng;
// 			    	 	frm.work_div.value ="do_retrieve";
// 			    	 	frm.action = '/ORAI/reservationctrl/reservationctrl.do?today='+date.format();
// 			    	 	frm.submit();
			    	 	
			    	 	$.ajax({
			    	 
			                type:"POST",
			                url:"/ORAI/reservationctrl/reservationctrl.do",
			                dataType:"html",
			                data:{
								"work_div":"do_retrieve",
								"today":today
						    },  
						    success: function(data){
						    var jData = JSON.parse(data);
					             
					              var event_data = '';
					              //tbody 비우기.
					              $("#list_table>tbody").empty();
					              $.each(jData,function(index, value){
					            	  
					                   event_data += '<tr>';
					                   event_data += '<td class="text-center"><input class="checkbox" type="checkbox" name="checkbox" id="checkbox" value="'+index+'" >';
					                   event_data += '<td><input type="text" name="room" id="room" value="'+value.room+'" readonly style="background-color:transparent;border:0 solid black;text-align:center ;" /></td>';
					                   event_data += '<td><input type="text" name="capacity" id="capacity" value="'+value.capacity+'" readonly style="background-color:transparent;border:0 solid black;text-align:center ;"  /></td>';
					                   event_data += '<td class="text-center">';
					                   event_data += '<select name="period" id="period"  class="form-control input-sm">';
					                   for(var i=1;i<=6;i++){
					                   event_data += '<option value="'+i+'">'+i+'박'+(i+1)+'일</option>';
					                   }
					                   event_data += '</select></td>';
					                   event_data += '<td><select name="pnum" id="pnum"  class="form-control input-sm">';
					                  
					                   var count=value.capacity +0;
					                   for(var i=1;i<=count;i++){
					                	   event_data +='<option value="'+i+'">'+i+'명</option>' ;  
					                   }
					                   event_data += '</select></td>';
					                 if(today>seasonin&&today<seasonout){
					                	 event_data += '<td><input type="text" name="pay" id="pay" value="'+value.season+'" readonly style="background-color:transparent;border:0 solid black;text-align:center;" /></td>';
					                 }
					                 else if(weekend=="Su"||weekend=="Sa"){
					                	 event_data += '<td><input type="text" name="pay" id="pay" value="'+value.weekend+'" readonly style="background-color:transparent;border:0 solid black;text-align:center;" /></td>';
					                 }
					                 else{
					                	 event_data += '<td><input type="text" name="pay" id="pay" value="'+value.weekday+'" readonly style="background-color:transparent;border:0 solid black;text-align:center;" /></td>';
					                 }

 					                 event_data += '<td><input type ="hidden" name="icode" id="icode" value="'+value.icode+'"  /></td>'; 
 					                event_data += '<td><input type ="hidden" name="rcode" id="rcode" value="'+value.rcode+'"  /></td>'; 
					                   event_data += '</tr>';
					                   
					              });
					         
					              $("#list_table>tbody").append(event_data);
					              
					          },
					          error: function(d){
					              /*console.log("error");*/
					              alert("404. Please wait until the File is Loaded.");
					          }
					      });     
					 
						//--ajax     	
			    	    $("#not").html("");
			    	   
		    	    } else {
		    	    	 $("#not").html("선택할 수 없는 요일");
		    	    	 $("#not").css('font-weight', 'bold');
		    			 $("#not").css('color', 'red');
		    			 $("#nows").html("");
		    			
		    	    }
		    	 
		    	   
		    	  function onchangeDay(yy,mm,dd,ss){ 
		 			 $("#nows").html(yy+"년"+mm+"월"+dd+"일");
		 			 $("#nows").css('color', 'red');
		 			 $("#nows").css('font-weight', 'bold');
		 			 $("#day").html(weekend);
		 			}
		    	  
		    	 
				
	
		    		
		    	    
		    	    
		      }
	  
		  })
		





			
		 
		 
	
		
		
	    });
	
	

	   function check(){
		      if($("input:checkbox[name=checkbox]").is(":checked")==true){
		         paybtn.disabled=false
		      }else{
		    	  paybtn.disabled=true
		      }
		      
		   }
	$(document).on("click","#checkbox", function() {
		  $(".checkbox").prop("checked", false); //uncheck all checkboxes
		  $(this).prop("checked",true);  //check the clicked one
		  check()
		})

   var rowData = new Array();
	$("#paybtn").on('click',function(){
	  	console.log("length: "+$("input:checkbox[name=checkbox]:checked").length);
	    //체크된 체크박스 가져오기
	    var checkboxin= $("input:checkbox[name=checkbox]");
		    checkboxin.each(function(i,elements){
		    	if($(this).is(':checked')){
		    		//console.log("$(this)"+$(this).val());
		    		rowData = new Array();
		    		//선택되는 요소
		    		index=$(elements).index("input:checkbox[name=checkbox]")
		    		
		    		var rv = new Object;
		    		rv.room= $("input[name='room']")[index].value; //방이름
					rv.period= $("select[name='period']")[index].value;//기간
		    		rv.pnum= $("select[name='pnum']")[index].value;//예약자 인원
		    		rv.pay= $("input[name='pay']")[index].value;//요금	
		    		rv.icode= $("input[name='icode']")[index].value;//아이템 코드
		    		rv.rcode= $("input[name='rcode']")[index].value;//방코드
			        rv.today=today;
			        rowData.push(rv.room);
			    	rowData.push(rv.period);
			      	rowData.push(rv.pnum);
			      	rowData.push(rv.pay);
			    	rowData.push(rv.icode);
			    	rowData.push(rv.today);
			    	rowData.push(rv.rcode);
			      	console.log("rowData:"+rowData);
			        
			      //"work_div":"do_insert",
		            $("#work_div").val("do_insert_temp"); //"do_insert" 세팅
		            var jsonData = JSON.stringify(rowData);
		            $.ajax({
		                  type:"POST",
		                  url: "/ORAI/reservationctrl/reservationctrl.do",
		                  dataType:"html",
		                  data:{
		                	  "work_div":"do_insert_temp",
		                	  "jrowData" : jsonData
		                  },
		             success: function(data){
		            	 console.log(typeof data);
		            	var jData = JSON.parse(data);
		              
 		               window.location.href='/ORAI/reservationctrl/reservationctrl.do?work_div=do_nextpage&jData='+jData;
		              
		              
		             },
		             complete:function(data){
		              
		             },
		             error:function(xhr,status,error){
		              alert("error:"+error);
		             }
		               }); 
		            //--ajax 
		            
		            
		          
		            
		         
		            
		    	}//checked
		    })//checkboxin.each
	           	  
	  });//updatebtn	




	
	</script>
</body>
</html>