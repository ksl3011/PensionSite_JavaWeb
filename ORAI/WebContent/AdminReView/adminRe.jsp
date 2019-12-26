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
<%@page import="admin_re.AdminReVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   Logger LOG = Logger.getLogger(this.getClass());
   //화면 목록읽기
   List<AdminReVO> list= (List<AdminReVO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
   #calendar{
   padding-top:50px; 
   width:600px; 
   height: 300px;
   margin-left:400px;
   }
   #pdate{
      width:200px; 
      height: 50px;
      margin-left: 1070px;
      margin-bottom: 80px;
   }
   #listTable{
   margin-top:200px;
   margin-left:300px;
   margin-right:300px;
   text-align: center;
   
   }
   .fc-day-number.fc-sat { color:#0000FF; }     /* 토요일 */
   .fc-day-number.fc-sun { color:#FF0000; }    /* 일요일 */
</style>
<link rel="stylesheet" href="/ORAI/js/jquery-ui.css">
<link rel="stylesheet" href="/ORAI/fullcalendar-2.7.3/fullcalendar.css">
<link rel="stylesheet" href="/ORAI/fullcalendar-2.7.3/fullcalendar.min.css">
<link rel="shortcut icon" href="/ORAI/image/favicon (1).ico" >
<title>예약관리</title>
<script src="/ORAI/js/jquery-1.12.4.js"></script>
<script src="/ORAI/js/bootstrap.min.js"></script>
<script src="/ORAI/fullcalendar-2.7.3/lib/moment.min.js"></script>
<script src="/ORAI/js/jquery-ui.js"></script> 
<script src="/ORAI/fullcalendar-2.7.3/fullcalendar.min.js"></script> 
<script src="/ORAI/fullcalendar-2.7.3/fullcalendar.js"></script> 
</head>
<body>
   <div id="calendar"></div>
   <div id="pdate">
      <h5>선택하신 요일은</h5>
      <h5 class="date" id="nows"></h5>
      <h5>입니다.</h5>
   </div>
   
   <form name="searchForm" action="/ORAI/admin_re/adminrectrl.do"  method="post" class="form-inline">
   <input type="hidden" name="work_div"/> 
   <table id="listTable" class="table table-striped table-bordered table-hover" >
      <thead>
         <tr>
            <th width="8%">선택</th>
            <th width="15%">객실명</th>
            <th width="20%">예약자명</th>
            <th width="10%">숙박인원</th>
            <th width="27%">숙박기간</th>
            <th width="12%">요금</th>   
            <th width="10%">결제여부</th>         
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${list.size()>0}">
               <c:forEach var="vo" items="${list}">
                  <tr>
                     <td> 
                        <input type="checkbox" id="checkno" name="checkno" value="${vo.payCode}"/>
                     </td>
                     <td class="text-center"><c:out value="${vo.room}"/></td>
                     <td class="text-center"><c:out value="${vo.rname}"/></td>
                     <td class="text-center"><c:out value="${vo.pnum}"/></td>
                     <td class="text-center"><c:out value="${vo.sdate}"/>~<c:out value="${vo.edate}"/></td>
                     <td class="text-center"><c:out value="${vo.weekday}"/></td>
                     <td class="text-center">
                        <select name="pay" id="pay" class="form-control input-sm" onchange="${vo.pState}.value">
                           <option value="1" <c:if test="${vo.pState=='1'}"> selected</c:if>>결제</option>
                                   <option value="0" <c:if test="${vo.pState=='0'}"> selected</c:if>>미결제</option>
                        </select>
                     </td>
                  </tr>   
                  
               </c:forEach>
             </c:when>
         </c:choose>         
      </tbody>
      </table>
   </form>
   <div>
      <input type="submit" id="updatebtn" name="updatebtn" value="수정" disabled/>
   </div>
   <script>
   //체크박스 눌러야 수정버튼 활성화 되는 것
   function check(){
      if($("input:checkbox[name=checkno]").is(":checked")==true){
         updatebtn.disabled=false
      }else{
         updatebtn.disabled=true
      }
      
   }
 	//수정버튼 한번만 클릭
 	 $("#updatebtn").one('click',function(){
 		 if(false==confirm('결제여부를 수정하시겠습니까?')) return;
 		 alert("수정되었습니다"); 
 		 history.go(0);
 	 });
 	
   var rowData = new Array();
  //수정버튼 
  $("#updatebtn").on('click',function(){
  	console.log("length: "+$("input:checkbox[name=checkno]:checked").length);
    //체크된 체크박스 가져오기
    var checkboxin= $("input:checkbox[name=checkno]");
	    checkboxin.each(function(i,elements){
	    	if($(this).is(':checked')){
	    		//console.log("$(this)"+$(this).val());
	    		rowData = new Array();
	    		//선택되는 요소
	    		index=$(elements).index("input:checkbox[name=checkno]")
	    		
	    		var pay = new Object;
	    		pay.code= $("input[name='payCode']")[index].value; //결제번호
		        pay.state= $("select[name='pay']")[index].value;//결제 여부
		        console.log("pay.code:"+pay.code);
		        console.log("pay.state:"+pay.state);
		        
		        rowData.push(pay.code);
		      	rowData.push(pay.state);
		      	console.log("rowData:"+rowData);
		      	
		      //"work_div":"do_update",
	            $("#work_div").val("do_update"); //"do_update" 세팅

	            
	            //객체를 json으로 만듬
		        var jsonData = JSON.stringify(rowData);
	         	console.log("jsonData"+jsonData);
	         	
	            //ajax
	             $.ajax({
	                  type:"POST",
	                  url: "/ORAI/admin_re/adminrectrl.do",
	                  dataType:"JSON",
	                  data:{
	                	  "work_div":"do_update",
	                	  "jrowData" : jsonData
	                  },
	             success: function(data){
	            
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
           	           	  
   
   
   //달력 클릭할 때 날짜 띄우기 
   $(document).ready(function() {
       function onchangeDay(yy,mm,dd){ 
          
          $("#nows").html(yy+"년"+mm+"월"+dd+"일");
          $("#nows").css('color', 'red');
          $("#nows").css('font-weight', 'bold');
          
         }
/*         var date = new Date(); 
         var d = date.getDate(); 
         var m = date.getMonth(); 
         var y = date.getFullYear();  */
        
        // page is now ready, initialize the calendar...
        var calendar = $('#calendar').fullCalendar({
           header: {
               right: "prev, next today"
           },
            titleFormat:{
               month:'YYYY년 MM월'
            },
            dayClick: function(date, jsEvent, view) {
          
                 //alert('Clicked on: ' + date.format());
                 var yy=date.format("YYYY"); //년
                 var mm=date.format("MM"); //월
                 var dd=date.format("DD");//일 
                 onchangeDay(yy,mm,dd);
                 
                 var date= date.format();
                 console.log("date:"+date);
                 //$(this).css('background-color', 'red');
                //ajax
               $.ajax({
                     type:"POST",
                     url: "/ORAI/admin_re/adminrectrl.do",
                     dataType:"html",
                     data:{
                        "work_div":"do_retrieve",
                        "today":date
                  },
                  success:function(data){
                     var jData =JSON.parse(data);
                     console.log(jData);
                     var event_data = '';
                           //tbody 비우기.
                          $("#listTable>tbody").empty();
                          $.each(jData,function(index, value){
                              var pState=value.pState+"";
                             // var payCode=value.payCode+"";
                              //var pState = '<c:out value="${value.pState}"/>';
                              //console.log(value.payCode);
                               event_data += '<tr>';
                               event_data += '<td><input type="checkbox"  id="checkno" name="checkno" onClick="check();"></td>';
                               event_data += '<td>'+value.room+'</td>';
                               event_data += '<td>'+value.rname+'</td>';
                               event_data += '<td>'+value.pnum+'</td>'; 
                               event_data += '<td>'+value.sdate+'~'+value.edate+'</td>';
                               event_data += '<td>'+value.weekday+'</td>';
                               event_data += '<td><select name=\"pay\" class=\"pay\">'
                                               if(pState == '1'){ 
                                                   event_data  +="<option  value='1' selected>결제</option>"; 
                                                   event_data  +="<option  value='0' >미결제</option>" 
                                             } else { 
                                                   event_data  +="<option  value='1' >결제</option>" 
                                                   event_data +="<option  value='0' selected>미결제</option>"; 
                                              }  
                               //event_data += "<option value='1' "+(pState==1)? "selected":""+">결제</option>"
                               //event_data += "<option value='0' "+(pState==0)? "selected":""+">미결제</option>"
                               event_data += '</select></td>';
                               event_data += '<td><input name="payCode" id="payCode" type="hidden" value=\"'+value.payCode+'\" ></td>';
                               event_data += '</tr>';
                               
                              
                          }); 
                          $("#listTable>tbody").append(event_data);
      
                  },complete:function(data){
                  
                  },error: function(xhr,status,error){
                     alert("error:"+error);
                  }
               }); 
               //--ajax      

            },dayNamesShort: ['일','월', '화', '수', '목', '금', '토']
             
          
        })

      });


   </script>
</body>
</html>