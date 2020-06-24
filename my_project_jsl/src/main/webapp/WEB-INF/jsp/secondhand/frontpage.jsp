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
<script type="text/javascript">
	function search() {
		var keyword = document.getElementById("searchForm").value;
		var type = document.getElementById("searchType").value;
		var encoded = encodeURI(encodeURIComponent(keyword));
		window.location.href = "../secondhand/search.html?type=" + type
				+ "&keyword=" + encoded;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../index/header.jsp"></jsp:include>
	<div id="wrapper" align="center">
		<h3>중고 거래 게시판</h3>
		<input type="button" value="글 작성" name="write"
			onclick="location.href='../secondhand/writeform.html'"
			style="float: right;"> <br /> <br />
		<div id="table">
			<table style="border-style: solid;">
				<tr>
					<td width="50px">글번호</td>
					<td colspan="2" width="500px">글제목</td>
					<td width="100px">가격</td>
					<td width="100px">작성자</td>
					<td width="100px">작성일</td>
				</tr>
				<c:forEach items="${Secondhand }" var="Secondhand">
					<tr height="50px" onclick="location.href='../secondhand/Detail.html?seqno=${Secondhand.secondhand_seqno }'">
						<td width="50px">${Secondhand.secondhand_seqno }</td>
						<td width="100px"><img alt="" width="100px"
							src="${pageContext.request.contextPath }/Secondhand_Image/${Secondhand.secondhand_image }" /></td>
						<td>${Secondhand.secondhand_title }</td>
						<td>${Secondhand.secondhand_price }</td>
						<td>${Secondhand.secondhand_writer }</td>
						<td>${Secondhand.secondhand_date }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<c:forEach var="page" begin="1" end="${COUNT}">
				<a href="../secondhand/frontpage.html?pgeNo=${page }">${page }</a>
			</c:forEach>
			<br /> <select id="searchType">
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type="text" id="searchForm" /> <input type="button"
				value="검색" name="search" onclick="javascript:search()" />
		</div>
	</div>
</body>
</html>