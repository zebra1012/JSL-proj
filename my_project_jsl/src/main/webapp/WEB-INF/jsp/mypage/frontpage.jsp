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
	<jsp:include page="../index/header.jsp"></jsp:include>
	<c:choose>
		<c:when test="${empty sessionScope.User }">
			<script type="text/javascript">
				alert("권한이 없습니다. 로그인 후 이용해 주세요");
				history.back();
			</script>
		</c:when>

		<c:otherwise>
		<h3 align="center">마이페이지</h3>
			<jsp:include page="../mypage/list.jsp"></jsp:include>
			<c:choose>
				<c:when test="${empty body }">
					<jsp:include page="../mypage/body.jsp"></jsp:include>
				</c:when>
				<c:when test="${not empty body}">
					<jsp:include page="${body }"></jsp:include>
				</c:when>
			</c:choose>
		</c:otherwise>
	</c:choose>
</body>
</html>