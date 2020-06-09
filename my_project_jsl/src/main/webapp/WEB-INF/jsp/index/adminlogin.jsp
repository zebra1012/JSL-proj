<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function validate(){
	if(document.frm.id.value=='') {
		alert("ID를 입력해주세요.");
		document.frm.id.focus();
		return false;
	}
	if(document.frm.pwd.value=="") {
		alert("암호를 입력해주세요.");
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
<jsp:include page="header.jsp"></jsp:include>
<div align="center" id="wrapper">
<h3>로그인</h3>
<form action="../index/logincheck.html" name="frm" method="POST">
<input type="hidden" name="userType" value="admin"/>
아이디 <input type="text" name="id"/> <br/>
패스워드 <input type="text" name="pwd"/><br/>
<input type="button" value="로그인" onclick="return validate()"/><br/>
</form>
</div>
</body>
</html>