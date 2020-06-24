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
		<c:choose>
			<c:when test="${sessionScope.Type == 'Formal' }">
				<h3>${sessionScope.User.user_id }������ٱ���</h3>
			</c:when>
		</c:choose>
		<table align="center">
			<c:choose>
				<c:when test="${CartList == null }">
					<tr>
						<td colspan="6">��ٱ��Ͽ� ��� ��ǰ�� �����ϴ�.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">��ǰ����</td>
						<td>����</td>
						<td>����</td>
						<td>�Ѿ�</td>
					</tr>
					<c:forEach var="items" items="${CartList }">
						<tr>
							<td><img alt="" width="100px"
								src="${pageContext.request.contextPath }/Item_Image/${items.item.item_image }" /></td>
							<td colspan="4">${items.item.item_name}</td>
							<td>${items.item.item_price }</td>
							<td>${items.cart_quantity }</td>
							<td>${items.item.item_price * items.cart_quantity }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<div id="btns" align="center">
			<input type="button" value="����"
				onclick="window.location.href='../ItemCart/Checkout.html'" /> <input
				type="button" value="����"
				onclick="window.location.href='../ItemCart/clearCart.html'" />
		</div>
	</div>
</body>
</html>