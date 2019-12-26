<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
	String uploadPath = request.getRealPath("/MessengerView/img");
	//out.println("절대경로 : " + uploadPath + "<br/>");
	int maxSize = 1024 * 1024 * 10;	//10M
	String fileName = "";			//파일이름
	String originalName = "";		//중복 처리전 실제 원본 이름
	long fileSize = 0;
	String fileType = "";
	 
    MultipartRequest multi = null;

	try{
		// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
		multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		fileName = multi.getParameter("filename");
		Enumeration files = multi.getFileNames();
		 while(files.hasMoreElements()){
	            // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
	            String file = (String)files.nextElement(); // 파일 input에 지정한 이름을 가져옴
	            // 그에 해당하는 실재 파일 이름을 가져옴
	            originalName = multi.getOriginalFileName(file);
	            // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
	            // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
	            fileName = multi.getFilesystemName(file);

	            // 파일 타입 정보를 가져옴
	            fileType = multi.getContentType(file);
	            // input file name에 해당하는 실재 파일을 가져옴
	            File getFile = multi.getFile(file);
	            // 그 파일 객체의 크기를 알아냄
	            fileSize = getFile.length();
	        }
	    }catch(Exception e){
	        e.printStackTrace();
	    }

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <input type="hidden" value="<%=fileName%>" name="filename" id="filename" />
    <input type="hidden" value="<%=originalName%>" name="originalName" />
	<script>
  
		$(document).ready(function(){
			var sendName = document.getElementById("filename").value;
			var parentWindow = opener.document.getElementById("filename");
			parentWindow.value = sendName;
			
			window.close();
			});
	</script>
</body>
</html>