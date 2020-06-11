<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function write_validation(){
	if(document.writeform.secondhand_title.value=="") {
		alert("������ �Է��ϼ���.");
		document.writeform.secondhand_title.focus();
		return false;
	}
	if(document.writeform.secondhand_price.value==""){
		alert("������ �Է��ϼ���.");
		document.writeform.secondhand_price.focus();
		return false;
	}
	if(isNaN(document.writeform.secondhand_price.value)==true){
		alert("������ ���ڿ��� �մϴ�.");
		document.writeform.secondhand_price.focus();
		return false;
	}
	if(document.writeform.secondhand_local.value==""){
		alert("�ŷ������� �Է��ϼ���.");
		document.writeform.secondhand_local.focus();
		return false;
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../index/header.jsp"></jsp:include>
<c:choose>
<c:when test="${result=='Fail' }">
<script type="text/javascript">
alert("������ �����ϴ�. �Խñ��� �ۼ��� ȸ���� ������ �� �ֽ��ϴ�.");
window.location.href='../secondhand/frontpage.html';
</script>
</c:when>
<c:when test="${result=='Success' }">
<h3>�߰�ŷ� �Խñ� ����</h3>
<form:form name="writeform" modelAttribute="secondhand" 
action="../secondhand/modify.html" method="POST" enctype="multipart/form-data">
<table border="1" align="center">
<tr><td>������</td><td><form:input path="secondhand_title" cssClass="secondhand_title"/></td></tr>
<tr><td>����</td><td><form:input path="secondhand_price"/></td></tr>
<tr><td>�̹���</td><td><input type="File" name="secondhand_image"/></td></tr>
<tr><td>�ŷ�����</td><td><form:select path="secondhand_local">
<form:option value="����">����</form:option>
<form:option value="���">���</form:option>
<form:option value="����">����</form:option>
<form:option value="���">���</form:option>
<form:option value="�泲">�泲</form:option>
<form:option value="���">���</form:option>
<form:option value="�泲">�泲</form:option>
<form:option value="����">����</form:option>
<form:option value="����">����</form:option>
<form:option value="����">����</form:option>
</form:select></td></tr>
<tr><td>����</td><td><form:textarea style="width:100%; height:20%;"  path="secondhand_content"/></td></tr>
</table>
<form:hidden path="secondhand_writer" value="${sessionScope.User.user_id }"/>
<form:hidden path="secondhand_seqno" value="${seqno }"/>
<br/>
<div align="center">
<input type="submit" value="���" onclick="return write_validation()"/>
</div>
</form:form>
</c:when>
</c:choose>
</body>
</html>