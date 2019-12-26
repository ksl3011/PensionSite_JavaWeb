<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <style>
   body {
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #eee;
}
.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  margin :10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: 10px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  
}
  </style>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="/WEB_EX01/js/jquery-ui.css">
	<link rel="shortcut icon" href="/WEB_EX01/image/favicon.ico">
	<title>Insert title here</title>
	<script src="/WEB_EX01/js/jquery-1.12.4.js"></script>
	<script src="/WEB_EX01/js/jquery-ui.js"></script> 
  </head>
  <body onload="window.resizeTo(500,400)">
	 <% if (request.getParameter("error") == null) { %>
         <h1 margin:auto>다시 입력해주세요</h1> 
    <% } else { %>
         <h1><%= request.getParameter("error") %></h1>
    <% } %>
     <form class="form-signin" action="authentication.jsp" method="post">
        <h2 class="form-signin-heading">관리자로그인</h2>
        <label>아이디</label>
        &emsp; <input name="id" id="inputId" type="text" class="form-control"placeholder="아이디를 입력해주세요" required autofocus><br>
        <label>패스워드   </label>
        <input name="pw" type="password"id="inputPassword" class="form-control" placeholder="패스워드를 입력해주세요" required><br>
        <input type="submit" value="로그인">
    </form>
</body>

