<%
	String user = "";
	String who = (String)request.getAttribute("isAdmin");
	if(who.equals("Admin"))
		user = "Admin";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:bundle basename="messenger.Messenger" >
<fmt:message  key="TITLE" var="title"/> 
<fmt:message  key="GREETING" var="greeting"/> 
<fmt:message  key="GREETING2" var="greeting2"/> 
<fmt:message  key="INFO_IMG" var="info_img"/>
<fmt:message  key="INFO_USERCOLOR" var="info_usercolor"/>
<fmt:message  key="STR_BACKGROUNDCOLOR" var="str_backgroundcolor"/>
<fmt:message  key="STR_DEFAULT" var="str_default"/>
<fmt:message  key="STR_BACKGROUND" var="str_background"/>
<fmt:message  key="STR_NOTICE" var="str_notice"/>
<fmt:message  key="STR_OTHERUSER" var="str_otheruser"/>
<fmt:message  key="STR_ME" var="str_me"/>
<fmt:message  key="STR_ADMIN" var="str_admin"/>
<fmt:message  key="STR_ADDRESS" var="str_address"/>
<fmt:message  key="STR_CONVERSION" var="str_conversion"/>
<fmt:message  key="STR_TAG" var="str_tag"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<style type="text/css">
		#maindiv {
				border: 2px solid #CCCCCC;
				overflow-x: hidden;
				overflow-y: auto;
				width: 360px;
				height: 400px;
				background-color:#f2f2f2;
		}
		.wrapdiv {
			width: 360px;
		}
	</style>
	<link href="/ORAI/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/ORAI/js/jquery-ui.css" >
	<link href="/ORAI/css/bootstrap.min.css" rel="stylesheet">
	<title>${title}</title>
	<link rel="shortcut icon" href="/ORAI/image/favicon (1).ico">
	<script src="/ORAI/js/jquery-1.12.4.js"></script>
	<script src="/ORAI/js/jquery-ui.js"></script>
