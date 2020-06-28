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
		alert("�� ������ �Է��ϼ���.");
		document.writeform.bbs_title.focus();
		return false;
	}
	if(document.writeform.bbs_writer.value=='') {
		alert("�ۼ��ڸ� �Է��ϼ���.");
		document.writeform.bbs_writer.focus();
		return false;
	}
	if (document.writeform.bbs_password.value=='') {
		alert("��й�ȣ�� �Է��ϼ���");
		document.writeform.bbs_password.focus();
		return false;
	}
	if(document.writeform.bbs_content.value=="") {
		alert("�� ������ �Է��ϼ���.");
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
		<h3>�Խñ� �ۼ�</h3>
		<c:choose>
			<c:when test="${sessionScope.Type == 'Formal' }">
				<!-- �ۼ��ڰ� �Ϲ�ȸ�� ,�ۼ��� �� ��й�ȣ�� �Է��� �ʿ䰡 ����.-->

				<form:form name="writeform" modelAttribute="BBS"
					action="../bbs/write.html" method="POST"
					enctype="multipart/form-data">
					<table border="1" align="center">
						<tr>
							<td>������</td>
							<td><form:input path="bbs_title" /></td>
						</tr>
						<tr>
							<td>�̹���</td>
							<td><input type="File" name="bbs_image" /></td>
						</tr>
						<tr>
							<td>����</td>
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
						<input type="submit" value="���" onclick="return validation(this)" />
					</div>
				</form:form>
			</c:when>
			<c:otherwise>
				<!-- �Ϲ�ȸ���� �ƴ� �� ��й�ȣ�� �ۼ��ڸ� �Է¹޴´�. -->
				<form:form name="writeform" modelAttribute="BBS"
					action="../bbs/write.html" method="POST"
					enctype="multipart/form-data">
					<table border="1" align="center">
						<tr>
							<td>������</td>
							<td><form:input path="bbs_title" /></td>
						</tr>
							<tr>
							<td>�ۼ���</td>
							<td><form:input path="bbs_writer" /></td>
						</tr>
						<tr>
							<td>��й�ȣ</td>
							<td><form:password path="bbs_password" /></td>
						</tr>
						<tr>
							<td>�̹���</td>
							<td><input type="File" name="bbs_image" /></td>
						</tr>
						<tr>
							<td>����</td>
							<td><form:textarea style="width:100%; height:20%;"
									path="bbs_content" /></td>
						</tr>
					
					</table>
					<form:hidden path="bbs_code" value="${bbstype }" />
					<br />
					<div align="center">
						<input type="submit" value="���" onclick="return validation()" />
					</div>
				</form:form>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>