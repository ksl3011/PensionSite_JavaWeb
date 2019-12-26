<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/ORAI/js/jquery-ui.css" >
<title></title>
<link rel="shortcut icon" href="/ORAI/image/favicon.ico">
<script src="/ORAI/js/jquery-1.12.4.js"></script>
<script src="/ORAI/js/jquery-ui.js"></script>
</head>
<body>
	<h3></h3>
	<hr/>
	<form action="/ORAI/messenger.do" method="post" name="mainForm">
		<input type="hidden" id="messengerAUX" name="messengerAUX" value=""/>
	</form>
	<script>
		$(document).ready(function(){
			var parentWindow = opener.document.getElementById("messengerWho");
			$("#messengerAUX").attr("value", parentWindow.value); 			
			var frm = document.mainForm;
			frm.messengerAUX.value = parentWindow.value
			frm.submit();
		});
	</script>
</body>
</html>