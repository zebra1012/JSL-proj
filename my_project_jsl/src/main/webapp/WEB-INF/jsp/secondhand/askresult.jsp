<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${request=='delete' }">
			<h3>댓글 삭제</h3>
비밀번호
<form action="../secondhand/deleteComment.html" method="GET">
				<input type="password" name="pwd" /> <input type="hidden"
					name="seqno" value="${seqno }" /> <input type="submit" value="삭제">
			</form>
		</c:when>
		<c:when test="${request=='modify' }">
			<h3>댓글 수정</h3>
			<form action="../secondhand/modifyComment.html" method="GET">
				작성자<input type="text" name="writer" /><br /> 비밀번호 <input
					type="password" name="pwd" /><br /> 글 내용
				<textarea name="content"></textarea>
				<input type="hidden" name="seqno" value="${seqno }" /> <input
					type="submit" value="삭제">
			</form>
		</c:when>
		<c:when test="${request=='reply' }">
			<h3>답글 작성</h3>
			<form:form modelAttribute="reply" action="../secondhand/commentReply.html"
				method="POST">
				<table>
					<tr>
						<td><form:input path="comment_writer" placeholder="작성자"/>
						<td rowspan="2"><form:textarea path="comment_content" cols="80" rows="5"
								placeholder="내용을 입력해주세요."/></td>
					<tr>
						<td><form:password path="comment_pwd" placeholder="비밀번호"/></td>
						<input type="hidden" name="parent" value="${seqno }"/>
					</tr>
				</table> <br/>
				
				<input type="submit" value="등록"/>
			</form:form>
		</c:when>
	</c:choose>
</body>
</html>