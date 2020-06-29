<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
tr td th {
	border: 1px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${Authorization =='Negative' }">
			<script type="text/javascript">
				alert("������ �����ϴ�.");
				history.back();
			</script>
		</c:when>
		<c:when test="${Authorization == 'Positive'}">
			<c:choose>
				<c:when test="${Types=='Formal' }">
					<br />
					<br />
					<br />
					<br />
					<br />
					<div align="center">
						<table border="1">
							<tr>
								<th>ID</th>
								<th>�̸�</th>
								<th>�̸���</th>
								<th>�ּ�</th>
								<th>����ó</th>
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
					</div>
				</c:when>

				<c:when test="${Types=='Company' }">
					<br />
					<br />
					<br />
					<br />
					<br />
					<div align="center">
						<table border="1">
							<tr>
								<th>ID</th>
								<th>��ȣ</th>
								<th>�̸���</th>
								<th>�ּ�</th>
								<th>����ó</th>
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
					</div>
				</c:when>
				<c:when test="${Types=='Admin' }">
					<br />
					<br />
					<br />
					<br />
					<br />
					<div>
						<table align="center" border="1">
							<tr>
								<th>������ ����</th>
								<th>������ ����</th>
							</tr>
							<c:forEach var="user" items="${Users }">
								<tr>
									<td>${user.admin_id }</td>
									<c:choose>
										<c:when test="${user.admin_power ==0 }">
											<td>������</td>
										</c:when>
										<c:when test="${user.admin_power ==1 }">
											<td>�߰�</td>
										</c:when>
										<c:when test="${user.admin_power ==2 }">
											<td>���¸���</td>
										</c:when>
										<c:when test="${user.admin_power==3 }">
											<td>�Խ���</td>
										</c:when>
									</c:choose>
							</c:forEach>
						</table>
					</div>
					<div align="center">
						<input type="button" value="������ �߰�"
							onclick="location.href='../mypage/AdminAdd.html'" />
					</div>
				</c:when>

			</c:choose>
		</c:when>
	</c:choose>
</body>
</html>