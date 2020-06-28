<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result =='Success' }">
<script type="text/javascript">
alert("변경되었습니다.");
location.href="../index/showMessage.html";
</script>
</c:if>
<c:if test="${result =='DeleteSuccess' }">
<script type="text/javascript">
alert("탈퇴되었습니다..");
location.href="../index/showMessage.html";
</script>
</c:if>
</body>
</html>