<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="menu"
		style="float: right; margin-right: 320px; margin-top: 80px;">
		<form action="../mypage/AdminChange.html" method="POST">
			<table>
				<tr>
					<td>���� ��ȣ</td>
					<td><input type="password" name="present" />
				</tr>
				<tr>
					<td>������ ��ȣ</td>
					<td><input type="password" name="new" />
					</td>
				</tr>
				<tr>
					<td>������ ��ȣ Ȯ��</td>
					<td><input type="password" name="pwdcheck"/>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center"><input type="submit" value="����"/></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>