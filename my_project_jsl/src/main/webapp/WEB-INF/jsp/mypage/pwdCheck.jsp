<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div style="margin-top:120px; margin-right:340px; float:right;" align="center">
	현재 비밀번호를 입력 해 주세요.<br/><br/>
	<c:choose>
	<c:when test="${sessionScope.Type=='Formal' }">
	<form action="../mypage/FormalChange.html" method="GET">
	<input type="password" name="pwd" placeholder="비밀번호를 입력해주세요"/><br/>
	<input type="submit" value="정보변경"/>
	</form>
	</c:when>
	<c:when test="${sessionScope.Type=='Company' }">
	<form action="../mypage/CompanyChange.html" method="GET">
	<input type="password" name="pwd" placeholder="비밀번호를 입력해주세요"/><br/>
	<input type="submit" value="정보변경"/>
	</form>
	</c:when>
	</c:choose>
	</div>
</body>
</html>