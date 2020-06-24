<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="menu"
		style="float: right; margin-right: 320px; margin-top: 80px;">
		<form:form modelAttribute="CU" action="../mypage/CompanyChange.html"
			Method="POST">
			<table>
				<tr>
					<td>상호</td>
					<td><form:input path="company_name" /></td>
				</tr>
				<tr>
					<td>암호</td>
					<td><form:password path="company_pwd" />
				</tr>
				<tr>
					<td>암호 확인</td>
					<td><input type="password" name="pwdcheck" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><form:input path="company_addr" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><form:input path="company_email" /></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><form:input path="company_phone" /></td>
				</tr>
				<tr>
					<td>담당자</td>
					<td><form:input path="company_manager" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="변경" /></td>
					<td><input type="button" value="탈퇴" onclick="location.href='../mypage/deleteCompany.html'"/>
			</table>
		</form:form>
	</div>
</body>
</html>