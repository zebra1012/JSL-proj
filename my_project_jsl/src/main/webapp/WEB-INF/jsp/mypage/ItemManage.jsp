<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
tr td th {
	border: 1px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="menu"
		style="float: right; margin-right: 320px; margin-top: 80px;">

		<table border="1">

			<c:choose>
				<c:when test="${not empty Items }">
					<tr>
						<th>상품번호</th>
						<th>상품명</th>
						<th>가격</th>
						<th>상태</th>
					</tr>
					<c:forEach var="item" items="${Items}">
						<tr onclick="location.href='../item/itemDetail.html?seqno=${item.item_seqno }'">
							<td>${item.item_seqno }</td>
							<td>${item.item_name }</td>
							<td>${item.item_price }</td>
							<c:choose>
								<c:when test="${item.item_state ==0}">
								<td>판매중</td>
								</c:when>
								<c:when test="${tiem.item_state ==1 }">
								<td>품절</td>
								</c:when>
							</c:choose>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">상품정보가 없습니다.</td>
				</c:otherwise>
			</c:choose>
		</table>


	</div>
</body>
</html>