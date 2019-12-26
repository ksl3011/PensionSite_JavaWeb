<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/ORAI/js/jquery-ui.css" >
<title></title>
<link rel="shortcut icon" href="/ORAI/image/favicon.ico">

</head>
<body>
	<h3></h3>
	<hr/>
	<form action="/ORAI/user_re" method="post" name="mainForm">
		<input type="hidden" name="from" value="user_re"/>
		<input type="hidden" name="what" value="reference"/>
		<input type="hidden" id="name" name="name" value=""/>
		<input type="hidden" id="phone" name="phone" value=""/>
		
	</form>
	<script src="/ORAI/js/jquery-1.12.4.js"></script>
	<script src="/ORAI/js/jquery-ui.js"></script>
	<script>
		$(document).ready(function(){
			var parent_name = opener.document.getElementById("name");
			var parent_phone = opener.document.getElementById("phone");
			
			$("#name").attr("value", parent_name.value);
			$("#phone").attr("value", parent_phone.value);
			var frm = document.mainForm;
			frm.submit();
		});
	</script>
</body>
</html>