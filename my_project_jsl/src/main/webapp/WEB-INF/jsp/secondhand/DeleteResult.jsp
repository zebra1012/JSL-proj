<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
<c:when test="${result == 'Fail' }">
<script type="text/javascript">
alert("권한이 없습니다. 게시글을 작성한 회원만 삭제할 수 있습니다.");
window.location.href='../secondhand/frontpage.html';
</script>
</c:when>
<c:when test="${result == 'Success' }">
<script type="text/javascript">
alert("삭제되었습니다.");
window.location.href="../secondhand/frontpage.html"
</script>
</c:when>
</c:choose>
</body>
</html>