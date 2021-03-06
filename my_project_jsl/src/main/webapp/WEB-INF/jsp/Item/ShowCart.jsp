<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
tr,td{
border : 1px solid;
text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../index/header.jsp"></jsp:include>
	<div id="wrapper">
		<c:choose>
			<c:when test="${sessionScope.Type == 'Formal' }">
				<h3 align="center">${sessionScope.User.user_id }님의장바구니</h3>
			</c:when>
			<c:when test="${sessionScope.Type=='Unsigned' }">
				<h3 align="center">${sessionScope.User.unsigned_name }님의장바구니</h3>
			</c:when>
		</c:choose>
		<table align="center" >
			<c:choose>
				<c:when test="${CartList == null }">
					<tr>
						<td colspan="6">장바구니에 담긴 상품이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">상품정보</td>
						<td>가격</td>
						<td>수량</td>
						<td>총액</td>
					</tr>
					<c:forEach var="items" items="${CartList }">
						<tr>
							<td><img alt="" width="100px"
								src="${pageContext.request.contextPath }/Item_Image/${items.item.item_image }" /></td>
							<td colspan="4">${items.item.item_name}</td>
							<td><fmt:formatNumber value="${items.item.item_price }" type="number"/></td>
							<td>${items.cart_quantity }</td>
							<td><fmt:formatNumber value="${items.item.item_price * items.cart_quantity }" type="number"/></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<div id="btns" align="center">
		<input type="button" value="결제" onclick="window.location.href='../ItemCart/Checkout.html'"/> 
		<input type="button" value="비우기" onclick="window.location.href='../ItemCart/clearCart.html'"/>
		</div>
	</div>
</body>
</html>