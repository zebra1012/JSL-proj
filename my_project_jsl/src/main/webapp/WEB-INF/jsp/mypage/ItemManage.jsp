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
				<th>상품번호</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
				<th>상태</th>
			</tr>
			<c:choose>
				<c:when test="${not empty Items }">
					<c:forEach var="item" items="${Items}">
						<tr>
							<td>${item.item_seqno }</td>
							<td>${item.item_name }</td>
							<td>${item.item_price }</td>
							<td>${item.item_stock }</td>
							<td>${item.item_state }</td>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
					<td colspan="5">상품정보가 없습니다.</td>
				</c:otherwise>
			</c:choose>
		</table>


	</div>
</body>
</html>