<%
	int flag = (int)request.getAttribute("flag");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cancel</title>
</head>
<body>
	<%
		if(flag == 1){
			out.print("<script>alert(\"예약이 취소되었습니다.\\n이용해주셔서 감사합니다.\\n(Your reservation has been canceled.)\");</script>");
		}else
			out.print("<script>alert(\"예약을 취소하지 못했습니다.\\n관리자에게 문의해주세요.\\n(Failed to cancel reservation.\\nPlease contact the manager.)\");</script>");
		out.print("<script>window.close();</script>");
	%>

 <script>
  
  $(document).ready(function(){
  });

  
 </script>
</body>
</html>