<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function entry(){
	window.opener.document.location.href="../index/entry.html";
	window.close();
}
function validate(){
	var radio_cnt=0;
	for( var i = 0 ;i<document.frm.userType.length;i++) {
		if(document.frm.userType[i].checked) {
			radio_cnt++;
		} 
	}
	if (radio_cnt < 1) {
		alert("���� ������ �������ּ���.")
		return false;
	}
	if(document.frm.id.value=='') {
		alert("ID�� �Է����ּ���.");
		document.frm.id.focus();
		return false;
	}
	if(document.frm.pwd.value=="") {
		alert("��ȣ�� �Է����ּ���.");
		document.frm.pwd.focus();
		return false;
	}
	document.frm.submit();
	
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center" id="wrapper">
<h3>�α���</h3>
<form action="../index/logincheck.html" name="frm" method="POST">
<input type="radio" name="userType" value="formal"/>�Ϲ�ȸ��<input type="radio" name="userType" value="company"/>��üȸ��<br/>
���̵� <input type="text" name="id"/> <br/>
�н����� <input type="text" name="pwd"/><br/>
<input type="button" value="�α���" onclick="return validate()"/><br/>
</form>
<a href="javascript:entry()">ȸ������</a> <a href=""/>���̵�/PWD ã��</a>
</div>
</body>
</html>