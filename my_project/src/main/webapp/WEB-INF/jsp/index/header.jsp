<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
div.header {
	background-image: url("image/dream-4827288_640.jpg");
	background-position: center;
	text-align: center;
	background-size: cover;
	background-repeat: no-repeat;
	max-height: 30%;
	height: 400px;
	line-height: 21;
}

div.small_Menu {
}

div.Huge_Menu {
	background-image: url("image/images.png");
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
	height: 60px;
}

li {
	list-style: none;
	float: left;
	margin-left: 20px;
}

ul.Huge_Menu_List {
	display: table;
	margin-left: auto;
	margin-right: auto;
	line-height: 1px;
}
ul.small_Menu_list{
display:table;
font-size:8px;
margin-left:auto;
line-height: 1px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<h3 class="title">
				<font color="Red">�������!</font>
			</h3>
		</div>
		
		<div class="Huge_Menu">
			<ul class="Huge_Menu_List">
				<li>�޴�1</li>
				<li>�޴�2</li>
				<li>�޴�3</li>
			</ul>
		</div>
		<div class="small_Menu">
			<ul class="small_Menu_list">
				<c:choose>
					<c:when test="${not empty User }">
						<li><a href="�缭��">�缭��</a></li>
						<li><a href="�α׾ƿ�">�α׾ƿ�</a></li>
						<li><a href="����Ʈ��">����Ʈ��</a></li>
					</c:when>
					<c:when test="${empty User}">
						<li><a href="�α���">�α���</a></li>
						<li><a href="����Ʈ��">����Ʈ��</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>



</body>
</html>