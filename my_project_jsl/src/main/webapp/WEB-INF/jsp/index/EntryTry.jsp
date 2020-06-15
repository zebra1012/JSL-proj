<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="wrapper" align="center">
<input type="button" value="일반회원가입" onclick="location.href='../index/entryform.html?type=formal'"/>
<input type="button" value="업체회원가입" onclick="location.href='../index/entryform.html?type=comapny'"/>
</div>
</body>
</html>