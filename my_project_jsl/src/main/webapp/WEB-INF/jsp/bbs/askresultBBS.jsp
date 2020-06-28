<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${request == 'delete' }">
			<h3 align="center">게시글 삭제</h3>
			<form action="../bbs/delete.html" method="POST">비밀번호<br/>
				<input type="password" name="pwd" /><br/> <input type="hidden"
					name="seqno" value="${seqno }" /> <input type="submit" value="삭제">
			</form>
		</c:when>
		<c:when test="${request == 'modify' }">
			<h3 align="center">게시글 수정</h3>
			<form action="../bbs/modifyBBS.html" method="POST">비밀번호<br/>
				<input type="password" name="pwd" /><br/> <input type="hidden"
					name="seqno" value="${seqno }" /><input type="hidden" name="rn"
					value="${rn }" /> <input type="submit" value="수정">
			</form>
		</c:when>
	</c:choose>
</body>
</html>