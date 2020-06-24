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
				<td width="80px">ID</td>
				<td width="200px"><input type="text" disabled="disabled"
					value="${sessionScope.User.user_id }" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" disabled="disabled"
					value="${sessionScope.User.user_name }" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" disabled="disabled"
					value="${sessionScope.User.user_addr }" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" disabled="disabled"
					value="${sessionScope.User.user_email }" /></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" disabled="disabled"
					value="${sessionScope.User.user_phone }" /></td>
			</tr>
		</table>
	</div>
</body>
</html>