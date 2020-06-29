<%@ page language="java" contentType="text/html; charset=EUC-KR" 
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
tr {
	text-align: "center";
}

td {
	text-align: "center";
}

table {
	border-style: solid;
}

table#wrapper_table {
	border-style: double 1px black;
	margin: 0 auto;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrapper">
		<table id="wrapper_table">
			<tr>
				<td rowspan="2">
					<div align="center" id="items_latest">
						<h3>최근 올라온 상품</h3>
						<table border="1">
							<tr>
								<th width="400">상품명</th>
								<th width="60">가격</th>
								<th width="100">상품 이미지</th>
							</tr>
							<c:forEach var="item" items="${item_list }">
								<tr
									onclick="location.href='../item/itemDetail.html?seqno=${item.item_seqno }'">
									<td>${item.item_name }</td>
									<td>￦<fmt:formatNumber value="${item.item_price }" type="number"/></td>
									<td><img alt="" width="100px" height="100px"
										src="${pageContext.request.contextPath }/Item_Image/${item.item_image }" /></td>
							</c:forEach>
						</table>
					</div>
				</td>
				<td>
					<div align="center" id="secondhand_latest">
						<h3>최근 게시된 중고거래</h3>
						<table border="1">
							<tr>
								<th width="400">제목</th>
								<th width="60">가격</th>
								<th>지역</th>
								<th width="100">이미지</th>
							</tr>
							<c:forEach var="secondhand" items="${second_list }">
								<tr
									onclick="location.href='../secondhand/Detail.html?seqno=${secondhand.secondhand_seqno }'">
									<td>${secondhand.secondhand_title }</td>
									<td>￦<fmt:formatNumber value="${secondhand.secondhand_price }" type="number"/></td>
									<td width="50px">${secondhand.secondhand_local }</td>
									<td><img alt="" width="100px" height="100px"
										src="${pageContext.request.contextPath }/Secondhand_Image/${secondhand.secondhand_image }" /></td>
							</c:forEach>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center" id="bbs_latest">
						<h3>최근 자유게시판 글</h3>
						<table border="1">
							<tr>
								<th width="600">제목</th>
							</tr>
							<c:forEach var="freebbs" items="${free_list }">
								<tr height="100px" height="100px"
									onclick="location.href='../bbs/bbsDetail.html?seqno=${freebbs.bbs_seqno }&rn=${freebbs.rn}'">
									<td>${freebbs.bbs_title }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>