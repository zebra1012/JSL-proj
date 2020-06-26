<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${result == 'Fail' }">
			<script type="text/javascript">
				alert("권한이 없습니다. 게시글을 작성한 회원만 수정할 수 있습니다.");
				self.close();
				opener.reload();
			</script>
		</c:when>
		<c:otherwise>
			<form:form name="writeform" modelAttribute="bbs"
				action="../bbs/modify.html" method="POST"
				enctype="multipart/form-data">
				<table border="1" align="center">
					<tr>
						<td>글제목</td>
						<td><form:input path="bbs_title" /></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><form:input path="bbs_writer" /></td>
					</tr>
						<form:hidden path="bbs_password" value="popup" />
					<tr>
						<td>이미지</td>
						<td><input type="File" name="bbs_image" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><form:textarea style="width:100%; height:20%;"
								path="bbs_content" /></td>
					</tr>

				</table>
				<form:hidden path="bbs_seqno" value="${seqno }" />
				<form:hidden path="rn" value="${rn }" />
				<br />
				<div align="center">
					<input type="submit" value="등록" />
				</div>
			</form:form>
		</c:otherwise>
	</c:choose>
</body>
</html>