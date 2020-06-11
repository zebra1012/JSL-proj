<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function submit(){
	var writer=document.getElementById("writer").value;
	var password=document.getElementById("pwd").value;
	var content=document.getElementById("content").value;
	var parent=document.getElementById("parent").value;
	var form = document.createElement("form");
	form.setAttribute("method","POST");
	form.setAttribute("action","../secondhand/commentWrite.html");
	var input= document.createElement("input");
	input.setAttribute("type","hidden");
	input.setAttribute("name","writer");
	input.setAttribute("value",writer);
	form.appendChild(input);
	
	input = document.createElement("input");
	input.setAttribute("type","hidden");
	input.setAttribute("name","pwd");
	input.setAttribute("value",password);
	form.appendChild(input);
	
	input = document.createElement("input");
	input.setAttribute("type","hidden");
	input.setAttribute("name","content");
	input.setAttribute("value",content);
	form.appendChild(input);
	
	input = document.createElement("input");
	input.setAttribute("type","hidden");
	input.setAttribute("name","parent");
	input.setAttribute("value",parent);
	form.appendChild(input);
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
<h3 align="center">댓글</h3>
<c:if test="${not empty CommentList }">
<table>
<tr><td>작성자</td><td colspan="3">내용</td><td>작성일</td></tr>

<c:forEach var="comment" items="${CommentList}">
<tr><td>${comment.writer }</td><td>${comment.content}</td><td>수정</td><td>삭제</td><td>${comment.date }</td></tr>
</c:forEach>
</table>
</c:if>
<table>
<tr><td><input type="text" placeholder="작성자" Id="writer"><td rowspan="2"><textarea Id="content" placeholder="내용을 입력해주세요."></textarea></td>
<tr><td><input type="text" placeholder="비밀번호" Id="pwd">
</table>
<input type="hidden" value="${secondhand.secondhand_seqno}" Id="parent"/>
<input type="button" value="등록" onclick="submit()" /><input type="button" value="목록으로" onclick="history.back()"/>
</div>
</body>
</html>