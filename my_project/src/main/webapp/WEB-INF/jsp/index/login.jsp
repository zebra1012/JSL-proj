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
		alert("유저 유형을 선택해주세요.")
		return false;
	}
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
<form action="../index/logincheck.html" name="frm" method="POST">
<input type="radio" name="userType" value="formal"/>일반회원<input type="radio" name="userType" value="company"/>업체회원<br/>
아이디 <input type="text" name="id"/> <br/>
패스워드 <input type="text" name="pwd"/><br/>
<input type="button" value="로그인" onclick="return validate()"/><br/>
</form>
<a href="javascript:entry()">회원가입</a> <a href=""/>아이디/PWD 찾기</a>
</div>
</body>
</html>