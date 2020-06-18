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
function findAccount(){
		window.opener.document.location.href="../index/findAccount.html";
		window.close();
	}
function unsigned(){
	
	opener.location.href="../ItemCart/unsigned.html";
	self.close();
}
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
<div align="center" id="wrapper">
<h3>로그인</h3>
<a href="javascript:unsigned()">비회원으로 주문하기</a>
<form action="../index/logincheck.html" name="frm" method="POST">
아이디 <input type="text" name="id"/> <br/>
패스워드 <input type="text" name="pwd"/><br/>
<input type="button" value="로그인" onclick="return validate()"/><br/>
</form>
<a href="javascript:entry()">회원가입</a> <a href="javascript:findAccount()">아이디/PWD 찾기</a>

</div>
</body>
</html>