<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function pwd_validation() {
		if (document.frm.pwd.value == '') {
			alert("비밀번호를 입력하세요.")
			return false;
		}
		if (document.frm.pwd.value == document.frm.pwdcheck.value) {
			alert("비밀번호가 동일하지 않습니다.");
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
		<h3>비밀번호 찾기 및 변경</h3>
		<c:choose>
			<c:when test="${result =='Fail' }">
				<script type="text/javascript">
					alert("해당 계정이 없습니다.");
					location.href="../index/findAccount.html";
				</script>
			</c:when>
			<c:when test="${userType=='Formal' }">
				<form action="../index/FormalChangePWD.html" name="frm"
					method="POST">
					<table>
						<tr>
							<td>비밀번호입력</td>
							<td><input type="password" name="user_pwd" /></td>
						</tr>
						<tr>
							<td>비밀번호확인</td>
							<td><input type="password" name="pwdcheck" /></td>
						</tr>
					</table>
					<input type="hidden" value="${tempUser.user_id }" name="user_id" /> <input
						type="submit" value="비밀번호 변경" onclick="return pwd_validation()" />
				</form>
			</c:when>

			<c:when test="${userType=='Company' }">
				<form action="../index/CompanyChangePWD.html" name="frm"
					method="POST">
					<table>
						<tr>
							<td>비밀번호입력</td>
							<td><input type="password" name="company_pwd" /></td>
						</tr>
						<tr>
							<td>비밀번호확인</td>
							<td><input type="password" name="pwdcheck" /></td>
						</tr>
					</table>
					<input type="hidden" value="${tempUser.company_id }" name="company_id" />
					<input type="submit" value="비밀번호 변경"
						onclick="return pwd_validation()" />
				</form>
			</c:when>
		</c:choose>
	</div>

</body>
</html>