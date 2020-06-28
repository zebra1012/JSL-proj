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
			<h3>��� ����</h3>
			<c:choose>
				<c:when test="${type==0 }">
			
��й�ȣ
<form action="../secondhand/deleteComment.html" method="GET">
						<input type="password" name="pwd" /> <input type="hidden"
							name="seqno" value="${seqno }" /> <input type="submit"
							value="����">
					</form>
				</c:when>
				<c:when test="${type==1 && sessionScope.Type == 'Formal'}">
					<script type="text/javascript">
						location.href = "../secondhand/deleteComment.html?seqno=${seqno}"
					</script>
				</c:when>
				<c:when test="${sessionScope.Type=='Admin'|| sessionScope.User.admin_power==0 || sessionScope.User.admin_power==1 }">
					<script type="text/javascript">
						location.href = "../secondhand/deleteComment.html?seqno=${seqno}"
					</script>
				</c:when>
				<c:otherwise>
					<script type="text/javascript">
						alert("������ �����ϴ�.");
						self.close();
					</script>
				</c:otherwise>
			</c:choose>
		</c:when>

		<c:when test="${request=='modify' }">

			<c:choose>
				<c:when test="${type==1 && sessionScope.Type == 'Formal'}">
					<h3 align="center">��� ����</h3>
					<form align="center" action="../secondhand/modifyComment.html"
						method="GET">
						�� ����<br /> <input type="hidden"
							value="${sessionScope.User.user_id }" name="writer" /><input
							type="hidden" value="${sessionScope.User.user_pwd }" name="pwd" />
						<textarea cols="20" rows="7" name="content"></textarea>
						<input type="hidden" name="seqno" value="${seqno }" /> <br /> <input
							type="submit" value="����">

					</form>

				</c:when>
				<c:when test="${type==0 }">
					<h3 align="center">��� ����</h3>
					<form align="center" action="../secondhand/modifyComment.html"
						method="GET">
						�ۼ���<br/><input type="text" name="writer" /><br /> ��й�ȣ<br/><input
							type="password" name="pwd" /><br/> �� ����<br />
						<textarea cols="20" rows="7" name="content"></textarea>
						<input type="hidden" name="seqno" value="${seqno }" /><br /> <input
							type="submit" value="����">
					</form>
				</c:when>
				<c:otherwise>
					<script type="text/javascript">
						alert("������ �����ϴ�.");
						self.close();
					</script>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test="${request=='reply' }">
			<h3 align="center">��� �ۼ�</h3>
			<form:form align="center" modelAttribute="reply"
				action="../secondhand/commentReply.html" method="POST">
				<c:choose>
					<c:when
						test="${sessionScope.Type=='Formal' && not empty sessionScope.User }">
						<table>
							<tr>
								<td><form:hidden path="comment_writer"
										value="${sessionScope.User.user_id }" />
								<td rowspan="2"><form:textarea path="comment_content"
										cols="80" rows="5" placeholder="������ �Է����ּ���." /></td>
							<tr>
								<td><form:hidden path="comment_pwd"
										value="${sessionScope.User.user_pwd }" /></td>
								<br />
								<input type="hidden" name="parent_seqno" value="${seqno }" />
							</tr>
						</table>
					</c:when>
					<c:otherwise>
						<table>
							<tr>
								<td><form:input path="comment_writer" placeholder="�ۼ���" />
								<td rowspan="2"><form:textarea path="comment_content"
										cols="80" rows="5" placeholder="������ �Է����ּ���." /></td>
							<tr>
								<td><form:password path="comment_pwd" placeholder="��й�ȣ" /></td>
								<br />
								<input type="hidden" name="parent_seqno" value="${seqno }" />
							</tr>
						</table>
					</c:otherwise>
				</c:choose>
				<br />

				<input type="submit" value="���" />
			</form:form>
		</c:when>
	</c:choose>
</body>
</html>