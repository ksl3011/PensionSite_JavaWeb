<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/ORAI/js/jquery-ui.css" >
	<link href="/ORAI/css/bootstrap.min.css" rel="stylesheet">
	<title>LIST</title>
	<link rel="shortcut icon" href="/ORAI/image/favicon (1).ico">
	<script src="/ORAI/js/jquery-1.12.4.js"></script>
	<script src="/ORAI/js/jquery-ui.js"></script>
</head>
<body>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<td align="center">User List</td>
			</tr>
		</thead>
		<tbody id="tbody">
		
		</tbody>
	</table>
	 
	<script>
		var tbody = document.getElementById("tbody");
		
		$(document).ready(function(){
		});
  	
		setInterval(function(){
			$("#tbody").empty();
			var str = opener.document.getElementById("indexout").value;
			var arr = str.split("::");
			
			for(var i=0 ; i<arr.length ; i++){
				var tr = document.createElement("tr")
				var td = document.createElement("td")
				var node = document.createTextNode(arr[i]);
				
				td.appendChild(node);
				tr.appendChild(td);
				tbody.appendChild(tr);
			}			
		}, 1000);

	</script>
	<script src="/ORAI/js/bootstrap.min.js"></script>
</body>
</html>