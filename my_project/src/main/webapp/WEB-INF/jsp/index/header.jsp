<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
li#top_list {
	list-style: none;
	float: left;
	margin-left: 20px;
}
ul#top_list {
	display:table;
	margin-left:auto;
	line-height: 1px;
}
input#btn {
	width:300px;
	height:200px;
}
div#wrapper{
	width:90%;
	margin-left: 5%;
}
</style>
<script type="text/javascript">
function LoginPopup() {
	window.open("../index/login.html","�α���","status=no,location=no,toolbars=no,scrollbars=no,height=300,width=600")
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper" >
	<div id="top_list">
		<ul id="top_list"> 
		<c:choose>
			<c:when test="${not empty User  }">
			<li id="top_list">ȯ���մϴ�! 
			<c:if test="${Type == 'Formal' }"> ${User.user_id }��</c:if>
			<c:if test="${Type=='Company' }"> ${User.company_id }��</c:if>
			</li>
			<li id="top_list"><a href="../index/logout.html">�α׾ƿ�</a></li>
			<li id="top_list"><a href="l">�� ����</a></li>
			</c:when>
			<c:when test="${empty User }">
			<li id="top_list"><a href="javascript:LoginPopup()">�α���</a></li>
			<li id="top_list"><a href="../index/entry.html">ȸ������</a></li>
			</c:when>
		</c:choose>
		</ul>
		<hr/>
	</div>
	<div id="buttons" align="center">
	<input id="btn" type="button" value="���θ޴�" onclick="location.href='../index/showMessage.html'"/>
	<input id="btn" type="button" value="�߰�ŷ�"/>
	<input id="btn" type="button" value="���¸���"/>
	<input id="btn" type="button" value="Ŀ�´�Ƽ"/>
	<input id="btn" type="button" value="����������"/>
	<hr/>
	</div>
	</div>
</body>
</html>