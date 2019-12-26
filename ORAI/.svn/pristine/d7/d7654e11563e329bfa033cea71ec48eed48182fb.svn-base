<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
body{
   	background-size: cover;
   	background-repeat: no-repeat;
   	
}

#leftmenuArea{margin-top:70px; height:750px; 
	width:1200px; background-color:#3e3d3d; 
	font-family:'Malgun Gothic',Dotum,AppleGothic,sans-serif;
	opacity: 0.9; 
	
}
.siteMapBtn p {
   position: absolute;
   top: 10px;
   left: 20px;
   z-index: 1;
   display:block;
   font-size:3em;
   color: black;
   cursor: pointer;
   transform: translate3d(0, 0, 0);
   transition: transform .4s;
}
.ptitle{
	 position: absolute;
	 top: 670px;
   	 left: 50px;
   	 font-size: 30px;
   	 color: white;
}
.pname{
	 position: absolute;
	 top: 720px;
   	 left: 50px;
   	 font-size: 60px;
   	 color: white;
}
.form-group{
	 padding-top: 300px;
	 padding-left: 50px;
}
h{
	left: 50px;
	color: white;
	font-size: 40px;
    padding-left: 40px;
    padding-bottom: 20px;
   

}
.form-group b{
	left: 50px;
	color: #00dbde;
	font-size: 40px;
	padding-left: 50px;

}
#login{
	position: right;
	
}
</style>
<link rel="stylesheet" href="/ORAI/js/jquery-ui.css">
<link href="/ORAI/css/bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" href="/ORAI/image/favicon (1).ico" >
<title>쌍용부띠끄펜션</title>
<script src="/ORAI/js/jquery-1.12.4.js"></script>
<script src="/ORAI/js/jquery-ui.js"></script> 
<script src="/ORAI/js/bootstrap.min.js"></script>
</head>
<body background= "https://q-ak.bstatic.com/images/hotel/max1024x768/109/109705858.jpg" >
<!-- 로그인 -->
	<div id="login" align="right">
		<input id="login" type="button" value="로그인" action="authentication.jsp"/> 
		<input id="logout" type="button" value="로그아웃" action="logout.jsp"/> 
	</div>
<!-- //로그인 -->	
	<div class="siteMapBtn" >
		<p style="margin:0;" >&equiv; 메뉴</p>
		<p style="display:none;margin:0;">&equiv; 메뉴</p>
	</div>
	<div class ="ptitle">
		<p><b>아름다운 동해안의 자연환경 속 힐링여행</b> </p>
	</div>
	<div class ="pname">
		<p><b>PENSION SSANGYOUNG</b></p>
	</div>
	<div id="leftmenuArea">
	<form name="searchFrm" id="searchFrm" action="/ORAI/roominfoctrl/roominfoctrl.do" method="post" class="form-inline">
				<input type="hidden"  name="work_div"   />
		<div class="form-group">
				<b >WELCOME &nbsp; &nbsp; &nbsp; </b>
				<h id="play">주변여행지 </h>
				<h id="howtogo"> 오시는길 </h><br/>
				
				<b>VILLA &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</b>
				<h id="roominfo_java">JAVA</h>
				<h id="roominfo_oracle">ORACLE</h>
				<h id="roominfo_jsp">JSP</h>
				<h id="roominfo_spring">SPRING</h>
				<h id="roominfo_html">HTML</h><br/>
				
				
				<b>RESERVATION &nbsp;</b>
				<h id="reservation"> 실시간예약   </h>
				<h id="checkres">예약확인  &nbsp;</h><br/>
				
				<b>COMMUNITY &nbsp;&nbsp;</b>
				<h id="notice">공지사항  &nbsp;</h>
				<h id="review">숙박후기 </h><br/>		
		</div>
		</form>
	</div>
			
</body>
<script>
//메뉴 버튼 누르면 메뉴 나오게 하기 
$(document).ready(function(){
    $("#leftmenuArea").hide();
    $(".siteMapBtn").click(function(){
       $(".siteMapBtn p").toggle();
    $('#leftmenuArea').animate({width:'toggle'});
    })
})	
//주변 여행지
$("#play").click(function(){
	var frm = document.searchFrm;
	frm.work_div.value ="post";
	frm.action = '/ORAI//sightsctrl/sightsctrl.do?rcode='+'1001-101';
	frm.submit(); 
})

//오시는 길
$("#howtogo").click(function(){
	alert("togo")
})

//객실정보
$("#roominfo_java").click(function(){
	var frm = document.searchFrm;
	frm.work_div.value ="post";
	frm.action = '/ORAI/roominfoctrl/roominfoctrl.do?rcode='+'1001-101';
	frm.submit(); 
})
$("#roominfo_oracle").click(function(){
	var frm = document.searchFrm;
	frm.work_div.value ="post";
	frm.action = '/ORAI/roominfoctrl/roominfoctrl.do?rcode='+'1001-102';
	frm.submit(); 
})
$("#roominfo_jsp").click(function(){
	var frm = document.searchFrm;
	frm.work_div.value ="post";
	frm.action = '/ORAI/roominfoctrl/roominfoctrl.do?rcode='+'1001-103';
	frm.submit(); 
})
$("#roominfo_spring").click(function(){
	var frm = document.searchFrm;
	frm.work_div.value ="post";
	frm.action = '/ORAI/roominfoctrl/roominfoctrl.do?rcode='+'1001-104';
	frm.submit(); 
})
$("#roominfo_html").click(function(){
	var frm = document.searchFrm;
	frm.work_div.value ="post";
	frm.action = '/ORAI/roominfoctrl/roominfoctrl.do?rcode='+'1001-105';
	frm.submit(); 
})

//실시간예약
$("#reservation").click(function(){
	alert("reservation")
})

//예약확인
$("#checkres").click(function(){
	alert("checkres")
})

//공지사항
$("#notice").click(function(){
	//alert("notice")
	var frm = document.searchFrm;
	frm.work_div.value ="post";
	frm.action = '/ORAI/NoticeView/notice.do?work_div=do_retrieve';
	frm.submit();
})

//숙박후기
$("#review").click(function(){
	window.location.href="/ORAI/ReviewView/review.do?work_div=do_retrieve";
})
//로그인
$("#login").click(function showPopup(){window.open("LoginForm.jsp","a","width=434, height=388, left=100, top=50")
	
})

</script>
</html>