<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
table {
border:1px solid;
}
tr,td{
border:1px solid;
text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../index/header.jsp"></jsp:include>
<div id="wrapper">
<h3 align="center">���Ÿ��</h3>
<table align="center">
<tr><td>������</td><td>��ǰ��</td><td>����</td><td>����</td><td>�Ѿ�</td><td>��ۻ���</td>
<c:forEach var="shopping" items="${Shopping }">
<tr><td>${shopping.shopping_date }</td><td>${shopping.item.item_name }</td>
<td><fmt:formatNumber value="${shopping.item.item_price}" type="number"/></td><td>${shopping.shopping_quantity }</td>
<td><fmt:formatNumber value="${shopping.item.item_price * shopping.shopping_quantity }" type="number"/></td>
<td><c:if test="${shopping.shopping_shipment=='1'}">�����</c:if></td>
</tr>
</c:forEach>

</table>

</div>

</body>
</html>