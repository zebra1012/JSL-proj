<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3 align="center">${sessionScope.User.user_id }님의 게시글 </h3>
	<table align="center" border="1">
		<tr>
			<th width="300px">글제목</th>
			<th>날짜</th>
		</tr>
		<c:choose>
			<c:when test="${empty BBS }">
				<tr>
					<td colspan="3">작성된 게시글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${BBS }" var="bbs">
					<tr>
						<td><a
							href="../bbs/bbsDetail.html?seqno=${bbs.bbs_seqno }">${bbs.bbs_title }</a></td>
						<td><font size="1">${bbs.bbs_date }</font></td>
					</tr>
				</c:forEach>
			</c:otherwise>

		</c:choose>
	</table>
</body>
</html>