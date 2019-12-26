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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
    if (session.getAttribute("signedUser") == null) {
        response.sendRedirect("logout.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
    <style>
     body {
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: #eee;
	}
    </style>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	   <link rel="stylesheet" href="/WEB_EX01/js/jquery-ui.css">
	   <link rel="shortcut icon" href="/ORAI/image/favicon (1).ico">
    </head>
       <script src="/WEB_EX01/js/jquery-1.12.4.js"></script>
	   <script src="/WEB_EX01/js/jquery-ui.js"></script> 
    <body>
    <!--  
        <div id="logout" align="right">
       	 <input id="logout" type="button" value="로그아웃" action="logout.jsp"/> 
        </div> -->
        <h3 id="welcome" align="center"><%= session.getAttribute("signedUser") %>님 <small>반갑습니다.</small></h3>
        
        <div align="center" >
       	 <input id="reservation" class="form-btn"  type="button" value="예약관리" /> 
       	 <input id="notice" class="form-btn"  type="button" value="공지사항" /> 
       	 <input id="review" class="form-btn"  type="button" value="숙박후기" /> 
        </div>
        
    </body>
    <script>
    //버튼 이벤트 //
    
    $("#logout").click(function showPopup(){
        window.open("logout.jsp","b","width=400, height=300, left=100, top=50")
    	
    })
   	 $("#reservation").on('click',function(){
    	 opener.document.location.href="/ORAI/AdminReView/adminRe.jsp";
    	 self.close();
		});	
   	 $("#notice").on('click',function(){
    	 opener.document.location.href="/ORAI/NoticeView/notice.do?work_div=do_retrieve";
    	 self.close();
		});	
     $("#review").on('click',function(){
    	 opener.document.location.href="/ORAI/ReviewView/review.do?work_div=do_retrieve";
    	 self.close();
		});	
    
    $(document).ready(function(){	
		});
    
    </script>
</html>