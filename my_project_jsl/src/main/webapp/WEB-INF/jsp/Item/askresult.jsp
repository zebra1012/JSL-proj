<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${request=='delete' }">
			<script type="text/javascript">
				window.location.href = "../Item/reviewDelete.html?seqno=${seqno}"
			</script>
		</c:when>
		<c:when test="${request=='modify' }">
			<h3 align="center">후기 수정</h3>
			<form align="center" action="../item/modifyReview.html" method="POST"
				enctype="multipart/form-data">
				평점<br /> <label><input type="radio" name="star" value="1" />매우
					나쁨</label> <label><input type="radio" name="star" value="2" />나쁨</label> <label><input
					type="radio" name="star" value="3" />보통</label> <label><input
					type="radio" name="star" value="4" />추천</label> <label><input
					type="radio" name="star" value="5" />매우 추천</label> <br /> <br /> 이미지 <br />
				<input type="file" name="image"> <br /> <br /> 후기 내용<br />
				<input type="hidden" name="seqno" value="${seqno }" />
				<textarea name="content"></textarea>
				<br /> <br /> <input type="submit" value="수정">

			</form>
		</c:when>
	</c:choose>
</body>
</html>