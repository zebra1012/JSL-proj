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
<div id="wrapper" align="center">
<c:choose>
<c:when test="${not empty ID }">
�ش� �̸��Ϸ� ������ ID�� ������ �����ϴ�.<br/>
<br/>
<c:forEach var="ids" items="${ID }">
<font color="#333399">${ids }</font> <br/>
</c:forEach>
<br/>
<a href="../index/findAccount.html">���ư���</a>
</c:when>
<c:otherwise>
<script type="text/javascript">
alert("���� �� ID�� �����ϴ�.");
history.back();
</script>
</c:otherwise>
</c:choose>
</div>

</body>
</html>