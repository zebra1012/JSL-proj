<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../index/header.jsp"></jsp:include>
<div id="wrapper">
<h3>��ȸ�� �ֹ� ���� �Է�</h3>
<form:form modelAttribute="Unsigned" action="../ItemCart/unsigned.html" method="POST">
<table align="center">
<tr><td>������</td><td><form:input path="unsigned_name"/></td></tr>
<tr><td>�����</td><td><form:input path="unsigned_addr"/></td></tr>
<tr><td>����ó</td><td><form:input path="unsigned_phone"/></td></tr>
<tr></tr>
<tr><td colspan="2" align="center"><input type="submit" value="�Է� �Ϸ�"/></td></tr>
</table>

</form:form>
</div>
</body>
</html>