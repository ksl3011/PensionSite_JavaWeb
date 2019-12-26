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
<%@page import="reservation.TempVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%TempVO tempVO = (TempVO)request.getAttribute("vo"); %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

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
div{
    text-align:center;
}

}

</style>
<link rel="stylesheet" href="/WEB_EX01/js/jquery-ui.css" >
<title>Insert title here</title>
<script src="/WEB_EX01/js/jquery-1.12.4.js"></script>
<script src="/WEB_EX01/js/jquery-ui.js"></script>
</head>
<body>
 <h3>온라인 객실예약</h3>
 <hr/>
<div>
	<table table style="margin-left: auto; margin-right: auto; ">
		<h3 align="center">객실 이용 현황</h3>
		<tr>
			
			<td>객실명</td>
			<td>이용일자</td>
			<td>기간</td>
			<td>인원</td>
			<td>객실요금</td>
		</tr>
		<tr>
			<td><%=tempVO.getROOM() %></td>
			<td><%=tempVO.getTODAY() %></td>
			<td><%=tempVO.getPERIOD()%>박<%=tempVO.getPERIOD()+1%>일</td>
			<td><%=tempVO.getPNUM() %></td>
			<td><%=tempVO.getPAY() %></td>
		</tr>
		
	</table>

</div>
<br><br><br><br><br>
<div>
	<table style="margin-left: auto; margin-right: auto; ">
	<h3 align="center">최종 결제 금액</h3>
		<tr>
			<td>총 이용요금</td>
			<td><%=tempVO.getPAY() %></td>
			
		</tr>
		<tr>
			<td>예약금</td>
			<td><%=tempVO.getPAY()/5 %></td>
			
		</tr>
		<tr>
			<td>결제방법</td>
			<td><input type="radio">무통장입금</td>
			
		</tr>
	</table>
</div>
<br><br><br><br><br>
<div>
	<table style="margin-left: auto; margin-right: auto; ">
	<h3 align="center">예약자정보입력</h3>
		<tr>
			<td>예약자명</td>
			<td><input id="rname" name="rname"  type="text" ></td>
			
		</tr>
		<tr>
			<td>핸드폰</td>
			<td><select name="phone" id="phone">
  				<option value="010">010</option>
  				<option value="011">011</option>
  				<option value="016">016</option>
  				<option value="017">017</option>
  				<option value="018">018</option>
  				<option value="019">019</option>
  				<option value="019" selected="selected">선택</option>
				</select>
				-<input type="text" id="mp" name="mp"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'')">-<input type="text" id="lp" name="lp" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
			
		</tr>
	
		
		
	</table>
</div>
<br><br>
<div>
		<button id="btn" align="center" >이전단계</button> 
		<button id="btn2" align="center">예약하기</button>
</div>

 <script>
 	
 	
 	$(document).ready(function() {
 		
 	})
 	 $("#btn").on('click',function(){
 		 window.location.href="/ORAI/ReservationView/Reservation.jsp";
 	 })
 	 $("#btn2").on('click',function(){
        	//alert('save_btn');
        	//validation:필수 check
        	var rname = $("#rname").val();
			if(null == rname || rname.trim().length == 0){
				$("#rname").focus();
				alert('얘약자명을(를) 입력 하세요.');
				return ;
			} 
			var phone = $("#phone").val();
			var mp=$("#mp").val();
			var lp=$("#lp").val();
			if(null == phone || phone .trim().length  == 0 ||null == mp || mp.trim().length==0||null == lp || lp.trim().length==0){
				$("#phone").focus();
				alert('전화번호를(를) 입력 하세요.');
				return ;
			}
        	
        	
        	
			
			
			//alert(param);
			
        	if( false==confirm(rname+'을(를)\n예약 하시겠습니까?'))return;
        	rowData = new Array();
    		//선택되는 요소
    		    		
    		var rv = new Object;
    		rv.rcode= "<%=tempVO.getRcode()%>"
    		rv.pnum=<%=tempVO.getPNUM()%>
    		rv.today= "<%=tempVO.getTODAY()%>"
    		rv.period=<%=tempVO.getPERIOD()%>
    		rv.pay=<%=tempVO.getPAY()%>
    		rv.icode=<%=tempVO.getICODE()%>
    		rv.name= document.getElementById("rname").value; 
    		rv.phone=document.getElementById("phone").value+"-"+document.getElementById("mp").value+"-"+document.getElementById("lp").value;
	        rowData.push(rv.rcode);
	    	rowData.push(rv.pnum);
	      	rowData.push(rv.today);
	      	rowData.push(rv.period);
	    	rowData.push(rv.pay);
	    	rowData.push(rv.icode);
	    	rowData.push(rv.name);
	    	rowData.push(rv.phone);
	      	console.log("rowData:"+rowData);
    		
	      	$("#work_div").val("do_insert");//"do_insert" set
	      	 var jsonData = JSON.stringify(rowData);
        	//ajax
            $.ajax({
               type:"POST",
               url:"/ORAI/reservationctrl/reservationctrl.do",
               dataType:"html",
               data:{
             	  "work_div":"do_insert",
             	  "jrowData" : jsonData
               },

            success: function(data){
              var jData = JSON.parse(data);
              if(null != jData && jData.msgId=="1"){
                alert(jData.msgContents);
                window.location.href="/ORAI/ReservationView/Reservation.jsp";
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
 	
  
 </script>
</body>
</html>