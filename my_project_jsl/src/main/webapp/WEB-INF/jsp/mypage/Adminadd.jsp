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
		alert("ID�� �Է��ϼ���.");
		return false;
	}
	if (document.frm.admin_pwd.value==''){
		alert("�н����带 �Է��ϼ���.");
		return false;
	}
	if (document.frm.admin_pwd.value!=document.frm.pwdcheck.value) {
		alert("�н����带 Ȯ���ϼ���.");
		return false;
	}
	if (document.frm.admin_power.value==9) {
		alert("�ο��� ������ �����ϼ���.");
		return false;
	}
	var c = confirm("�� ������ �����ڸ� ����Ͻðڽ��ϱ�?");
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
					<td>��й�ȣ</td>
					<td><form:password path="admin_pwd" /></td>
				</tr>
				<tr>
					<td>��й�ȣ Ȯ��</td>
					<td><input type="password" name="pwdcheck" /></td>
				</tr>
				<tr>
					<td>����</td>
					<td><form:select path="admin_power">
							<form:option value="9">���Ѻο�</form:option>
							<form:option value="1">�߰�ŷ�</form:option>
							<form:option value="2">���¸���</form:option>
							<form:option value="3">Ŀ�´�Ƽ</form:option>
						</form:select>
			</table>
			<input type="submit" value="���" onclick="return validation()" />

		</form:form>
		</div>
</body>
</html>