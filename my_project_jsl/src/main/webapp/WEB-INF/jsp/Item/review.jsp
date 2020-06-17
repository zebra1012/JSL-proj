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
		<h3 align="center">후기</h3>
		<c:if test="${not empty ReviewList }">
			<table border="1">
				<tr>
					<td colspan="4" width="720px">후기</td>
					<td>작성자</td>
					<td>평점</td>
					<td>게시일</td>
				</tr>

				<c:forEach var="review" items="${ReviewList}">
					<tr>
						<td><img alt="" width="100px"
							src="${pageContext.request.contextPath }/Review_Image/${review.review_image }" />
						</td>
						<td width="500px" style="text-align: left;">${review.review_content}</td>
						<c:choose>
						<c:when test="${sessionScope.Type =='Admin' || (sessionScope.Type=='Formal' && sessionScope.User.user_id==review.review_writer) }">
						<td width="40px"><input type="button"
							onclick="window.open('../Item/askpwd.html?request=modify&seqno='+${review.review_seqno},'_blank','width=450,height=200')"
							value="수정"></td>
						<td width="40px"><input type="button"
							onclick="window.open('../Item/askpwd.html?request=delete&seqno='+${review.review_seqno},'_blank','width=450,height=200')"
							value="삭제" /></td>
						</c:when>
						<c:otherwise>			
						<td width="0"></td><td width="0"></td>
						</c:otherwise>
						</c:choose>
						<td>${review.review_writer }</td>
						<td>${review.review_star }</td>
						<td><font size="1">${review.review_date }</font></td>
					</tr>
					<div id="hidden"></div>
				</c:forEach>
			</table>
		</c:if>
		<c:choose>
			<c:when test="${sessionScope.Type=='Formal' }">
				<input type="button" value="후기 작성 " style="float: right; margin-right:10%"
				onclick="window.location.href='../Item/writeReview.html?parent=${item.item_seqno}'" />
			</c:when>
		</c:choose>
	</div>
</body>
</html>