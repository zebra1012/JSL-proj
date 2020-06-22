<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function submit() {
		var writer = document.getElementById("writer").value;
		var password = document.getElementById("pwd").value;
		var content = document.getElementById("content").value;
		var parent = document.getElementById("parent").value;
		var Type=document.getElementById("Type").value;
		var RN = document.getElementById("RN").value;
		
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", "../bbs/commentWrite.html");

		document.body.appendChild(form);

		var input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "writer");
		input.setAttribute("value", writer);
		form.appendChild(input);

		input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "pwd");
		input.setAttribute("value", password);
		form.appendChild(input);

		input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "content");
		input.setAttribute("value", content);
		form.appendChild(input);

		input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "parent");
		input.setAttribute("value", parent);
		form.appendChild(input);

		input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "Type");
		input.setAttribute("value", Type);
		form.appendChild(input);
		
		input = document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","RN");
		input.setAttribute("value",RN);
		form.appendChild(input);
		
		form.submit();
	}
</script>
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper" align="center">
		<h3 align="center">댓글</h3>
		<c:if test="${not empty comment }">
			<table border="1">
				<tr>
					<td>작성자</td>
					<td colspan="4" width="720px">내용</td>
					<td>작성일</td>
				</tr>

				<c:forEach var="comment" items="${comment}">
					<tr>
						<td>${comment.comment_writer }</td>
						<td width="600px" style="text-align:left;">${comment.comment_content}</td>
						<td width="40px"><input type="button" onclick="window.open('../bbs/askpwd.html?request=reply&seqno='+${comment.comment_seqno},'_blank','width=450,height=200')"
							value="답글"></td>
						<td width="40px"><input type="button" onclick="window.open('../bbs/askpwd.html?request=modify&seqno='+${comment.comment_seqno},'_blank','width=450,height=200')"
							value="수정" /></td>
						<td width="40px"><input type="button" onclick="window.open('../bbs/askpwd.html?request=delete&seqno='+${comment.comment_seqno},'_blank','width=450,height=200')"
							value="삭제"/></td>
						<td><font size="1">${comment.comment_date }</font></td>
					</tr>
					<div id="hidden">
					
					</div>
				</c:forEach>
			</table>
		</c:if>
		<br /> <br />
		<table>
			<c:choose>
				<c:when test="${sessionScope.Type=='Formal' }">
					<tr>
						<td><input type="hidden"
							value="${sessionScope.User.user_id }" Id="writer">
						<td rowspan="2"><textarea Id="content" cols="80" rows="5"
								placeholder="내용을 입력해주세요."></textarea></td>
					<tr>
						<td><input type="hidden" value="${sessionScope.User.user_pwd }" Id="pwd"></td>
						<input type="hidden" value="Formal" id="Type"/>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td><input type="text" placeholder="작성자" Id="writer">
						<td rowspan="2"><textarea Id="content" cols="80" rows="5"
								placeholder="내용을 입력해주세요."></textarea></td>
					<tr>
						<td><input type="password" placeholder="비밀번호" Id="pwd"></td>
						<input type="hidden" value="other" id="Type"/>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<input type="hidden" value="${target.bbs_seqno}"
			Id="parent" />
		<input type="hidden" value="${target.rn }" Id="RN"/> <input type="button" value="등록"
			onclick="javscript:submit()" /><input type="button" value="목록으로"
			onclick="history.back()" />
	</div>
</body>
</html>