<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function pwd_validation() {
		if (document.frm.pwd.value == '') {
			alert("��й�ȣ�� �Է��ϼ���.")
			return false;
		}
		if (document.frm.pwd.value == document.frm.pwdcheck.value) {
			alert("��й�ȣ�� �������� �ʽ��ϴ�.");
			return false;
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrapper" align="center">
		<h3>��й�ȣ ã�� �� ����</h3>
		<c:choose>
			<c:when test="${result =='Fail' }">
				<script type="text/javascript">
					alert("�ش� ������ �����ϴ�.");
					location.href="../index/findAccount.html";
				</script>
			</c:when>
			<c:when test="${userType=='Formal' }">
				<form action="../index/FormalChangePWD.html" name="frm"
					method="POST">
					<table>
						<tr>
							<td>��й�ȣ�Է�</td>
							<td><input type="password" name="user_pwd" /></td>
						</tr>
						<tr>
							<td>��й�ȣȮ��</td>
							<td><input type="password" name="pwdcheck" /></td>
						</tr>
					</table>
					<input type="hidden" value="${tempUser.user_id }" name="user_id" /> <input
						type="submit" value="��й�ȣ ����" onclick="return pwd_validation()" />
				</form>
			</c:when>

			<c:when test="${userType=='Company' }">
				<form action="../index/CompanyChangePWD.html" name="frm"
					method="POST">
					<table>
						<tr>
							<td>��й�ȣ�Է�</td>
							<td><input type="password" name="company_pwd" /></td>
						</tr>
						<tr>
							<td>��й�ȣȮ��</td>
							<td><input type="password" name="pwdcheck" /></td>
						</tr>
					</table>
					<input type="hidden" value="${tempUser.company_id }" name="company_id" />
					<input type="submit" value="��й�ȣ ����"
						onclick="return pwd_validation()" />
				</form>
			</c:when>
		</c:choose>
	</div>

</body>
</html>