<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function validation(){
	if(document.writeform.bbs_title.value=='') {
		alert("글 제목을 입력하세요.");
		document.writeform.bbs_title.focus();
		return false;
	}
	if(document.writeform.bbs_writer.value=='') {
		alert("작성자를 입력하세요.");
		document.writeform.bbs_writer.focus();
		return false;
	}
	if (document.writeform.bbs_password.value=='') {
		alert("비밀번호를 입력하세요");
		document.writeform.bbs_password.focus();
		return false;
	}
	if(document.writeform.bbs_content.value=="") {
		alert("글 내용을 입력하세요.");
		document.writeform.bbs_content.focus();
		return false;
	}
	
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../index/header.jsp"></jsp:include>
	<div id="wrapper">
		<h3>게시글 작성</h3>
		<c:choose>
			<c:when test="${sessionScope.Type == 'Formal' }">
				<!-- 작성자가 일반회원 ,작성자 및 비밀번호를 입력할 필요가 없다.-->

				<form:form name="writeform" modelAttribute="BBS"
					action="../bbs/write.html" method="POST"
					enctype="multipart/form-data">
					<table border="1" align="center">
						<tr>
							<td>글제목</td>
							<td><form:input path="bbs_title" /></td>
						</tr>
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
					<form:hidden path="bbs_writer"
						value="${sessionScope.User.user_id }" />
					<form:hidden path="bbs_password" value="IDK"/>
					<form:hidden path="bbs_code" value="${bbstype }" />
					<br />
					<div align="center">
						<input type="submit" value="등록" onclick="return validation(this)" />
					</div>
				</form:form>
			</c:when>
			<c:otherwise>
				<!-- 일반회원이 아닐 때 비밀번호와 작성자를 입력받는다. -->
				<form:form name="writeform" modelAttribute="BBS"
					action="../bbs/write.html" method="POST"
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
						<tr>
							<td>비밀번호</td>
							<td><form:password path="bbs_password" /></td>
						</tr>
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
					<form:hidden path="bbs_code" value="${bbstype }" />
					<br />
					<div align="center">
						<input type="submit" value="등록" onclick="return validation()" />
					</div>
				</form:form>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>