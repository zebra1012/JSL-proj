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
	<c:choose>
		<c:when test="${Authorization =='Negative' }">
			<script type="text/javascript">
				alert("권한이 없습니다.");
				history.back();
			</script>
		</c:when>
		<c:when test="${Authorization == 'Positive'}">
			<c:choose>
				<c:when test="${Types=='Formal' }">
					<table>
						<tr>
							<th>ID</th>
							<th>이름</th>
							<th>이메일</th>
							<th>주소</th>
							<th>연락처</th>
						</tr>
						<c:forEach var="formal" items="${Users}">
							<tr>
								<td>${formal.user_id }</td>
								<td>${formal.user_name }</td>
								<td>${formal.user_email }</td>
								<td>${formal.user_addr }</td>
								<td>${formal.user_phone }</td>
							</tr>
						</c:forEach>
					</table>
				</c:when>
				<c:when test="${Types=='Company' }">
					<table>
						<tr>
							<th>ID</th>
							<th>상호</th>
							<th>이메일</th>
							<th>주소</th>
							<th>연락처</th>
						</tr>
						<c:forEach var="user" items="${Users}">
							<tr>
								<td>${user.company_id }</td>
								<td>${user.company_name }</td>
								<td>${user.company_email }</td>
								<td>${user.company_addr }</td>
								<td>${user.company_phone }</td>
							</tr>
						</c:forEach>
					</table>
				</c:when>
				<c:when test="${Types=='Admin' }">
				<tr><th>관리자 계정</th><th>관리자 권한</th></tr>
				<c:forEach var="user" items="${Users }">
					<tr>
						<td>${user.admin_id }</td>
							<c:choose>
								<c:when test="${user.admin_power ==0 }">
									<td>마스터</td>
								</c:when>
								<c:when test="${user.admin_power ==1 }">
									<td>중고</td>
								</c:when>
								<c:when test="${user.admin_power ==2 }">
									<td>오픈마켓</td>
								</c:when>
								<c:when test="${user.admin_power==3 }">
									<td>게시판</td>
								</c:when>
							</c:choose></c:forEach>
				</c:when>
			</c:choose>
		</c:when>
	</c:choose>
</body>
</html>