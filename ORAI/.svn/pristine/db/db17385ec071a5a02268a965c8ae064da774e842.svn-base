<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>  
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/ORAI/villa/css/bootstrap.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="/ORAI/js/jquery-ui.css" >
	<title>Chart</title>
	<link rel="shortcut icon" href="/ORAI/image/favicon (1).ico">

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {		
			var jsonArray = $.ajax({
				url:"/ORAI/Chart.json",
				dataType: "html",
				data:{
					work_div: "do_piechart"
				},
				async:false
			}).responseText;
		  
			var jsonArrayObject = JSON.parse(jsonArray);
			console.log("jsonArrayObject:"+jsonArrayObject);
		  
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'label');
			data.addColumn('number', 'data');
			for(var i=0;i<jsonArrayObject.length;i++){
				console.log("jsonArrayObject[i]:"+jsonArrayObject[i]);
				data.addRow(jsonArrayObject[i]);
			}
			var options = {
					title: '최근 예약되었던 방 통계'
					};
			var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			chart.draw(data, options);
			//차트끝
		
			if(jsonArrayObject.length < 1){
				$("#recommend").text('최근에 예약된 방이 없습니다.');
			}else{
				//정렬
				for(var i = 0; i < jsonArrayObject.length; i++) {
					for(var j= 1 ; j < jsonArrayObject.length-i; j++) {
						var tmp1 = String(jsonArrayObject[j]).split(",");
						var tmp2 = String(jsonArrayObject[j-1]).split(",");
					
						if(tmp1[1] > tmp2[1]) {
							var temp;
							temp = jsonArrayObject[j-1];
							jsonArrayObject[j-1] = jsonArrayObject[j];
							jsonArrayObject[j] = temp;
						}
					}
				}
			
				//추천목록
				var recommend = new Array();
			
				//중복1위 처리
				for(var i=0 ; i<jsonArrayObject.length ; i++){
					if(jsonArrayObject[0][1] == jsonArrayObject[i][1]){
						recommend.push(jsonArrayObject[i][0]);
					}
				}
					$("#recommend").text('최근 가장 인기있는 방은 ' + recommend + ' 방 입니다.');
			}
		}
		</script>
</head>
<body>
	<div id="mainDiv" align="center">
		<div id="piechart" style="width: 900px; height: 500px;"></div>
		<div id="recommend" class="alert alert-success" role="alert"></div>
	</div>
	<script src="/ORAI/villa/js/jquery-3.2.1.min.js"></script>
	<script src="/ORAI/villa/js/bootstrap.min.js"></script>
</body>
</html>