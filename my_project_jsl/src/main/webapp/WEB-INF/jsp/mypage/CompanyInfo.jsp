<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="menu"
		style="float: right; margin-right: 320px; margin-top: 80px;">
		<table>
			<tr>
				<td width="80px">��ȣ</td>
				<td width="200px"><input type="text" disabled="disabled"
					value="${sessionScope.User.company_name }" /></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" disabled="disabled"
					value="${sessionScope.User.company_id }" /></td>
			</tr>
			<tr>
				<td>�ּ�</td>
				<td><input type="text" disabled="disabled"
					value="${sessionScope.User.company_addr }" /></td>
			</tr>
			<tr>
				<td>�̸���</td>
				<td><input type="text" disabled="disabled"
					value="${sessionScope.User.company_email }" /></td>
			</tr>
			<tr>
				<td>����ó</td>
				<td><input type="text" disabled="disabled"
					value="${sessionScope.User.company_phone }" /></td>
			</tr>
			<tr>
				<td>�����</td>
				<td><input type="text" disabled="disabled"
					value="${sessionScope.User.company_manager }" /></td>
			</tr>
		</table>
	</div>
</body>
</html>