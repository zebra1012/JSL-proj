<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
div#left {
	float:left;
	margin-left: 230px;
}
div#right { 
	float:right;
	margin-right:230px;}

</style>
<script type="text/javascript">
function IDvalidate(){
	var radio_cnt=0;
	for( var i = 0 ;i<document.IDfrm.userType.length;i++) {
		if(document.IDfrm.userType[i].checked) {
			radio_cnt++;
		} 
	}
	if (radio_cnt < 1) {
		alert("���� ������ �������ּ���.")
		return false;
	}
	if(document.IDfrm.email.value=='') {
		alert("�̸����� �Է����ּ���.");
		document.IDfrm.email.focus();
		return false;
	}
	document.IDfrm.submit();
}
function PWDvalidate(){
	var radio_cnt=0;
	for( var i = 0 ;i<document.PWDfrm.userType.length;i++) {
		if(document.PWDfrm.userType[i].checked) {
			radio_cnt++;
		} 
	}
	if (radio_cnt < 1) {
		alert("���� ������ �������ּ���.")
		return false;
	}
	if(document.PWDfrm.ID.value=='') {
		alert("���̵� �Է����ּ���.");
		document.PWDfrm.ID.focus();
		return false;
	}
	if(document.PWDfrm.email.value=='') {
		alert("�̸����� �Է����ּ���.");
		document.PWDfrm.email.focus();
		return false;
	}
	document.PWDfrm.submit();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="wrapper" align="center">
<div id="left" align="center">
<h3>���̵�ã��</h3>
<form action="../index/findID.html" name="IDfrm" method="POST">
<input type="radio" name="userType" value="formal"/>�Ϲ�ȸ��<input type="radio" name="userType" value="company"/>��üȸ��<br/>
�̸��� <input type="text" name="email"/> <br/>
<input type="button" value="ID��ȸ" onclick="return IDvalidate()"/><br/>
</form>
</div>
<div id="right" align="center">
<h3>��й�ȣã��</h3>
<form action="../index/findPWD.html" name="PWDfrm" method="POST">
<input type="radio" name="userType" value="formal"/>�Ϲ�ȸ��<input type="radio" name="userType" value="company"/>��üȸ��<br/>
���̵� <input type="text" name="ID"/> <br/>
�̸��� <input type="text" name="email"/> <br/>
<input type="button" value="��й�ȣ����" onclick="return PWDvalidate()"/><br/>
</form>
</div>
</div>
</body>
</html>