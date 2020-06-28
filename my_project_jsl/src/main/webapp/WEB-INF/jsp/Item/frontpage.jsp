<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
tr {
	text-align: center;
}

td {
	text-align: center;
	border-style: solid;
}
</style>
<script type="text/javascript" charset="EUC-KR">
	function search() {
		var keyword = document.getElementById("searchForm").value;
		var type = document.getElementById("searchType").value;
		if (keyword=='') {
			alert("�˻�� �Է��ϼ���.");
			return false;
		}
		var encoded = encodeURI(encodeURIComponent(keyword));
		location.href = "../item/search.html?type=" + type + "&keyword="
				+ encoded;

	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../index/header.jsp"></jsp:include>
	<div id="wrapper" align="center">
		<h3>���� ����</h3>
		<input type="button" value="�� �ۼ�" name="write"
			onclick="location.href='../item/writeform.html'"
			style="float: right;"> <br /> <br />
		<div id="table">
			<table style="border-style: solid;">
				<tr>
					<td width="50px">�۹�ȣ</td>
					<td colspan="2" width="500px">������</td>
					<td width="100px">����</td>
					<td width="100px">�ۼ���</td>
				</tr>
				<c:forEach items="${Items }" var="item">
					<tr height="50px"
						onclick="location.href='../item/itemDetail.html?seqno=${item.item_seqno }'">
						<td width="50px">${item.item_seqno }</td>
						<td width="100px"><img alt="" width="100px"
							src="${pageContext.request.contextPath }/Item_Image/${item.item_image }" /></td>
						<td>${item.item_name }</td>
						<td>${item.item_price }</td>
						<td>${item.item_writer }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<c:forEach var="page" begin="1" end="${COUNT}">
				<a href="../item/frontpage.html?pgeNo=${page }">${page }</a>
			</c:forEach>
			<br /> <select id="searchType">
				<option value="writer">��ȣ</option>
				<option value="name">��ǰ��</option>
				<option value="content">����</option>
			</select> <input type="text" id="searchForm" /> <input type="button"
				value="�˻�" name="search" onclick="javascript:search()" />
		</div>
	</div>
</body>
</html>