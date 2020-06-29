<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function validation(){
	if(document.frm.admin_id.value=='') {
		alert("ID를 입력하세요.");
		return false;
	}
	if (document.frm.admin_pwd.value==''){
		alert("패스워드를 입력하세요.");
		return false;
	}
	if (document.frm.admin_pwd.value!=document.frm.pwdcheck.value) {
		alert("패스워드를 확인하세요.");
		return false;
	}
	if (document.frm.admin_power.value==9) {
		alert("부여할 권한을 선택하세요.");
		return false;
	}
	var c = confirm("위 정보로 관리자를 등록하시겠습니까?");
	if (!c) {return false; }
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br><br/><br/><br/><br/>
<div align="center">
		<form:form action="../mypage/Adminadd.html" name="frm" method="POST"
			modelAttribute="admin">
			<table>
				<tr>
					<td>ID</td>
					<td><form:input path="admin_id" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><form:password path="admin_pwd" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pwdcheck" /></td>
				</tr>
				<tr>
					<td>권한</td>
					<td><form:select path="admin_power">
							<form:option value="9">권한부여</form:option>
							<form:option value="1">중고거래</form:option>
							<form:option value="2">오픈마켓</form:option>
							<form:option value="3">커뮤니티</form:option>
						</form:select>
			</table>
			<input type="submit" value="등록" onclick="return validation()" />

		</form:form>
		</div>
</body>
</html>