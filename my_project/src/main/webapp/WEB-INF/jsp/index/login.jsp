<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center" id="wrapper">
<h3>로그인</h3>
<form action="index/logincheck.html" method="POST">
<input type="radio" name="userType" value="formal"/>일반회원<input type="radio" name="userType" value="comapny"/>기업회원<br/>
아이디 <input type="text" id="id"/> <br/>
패스워드 <input type="text" id="pwd"/><br/>
<input type="submit" value="로그인"/><br/>
</form>
<a href="entry.html">회원가입</a> <a href=""/>아이디/PWD 찾기</a>
</div>
</body>
</html>