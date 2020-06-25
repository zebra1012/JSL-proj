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
	<div id="menu"
		style="float: right; margin-right: 320px; margin-top: 80px;">
		<table>
			<tr>
				<th>���Ź�ȣ</th>
				<th>����</th>
				<th>��ǰ��</th>
				<th>�ݾ�</th>
				<th>��ۻ���</th>
			</tr>
			<c:choose>
				<c:when test="${not empty Customer }">
					<c:forEach var="customer" items="${Customer}">
						<tr>
							<td>${customer.shopping_seqno }</td>
							<td>${customer.shopping_buyer }</td>
							<td>${customer.item_name }</td>
							<td>${customer.item_price * customer.shopping_quantity }</td>
							<c:choose>
								<c:when test="${customer.shopping_shipment == 0 }">
									<td>��ǰ �غ� ��</td>
								</c:when>
								<c:when test="${customer.shopping_shipment ==1 }">
									<td>��� ��</td>
								</c:when>
								<c:when test="${customer.shopping_shipment==2 }">
									<td>��� �Ϸ�</td>
								</c:when>
							</c:choose>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">�������� �����ϴ�.</td>
				</c:otherwise>
			</c:choose>
		</table>


	</div>
</body>
</html>