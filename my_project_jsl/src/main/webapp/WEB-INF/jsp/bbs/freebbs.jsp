<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
table {
	border: 1px solid;
}

tr td {
	text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../index/header.jsp"></jsp:include>
	<div id="wrapper">
		<input type="button" value="글 작성" name="write"
			onclick="location.href='../bbs/writeform.html?type=free'"
			style="float: right;"> <br />
		<table align="center" border="1">
			<tr>
				<th>글번호</th>
				<th width="300px">글제목</th>
				<th>작성자</th>
				<th>추천 수</th>
				<th>날짜</th>
			</tr>
			<c:choose>
				<c:when test="${empty freebbs }">
					<tr>
						<td colspan="5">작성된 게시글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${freebbs }" var="bbs">
						<tr>
							<td>${bbs.rn }</td>
							<td><a
								href="../bbs/bbsDetail.html?seqno=${bbs.bbs_seqno }&rn=${bbs.rn}">${bbs.bbs_title }</a></td>
							<td>${bbs.bbs_writer }</td>
							<td>${bbs.bbs_hot }</td>
							<td><font size="1">${bbs.bbs_date }</font></td>
						</tr>
					</c:forEach>
				</c:otherwise>

			</c:choose>
		</table>
		<div align="center">
			<c:forEach var="page" begin="1" end="${COUNT}">
				<a href="../bbs/freebbs.html?pageNo=${page }">${page }</a>
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