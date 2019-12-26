<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:bundle basename="messenger.Messenger" >
<fmt:message  key="INFO_SELECTING" var="info_selecting"/>
<fmt:message  key="INFO_SELECTING2" var="info_selecting2"/>
<fmt:message  key="STR_CANCEL" var="str_cancel"/>
<fmt:message  key="STR_SUBMIT" var="str_submit"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/ORAI/js/jquery-ui.css" >
<title>image</title>
<link rel="shortcut icon" href="/ORAI/image/favicon.ico">
<script src="/ORAI/js/jquery-1.12.4.js"></script>
<script src="/ORAI/js/jquery-ui.js"></script>
</head>
<body>
	<form action="http://localhost:8088/ORAI/MessengerView/FileUpload.jsp" name="frm" method="post" enctype="Multipart/form-data" >
		<p>${info_selecting }</p>
		<p>${info_selecting2 }</p>
		<input type="file" name="filename" id="filename" accept=".jpg, .jpeg, .png, .ico, .gif" value=""/>
		<br/>
		<input type="button" name="submit_btn" id="submit_btn" value="${str_submit }" />
		<input type="button" value="${str_cancel}" id="cancel_btn"/>
	</form>

	<script>
  
		$(document).ready(function(){
		});
  
		$(function() {
            $("#filename").on('change', function(){
            });
        });
		
		$("#submit_btn").on('click', function(){
			var frm = document.frm;
			frm.submit();
		});
		
		$("#cancel_btn").on('click', function(){
			var sendName = '';
			var parentWindow = opener.document.getElementById("filename");
			parentWindow.value = sendName;
			
			window.close();
		});
	</script>
</body>
</html>
</fmt:bundle>