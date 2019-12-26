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

<%@page import="sights.SightsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <style type="text/css">
     .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    
    </style>
<link rel="stylesheet" href="/WEB_EX01/js/jquery-ui.css" >
<title>여러개 마커 표시하기</title>
<script src="/WEB_EX01/js/jquery-1.12.4.js"></script>
<script src="/WEB_EX01/js/jquery-ui.js"></script>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
 <h3></h3>
 <hr/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6255b93238c842e95304de08e0accb36&libraries=clusterer"></script>
 <script>
 <% 
 List<SightsVO> voList = (List<SightsVO>)request.getAttribute("list");
 %>
 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 	mapOption = { 
     center: new kakao.maps.LatLng(<%=voList.get(0).getLatitude()%>,<%=voList.get(0).getLongitude()%>), // 지도의 중심좌표
     level: 7 // 지도의 확대 레벨
 };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 title 객체 배열입니다 
<%-- content : '<%=vo.getS_name()%>', --%>

var positions = [
<%for(SightsVO vo :voList){%>
 {
 	 content:'<%=vo.getS_name() %>',
 	 location:'<%=vo.getLocation()%>',
     latlng: new kakao.maps.LatLng(<%=vo.getS_latitude()%>,<%=vo.getS_longitude()%>)
 }, 
 <% } %>

];
console.log(positions);

//마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
 
for (var i = 0; i < positions.length; i ++) {
	
	var content = '<div class="wrap">' + 
	'    <div class="info">' + 
	'        <div class="title">' + positions[i].content + 
	'            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	'        </div>' + 
	'        <div class="body">' +           
	'                <div class="ellipsis">'+positions[i].location+'</div>' + 
	'                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
	'        </div>' + 
	'    </div>' +    
	'</div>'; 
 
 // 관광지 마커 이미지의 이미지 크기 입니다
 var imageSize = new kakao.maps.Size(24, 35); 
 
 // 마커 이미지를 생성합니다    
 var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
 
 // 마커를 생성합니다
 var marker = new kakao.maps.Marker({
     map: map, // 마커를 표시할 지도
     position: positions[i].latlng, // 마커를 표시할 위치
     image : markerImage // 마커 이미지 
 });
 var overlay = new kakao.maps.CustomOverlay({
	    content: content,
	    
	    map: map,
	    position: marker.getPosition(),
	  
	});


//마커를 클릭했을 때 커스텀 오버레이를 표시합니다


//펜션 위치 마커
var imageSrc2 = "/ORAI/image/Homemaker.png",
	imageSize = new kakao.maps.Size(34, 35)
var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize); 
var marker2 = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position : mapOption.center,
    image : markerImage2 // 마커 이미지 
});

   
}
kakao.maps.event.addListener(marker, 'click', function() {
    overlay.setMap(map,marker);
});

function closeOverlay() {
 overlay.setMap(null);
 overlay = _clickMakerOverlay;
 overlay.setMap(map);


}

//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 


 </script>
</body>
</html>