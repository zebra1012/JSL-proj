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
<h3 align="center">���</h3>
<c:if test="${not empty CommentList }">
<table>
<tr><td>�ۼ���</td><td colspan="3">����</td><td>�ۼ���</td></tr>

<c:forEach var="comment" items="${CommentList}">
<tr><td>${comment.writer }</td><td>${comment.content}</td><td>����</td><td>����</td><td>${comment.date }</td></tr>
</c:forEach>
</table>
</c:if>
<table>
<tr><td><input type="text" placeholder="�ۼ���" Id="writer"><td rowspan="2"><textarea Id="content" placeholder="������ �Է����ּ���."></textarea></td>
<tr><td><input type="text" placeholder="��й�ȣ" Id="pwd">
</table>
<input type="hidden" value="${secondhand.secondhand_seqno}" Id="parent"/>
<input type="button" value="���" onclick="submit()" /><input type="button" value="�������" onclick="history.back()"/>
</div>
</body>
</html>