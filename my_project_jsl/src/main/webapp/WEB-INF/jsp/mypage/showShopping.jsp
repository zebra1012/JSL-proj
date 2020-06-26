<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
<h3 align="center">구매목록</h3>
<table align="center">
<c:choose>
<c:when test="${empty Shopping }">
<tr><td colspan="6">구매한 상품이 없습니다.</td>
</c:when>
<c:otherwise>
<tr><td>구매일</td><td>상품명</td><td>가격</td><td>수량</td><td>총액</td><td>배송상태</td>
<c:forEach var="shopping" items="${Shopping }">
<tr><td>${shopping.shopping_date }</td><td>${shopping.item.item_name }</td>
<td>${shopping.item.item_price}</td><td>${shopping.shopping_quantity }</td>
<td>${shopping.item.item_price * shopping.shopping_quantity }</td>
<td><c:if test="${shopping.shopping_shipment=='1'}">배송중</c:if></td>
</tr>
</c:forEach>
</c:otherwise>
</c:choose>
</table>

</div>
</body>
</html>