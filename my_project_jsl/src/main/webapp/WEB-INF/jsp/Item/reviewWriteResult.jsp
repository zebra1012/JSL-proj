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
<c:if test="${empty result || result ne 'Success' }">
<script type="text/javascript">
alert("등록에 실패했습니다.")
</script>
</c:if>
<script type="text/javascript">
window.location.href="../item/itemDetail.html?seqno=${seqno}"
</script>
</body>
</html>