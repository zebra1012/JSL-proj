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
	���� ��й�ȣ�� �Է� �� �ּ���.<br/><br/>
	<c:choose>
	<c:when test="${sessionScope.Type=='Formal' }">
	<form action="../mypage/FormalChange.html" method="GET">
	<input type="password" name="pwd" placeholder="��й�ȣ�� �Է����ּ���"/><br/>
	<input type="submit" value="��������"/>
	</form>
	</c:when>
	<c:when test="${sessionScope.Type=='Company' }">
	<form action="../mypage/CompanyChange.html" method="GET">
	<input type="password" name="pwd" placeholder="��й�ȣ�� �Է����ּ���"/><br/>
	<input type="submit" value="��������"/>
	</form>
	</c:when>
	</c:choose>
	</div>
</body>
</html>