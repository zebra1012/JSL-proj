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
		<input type="button" value="�� �ۼ�" name="write"
			onclick="location.href='../bbs/writeform.html?type=free'"
			style="float: right;"> <br />
		<table align="center" border="1">
			<tr>
				<th>�۹�ȣ</th>
				<th width="300px">������</th>
				<th>�ۼ���</th>
				<th>��õ ��</th>
				<th>��¥</th>
			</tr>
			<c:choose>
				<c:when test="${empty freebbs }">
					<tr>
						<td colspan="5">�ۼ��� �Խñ��� �����ϴ�.</td>
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
				<option value="writer">�ۼ���</option>
				<option value="title">����</option>
				<option value="content">����</option>
			</select> <input type="text" id="searchForm" /> <input type="button"
				value="�˻�" name="search" onclick="javascript:search()" />
		</div>
	</div>

</body>
</html>