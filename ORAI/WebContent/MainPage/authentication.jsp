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
<%
// 0: 인증 가능 사용자 및 비밀번호 목록.
String[] users = { "Admin1", "Admin2", "Admin3" };
String[] passwords = { "1234", "1234", "1234" };
// 1: form 으로부터 전달된 데이터를 변수에 저장.
String id = request.getParameter("id");
String pw = request.getParameter("pw");
// 2: 사용자 인증
String redirectUrl = "LoginForm1.jsp"; // 인증 실패시 재요청 될 url 

for (int i = 0; i < users.length; i++) {
    if (users[i].equals(id) && passwords[i].equals(pw)) {
        session.setAttribute("signedUser", id); // 인증되었음 세션에 남김
        redirectUrl = "LoginWelcome.jsp"; // 인증 성공 시 재요청 url
    }
}
response.sendRedirect(redirectUrl);
%> 
