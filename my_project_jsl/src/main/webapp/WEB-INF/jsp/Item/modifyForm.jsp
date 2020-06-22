<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../index/header.jsp"></jsp:include>
<c:choose>
<c:when test="${result=='Fail' }">
<script type="text/javascript">
alert("������ �����ϴ�.");
window.location.href='../item/frontpage.html';
</script>
</c:when>

<c:when test="${result=='Success' }">

<h3 align="center">���¸��� ��ǰ ����</h3>
<form:form name="writeform" modelAttribute="item" 
action="../item/modify.html" method="POST" enctype="multipart/form-data">
<table border="1" align="center">
<tr><td>��ǰ��</td><td><form:input path="item_name"/></td></tr>
<tr><td>����</td><td><form:input path="item_price"/></td></tr>
<tr><td>�з��ڵ�</td><td><form:input path="item_code"/></td></tr>
<tr><td>�̹���</td><td><input type="File" name="item_image"/></td></tr>
<tr><td>����</td><td><form:textarea style="width:100%; height:20%;"  path="item_content"/></td></tr>
</table>
<form:hidden path="item_writer" value="${sessionScope.User.company_id }"/>
<form:hidden path="item_seqno" value="${seqno }"/>
<br/>
<div align="center">
<input type="submit" value="���"/>
</div>
</form:form>
</c:when>
</c:choose>
</body>
</html>