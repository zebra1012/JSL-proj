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
alert("������ �����ϴ�. �Խñ��� �ۼ��� ȸ���� ������ �� �ֽ��ϴ�.");
history.back();
</script>
</c:when>
<c:when test="${result == 'Success' }">
<script type="text/javascript">
alert("�����Ǿ����ϴ�.");
window.location.href="../bbs/toBBS.html?state=${Type}"
</script>
</c:when>
<c:when test="${result == 'bbsSuccess' }">
<script type="text/javascript">
alert("�����Ǿ����ϴ�.");
self.close();
opener.location.href="../bbs/toBBS.html?state=${Type}"
</script>
</c:when>
<c:when test="${result == 'bbsFail' }">
<script type="text/javascript">
alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
self.close();
opener.reload();
</script>
</c:when>
</c:choose>
</body>
</html>