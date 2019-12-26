<%@page import="user_re.User_reVO"%>
<%
	User_reVO vo = new User_reVO();
	vo.setRNAME((String)request.getAttribute("name"));
	vo.setPHONE((String)request.getAttribute("phone"));
	String room_Info = (String)request.getAttribute("info");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:bundle basename="user_re.Userre" >
<fmt:message  key="TITLE" var="title"/> 
<fmt:message  key="INFO_INFOINPUT" var="info_infoinput"/> 
<fmt:message  key="INFO_CAUTION" var="info_caution"/> 
<fmt:message  key="INFO_CAUTION2" var="info_caution2"/> 
<fmt:message  key="INFO_CAUTION3" var="info_caution3"/> 
<fmt:message  key="INFO_CAUTION4" var="info_caution4"/> 
<fmt:message  key="INFO_CAUTION5" var="info_caution5"/> 
<fmt:message  key="STR_BOOKER" var="str_booker"/> 
<fmt:message  key="STR_PHONE" var="str_phone"/> 
<fmt:message  key="STR_CONFIRM" var="str_confirm"/> 
<fmt:message  key="INFO_CANCEL" var="info_cancel"/> 
<fmt:message  key="INFO_CANCEL2" var="info_cancel2"/> 
<fmt:message  key="INFO_CANCEL3" var="info_cancel3"/> 
<fmt:message  key="INFO_CANCEL4" var="info_cancel4"/> 
<fmt:message  key="STR_INFO" var="str_info"/> 
<fmt:message  key="STR_INFO2" var="str_info2"/> 
<fmt:message  key="STR_INPUT" var="str_input"/> 
<fmt:message  key="STR_CANCEL" var="str_cancel"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/ORAI/User_reView/UserRe.css">

<title>${title }</title>
<script src="\ORAI\js\jquery-1.12.4.js"></script>
</head>
<body>
	<div class="main_top">
		<span style="font-size:25px">${title }</span>
	</div>
	<div style="padding: 10px">
		<span style="font-size:17px; color:#575757;"><b>${str_info }</b></span>
		<hr/>
			<form method="post" action="/ORAI/user_re" name="mainForm">
			<input type="hidden" name="from" value="user_re"/>
			<input type="hidden" name="what" value="cancel"/>
				<ul><li>
					<span style="font-size:15px;"><b>${str_booker }</b></span>
					<input type="text" size="10" disabled="disabled" value="<%=vo.getRNAME()%>"/>
					<input type="hidden" name="name" />
					<input type="hidden" name="phone" />
				</li></ul>
				<hr/>
				<ul><li>
					<span style="padding:7px; font-size:15px"><b>${str_info2 }</b> </span>
					<input type="text" id="info" name="info" disabled="disabled" size="60" value="<%=room_Info%>"/>
				</li></ul>
				<hr/>
				<div align="center"><input type="button" class="SM" id="btn" value="${str_cancel }"></div>
			</form>
	</div>
	<script>
		function start(){
			var info = $("#info").val();
			if(info == 'null'){
				alert("${info_cancel4 }");
				console.log(info);
				window.close();
			}
		}
		start();
	
		$("#btn").on("click", function(){
			var msg = "${info_cancel}";
			if(confirm(msg) != 0){
				var isReal = prompt("${info_cancel2}");
				if(isReal == '예약취소'){
					var mainForm = document.mainForm;
					mainForm.name.value = '<%=vo.getRNAME()%>';
					mainForm.phone.value = '<%=vo.getPHONE()%>';
					mainForm.submit();
				
				}else{
					if(isReal != null)
						alert("${str_input} " + isReal + "\n${info_cancel3}");
				}
			}else{
			}
		});
	</script>
</body>
</html>
</fmt:bundle>