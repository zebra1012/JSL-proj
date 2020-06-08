<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
<c:when test="${result == 'YES' }">
<script type="text/javascript">
	self.close();
	opener.window.location.reload();
</script>
</c:when>
<c:when test="${result=='NO' }">
<script type="text/javascript">
	alert("해당하는 계정 정보가 존재하지 않습니다.");
	history.back();
</script>
</c:when>
</c:choose>

</body>
</html>