</head>
<body onload="window.resizeTo(450,600)">	
	<div class="container wrapdiv">
		<div style="float: left">
			<div id="maindiv">
				<table id="maintable">
					<thead>
						<tr>
						<td width="50px" ></td>
						<td width="250px" style="word-break:break-all;"></td>
						<td width="50px" ></td>
						</tr>
					</thead>
				</table>
			</div>
			<br/>
			<div id="auxdiv" class="wrapdiv">
				<textarea id="inputMessage" onkeypress="send_enter(event)" class="form-control" rows="1" ></textarea>
				<ul style="float:right; list-style:none;">
					<li>
						<button class="btn btn-info btn-nm" onclick="option()"><span class="glyphicon glyphicon-cog"></span></button>
						<button class="btn btn-warning btn-nm" value="imege" onclick="image()">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span> IMAGE
						</button>
						<input type="submit" value="SEND" onclick="send_btn()" class="btn btn-success btn-nm"/>	
					</li>
				</ul>
				<input type="hidden" id="filename" value=""/>	
			</div>
			<div id="option" style="background-color: #5BC0DE; opacity:0; width:0px; height:0px;">
				<div>
					<button id="userIndex_btn" class="btn btn-primary">User_Index</button>
					<br/>
					<b>${str_tag }</b>
					<br/>
					&#60;img&#62;url${str_address }
					<br/>
					${info_img }
					<br/><br/>
					<b>${str_backgroundcolor }</b>
					<select id="op_bgcolor">
						<option value="0">${str_default }</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<br/><br/>
					<b>${info_usercolor }</b>
					<select id="userSelect">
						<option value="0">${str_background }</option>
						<option value="1">${str_notice }</option>
						<option value="2">${str_otheruser }</option>
						<option value="3">${str_me }</option>
						<option value="4">${str_admin }</option>
					</select>
					<input type="text" id="inputColor" size="6"/>(#000000)
					<button id="color_btn" class="btn btn-primary">${str_conversion }</button>
				</div>
			</div>
		</div>
		<div id="indexbar" style="background-color: #aaaaaa; opacity:0; width:0px; height:0px; float: left;" ></div>
	</div>
	<input type="hidden" id="indexout" value=""/>
	<script>
 		var user = '<%=user%>';
 		var overlap = '';
		// @서버엔드포인트에 broadcasting2 라고 되어있는것을 지정한 프로젝트에서 찾는다. 
		var webSocket = new WebSocket('ws://localhost:8088/ORAI/oraimessenger');
		var inputMessage = document.getElementById('inputMessage');
		//서버에 있는 이미지저장용 폴더 경로
		var serverImagePath = 'http://localhost:8088/ORAI/MessengerView/img';
		//이미지 파일이름을 저장할 변수
		var filename = document.getElementById('filename');
		//옵션창
		var opt = false;
		//색상
		var userColor = "#D8D8D8";
		var adminColor = "#ffffff";
		var myColor = "#A9D0F5";
		var noticeColor = "#dcdcdc";
		//유저리스트
		var user_Array;
		
		//기본포커스
		inputMessage.focus();
		
		webSocket.onerror = function(event) {
	  		onError(event)
		};
	
		webSocket.onopen = function(event) {
	  		onOpen(event)
		};
	
		webSocket.onmessage = function(event) {
	  		onMessage(event)
		};
	
		//엔터키 인식
		function send_enter(event){
			if( window.event.keyCode == 13){	//엔터키
				if (!event.shiftKey){			//쉬프트를 안눌렀을때
					event.preventDefault();		//개행되지 않도록 방지
					send(inputMessage.value);	//전송
				}		
			}
		}		
		
		//전송 후 입력창으로 포커스 전환
		function send_btn(){
			send(inputMessage.value);
			inputMessage.focus();
		}
		
		//메시지 전송
		function send(msg) {
			if(msg != ""){//공백필터
				//텍스트에이리어 <- 나: + 입력한메시지
				if(user == 'Admin'){
					var adminMessage = 'Admin``@send``' + msg;
					webSocket.send(adminMessage);
				}else{
					var userMessage = 'normal_user``@send``' + msg;
					webSocket.send(userMessage);
				}
				
				//텍스트에이리어 내용지우기
				inputMessage.value = "";
			} 		
		}
		
		//받은 메시지를 가공
		function onMessage(event) {
			goMessage(event.data);
		}
	
		//옵션창
		function option(){
			//console.log(opt);
			if(opt == false){
				$("#option").animate({
					width:"150px", height:"270px", opacity:"100"
				});
				opt = true;
				
			}else{
				$("#option").animate({
					width:"0px", height:"0px", opacity:"0"
				});
				opt = false;	
			}
		}
		
		//유저목록버튼
		$("#userIndex_btn").on("click" , function(){
			webSocket.send("admin_exist" + "``@send``" + "?");	//관리자유무확인
			webSocket.send(user + "``@send``" + "index");
			var opt = "width=200, height=500, status=0, toolbar=0, location=0, menubar=0";
			var indexWindow = window.open("http://localhost:8088/ORAI/MessengerView/Messenger_index.jsp", "_blank", opt);
			var repeat = setInterval(function(){
				if(!indexWindow) clearInterval(repeat);	//반복종료
				webSocket.send(user + "``@send``" + "index");	
			},500);

		});
		
		//배경색설정
		$("#op_bgcolor").change(function(){
			var op = $("#op_bgcolor").val();
			switch(op){
				case '0':
					$("#maindiv").attr('style', 'background-color:#f2f2f2');
					break;
				case '1':
					$("#maindiv").attr('style', 'background-color:#ffffff');
					break;
				case '2':
					$("#maindiv").attr('style', 'background-color:#EFD7A0');
					break;
				case '3':
					$("#maindiv").attr('style', 'background-color:#9EEDA0');
					break;
				case '4':
					$("#maindiv").attr('style', 'background-color:#B9F7F7');
					break;
				case '5':
					$("#maindiv").attr('style', 'background-color:#C1FFCF');
					break;
			}		
		});
		
		//사용자 색 지정
		$("#color_btn").on("click" , function(){
			var inputColor = $("#inputColor").val();
			var Filter_front = inputColor.substring(0,1);
			var Filter_back = inputColor.substring(1,7);
			if(Filter_front == '#' && isNaN(parseInt(Filter_back)) ){
				var op = $("#userSelect").val();
				switch(op){
					case '0':
						$("#maindiv").attr('style', 'background-color:'+inputColor.substring(0,7) );
						break;
					case '1':
						noticeColor = inputColor.substring(0,7);
						break;
					case '2':
						userColor = inputColor.substring(0,7);
						break;
					case '3':
						myColor = inputColor.substring(0,7);
						break;
					case '4':
						adminColor = inputColor.substring(0,7);
						break;
				}		
			}
			console.log(inputColor.substring(0,7));
			console.log(adminColor);		
		});
				
		//접속했을때
		function onOpen(event) {
			var notice = 'Notice::::' + 'NOTICE\n' + '${greeting}';
			goMessage(notice);
			var notice = 'Admin::::' + '${greeting2}';
			goMessage(notice);
		}
		
		//에러
		function onError(event) {
	  		alert(event.data);
		}
	
		//이미지
		function image(){
			filename.value = 'ready';	//이미지업로드 준비
			detect_img();				//ready가 사라질때까지 이미지감지 반복
			//서버에 이미지를 올리기 위한 보조창
			var opt = "width=400, height=200, left=100, top=200, status=0, toolbar=0, location=0, menubar=0";
			var imgWindow = window.open("http://localhost:8088/ORAI/MessengerView/ImgPage.jsp", "_blank", opt);
}
		
		//이미지감지
		function detect_img(){
			var repeat = setInterval(function(){
				if(filename.value == '') clearInterval(repeat);	//취소했을때 반복종료
				if(filename.value != '' && filename.value != 'ready'){	//이미지이름이 넘어왔을때
					var fianlImgPath = '<img>' + serverImagePath + '/' + filename.value + '<img>';
					send(fianlImgPath);
					filename.value = '';	//반복종료
				}	
			},1000);
		}
					
		//메시지 표시
		function goMessage(data){
			var msg = data.split("::::");	//반은 메시지를 이름과 내용으로 분할
			var name = msg[0];												//유저명
			var talkmsg = msg[1];											//내용
			var isImg = false;												//이미지주소여부확인
			var notice = false;												//공지기능
			var colorWho;													//적용할 색
			var contentStyle;												//스타일이 들어간 스트링
			
			if(name == 'admin_exist'){
				if(user == 'Admin'){
					webSocket.send("admin_exist``@send``exist");
					}
				return;
			}
			
			if(name == 'indexin'){
				user_Array = talkmsg;
				$("#indexout").attr('value', talkmsg);
				return;
			}
			
			if(talkmsg.indexOf('<img>') != -1 && talkmsg.length >= 6){		//자체 이미지태그 거르기
				var tmp = talkmsg.split('<img>');
				for(var i=0 ; i<tmp.length ; i++){
					if(tmp[i].indexOf('<img>') != 1){
						talkmsg = tmp[i+1];
						break;
					}
				}
				isImg = true;
			}
			
			if(talkmsg.indexOf('<notice>') != -1 && talkmsg.length >= 6 && name == 'Admin'){		//관리자전용 공지태그
				var tmp = talkmsg.split('<notice>');
				for(var i=0 ; i<tmp.length ; i++){
					if(tmp[i].indexOf('<notice>') != 1){
						talkmsg = tmp[i+1];
						break;
					}
				}
				notice = true;
			}
					
			if(name != 'Admin'){
				var name2 = name.split("(");								//관리자가 아닐경우 ip가 들어있는 괄호를 제거
			}

			var maindiv = document.getElementById('maindiv');				//메신저 케이스
			var maintable = document.getElementById('maintable');			//메인 테이블
			var tr = document.createElement('tr');							//계속 추가될 테이블 열
			var name_empty = document.createElement('td');					//자리매꿈용 data
			if(isImg == 1){
				var content = document.createElement('img');				//내용-이미지
			}else{
				var content = document.createElement('pre');				//내용-일반
			}
			var username = document.createElement('td');					//유저이름
			var contentBox = document.createElement('td');					//내용을 감쌀 테이블데이터

			if(overlap == name){//같은사람이 계속 채팅할 떄 이름이 계속 나오지 않도록 처리
				var textNode_name = document.createTextNode('');
			}else{
				var textNode_name = document.createTextNode(name);
			}
			if(isImg != true){
				var textNode_msg = document.createTextNode(talkmsg);
			}
			
			username.appendChild(textNode_name);
			if(isImg != true){
				content.appendChild(textNode_msg);
			}
			
			if(isImg == true){
				content.setAttribute('class', 'img-responsive');
				content.setAttribute('alt', 'image');
				content.setAttribute('src', talkmsg);
			}
			
			contentBox.appendChild(content);

			if(name == 'Admin' && notice == false){
				colorWho = adminColor;
				tr.appendChild(username);
				tr.appendChild(contentBox);
				tr.appendChild(name_empty);
			}else if(name == 'Notice' || notice == true){	//공지
				if(isImg != true){
					colorWho = noticeColor;
					contentBox.setAttribute('colspan', '100%');
					contentBox.setAttribute('align', 'center');
				}
				tr.appendChild(contentBox);
			}else{
			 	if(name2[0] == "나"){
			 		colorWho = myColor;
			 	}else{
			 		colorWho = userColor;
				}
				tr.appendChild(name_empty);
				tr.appendChild(contentBox);
				tr.appendChild(username);
			}
			contentStyle = 'word-wrap: break-word;white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;white-space: -o-pre-wrap;word-break:break-all; background-color:' + colorWho + ';';
			if(isImg == true) contentBox.setAttribute('style', contentStyle);
			content.setAttribute('style', contentStyle);
			maintable.appendChild(tr);	//테이블에 열 추가
			
			overlap = name;	// 유저이름을 기억한다
			maindiv.scrollTop = maindiv.scrollHeight;	//메시지 나올때마다 스크롤 아래로
		}
		
		
	</script>
	<script src="/ORAI/js/bootstrap.min.js"></script>
</body>
</html>
</fmt:bundle>