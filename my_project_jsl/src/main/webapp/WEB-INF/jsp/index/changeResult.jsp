<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="wrapper">
<c:choose>
<c:when test="${not empty result }">
<script type="text/javascript">
alert("����Ǿ����ϴ�.")
window.location.href = '../index/showMessage.html';
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
alert("��й�ȣ ���濡 �����߽��ϴ�. �����ڿ��� �����ϼ���.")
window.location.href="../index/findAccount.html";
</script>
</c:otherwise>
</c:choose>

</div>

</body>
</html>