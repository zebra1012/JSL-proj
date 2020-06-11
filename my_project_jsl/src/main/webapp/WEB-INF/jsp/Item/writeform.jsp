<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
td {
 text-align : center;
}
tr{
 height: 30px;
}
</style>
<script type="text/javascript">
function write_validation(){
	if(document.writeform.item_name.value=="") {
		alert("��ǰ���� �Է��ϼ���.");
		document.writeform.item_name.focus();
		return false;
	}
	if(document.writeform.item_price.value==""){
		alert("������ �Է��ϼ���.");
		document.writeform.item_price.focus();
		return false;
	}
	if(isNaN(document.writeform.item_price.value)){
		alert("������ ���ڿ��� �մϴ�.");
		document.writeform.item_price.focus();
		return false;
	}
	
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../index/header.jsp"></jsp:include>
<div id="wrapper" align="center">
<c:choose>
<c:when test="${Company == 'YES' }">
<h3>��ǰ ���</h3>
<form:form name="writeform" modelAttribute="Item" 
action="../item/write.html" method="POST" enctype="multipart/form-data">
<table align="center">
<tr><td>��ǰ��</td><td><form:input path="item_name"/></td></tr>
<tr><td>��ǰ�з�</td><td><form:input path="item_code"/></td></tr>
<tr><td>��ǰ�̹���</td><td><input type="File" name="item_image"/></td></tr>
<tr><td>��ǰ����</td><td><form:input path="item_price"/></td></tr>
<tr><td>��ǰ ����</td><td><form:textarea path="item_content"/></td></tr>
</table>
<form:hidden path="item_writer" value="${sessionScope.User.company_id }"/>
<br/>
<div align="center">
<input type="submit" value="���" onclick="return write_validation()"/>
</div>
</form:form>
</c:when>
<c:otherwise>
<script>
alert("������ �����ϴ�. ��üȸ���� �ۼ��� �� �ֽ��ϴ�.");
history.back();
</script>
</c:otherwise>
</c:choose>
</div>

</body>
</html>