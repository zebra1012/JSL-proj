<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
<c:when test="${result == 'Success' }">
<script type="text/javascript">
self.close();
opener.window.location.reload();
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
	alert("������ �����߽��ϴ�.");
	history.back();
</script>
</c:otherwise>

</c:choose>
</body>
</html>