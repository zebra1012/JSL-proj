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
<c:when test="${result=='Success' }">
<script type="text/javascript">
alert("수정되었습니다.");
location.href="../item/itemDetail.html?seqno=${item.item_seqno }"
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
alert("수정에 실패했습니다.");
location.href="../item/frontpage.html"
</script>
</c:otherwise>
</c:choose>
</body>
</html>