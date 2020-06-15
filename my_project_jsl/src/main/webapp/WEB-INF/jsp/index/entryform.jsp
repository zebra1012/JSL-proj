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
function formal_idcheck(){ //�Ϲ����� ���� ���̵� �ߺ�üũ
	if(document.userform.user_id.value=="") {
		alert("ID�� �Է��ϼ���.");
		document.userform.user_id.focus();
		return;
	}
	var url="../index/idcheck.html?ID="+document.userform.user_id.value;
	window.open(url,"_blank","width=450,height=200");
}
function formal_validation(){
	if(document.userform.user_id.value=="") {
		alert("ID�� �Է��ϼ���.");
		document.userform.user_id.focus();
		return false;
	}
	if(document.userform.user_pwd.value==""){
		alert("��ȣ�� �Է��ϼ���.");
		document.userform.user_pwd.focus();
		return false;
	}
	if(document.userform.user_pwd.value!=document.userform.checkpwd.value){
		alert("��ȣ�� �������� �ʽ��ϴ�.");
		document.userform.user_pwd.focus();
		return false;
	}
	if(document.userform.user_email.value==""){
		alert("�̸��� �Է��ϼ���.");
		document.userform.user_email.focus();
		return false;
	}
	if(document.userform.user_name.value==""){
		alert("�̸��� �Է��ϼ���.");
		document.userform.user_name.focus();
		return false;
	}
	if(document.userform.user_addr.value==""){
		alert("�ּҸ� �Է��ϼ���.");
		document.userform.user_addr.focus();
		return false;
	}
	if(document.userform.user_phone.value==""){
		alert("����ó�� �Է��ϼ���.");
		document.userform.user_phone.focus();
		return false;
	}
	if(document.userform.idchecked.value=='no'){
		alert("���̵� �ߺ��˻縦 ���ּ���.");
		return false;
	}
	if (confirm("�� ������ �����Ͻðڽ��ϱ�?")) {
	}
	else return false;	
}
function com_idcheck(){
	if(document.companyform.company_id.value=="") {
		alert("ID�� �Է��ϼ���.");
		document.companyform.company_id.focus();
		return;
	}
	var url="../index/idcheck_company.html?ID="+document.companyform.company_id.value;
	window.open(url,"_blank","width=450,height=200");
}
function com_validation(){
	if(document.companyform.company_reg.value==""){
		alert("����ڹ�ȣ�� �Է��ϼ���.");
		document.companyform.company_reg.focus();
		return false;
	}
	if(document.companyform.company_name.value==""){
		alert("��ȣ���� �Է��ϼ���.");
		document.companyform.company_name.focus();
		return false;
	}
	if(document.companyform.company_id.value=="") {
		alert("ID�� �Է��ϼ���.");
		document.companyform.company_id.focus();
		return false;
	}
	if(document.companyform.company_pwd.value==""){
		alert("��ȣ�� �Է��ϼ���.");
		document.companyform.company_pwd.focus();
		return false;
	}
	if(document.companyform.company_pwd.value!=document.companyform.checkpwd.value){
		alert("��ȣ�� �������� �ʽ��ϴ�.");
		document.companyform.company_pwd.focus();
		return false;
	}
	if(document.companyform.company_email.value==""){
		alert("�̸����� �Է��ϼ���.");
		document.companyform.company_email.focus();
		return false;
	}
	if(document.companyform.company_phone.value==""){
		alert("����ó�� �Է��ϼ���.");
		document.companyform.company_phone.focus();
		return false;
	}
	if(document.companyform.company_addr.value==""){
		alert("�ּҸ� �Է��ϼ���.");
		document.companyform.company_addr.focus();
		return false;
	}
	if(document.companyform.company_manager.value==""){
		alert("������̸��� �Է��ϼ���.");
		document.companyform.company_manager.focus();
		return false;
	}
	if(document.companyform.idchecked.value=='no'){
		alert("���̵� �ߺ��˻縦 ���ּ���.");
		return false;
	}
	if (confirm("�� ������ �����Ͻðڽ��ϱ�?")) {
	}
	else return false;	
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="wrapper">
<c:choose>
<c:when test="${!empty formal  }"> <!-- �Ϲ�ȸ�� -->
<h4 align="center">ȸ������(�Ϲ�)</h4>
<form:form name="userform" modelAttribute="formal" action="../index/EntryDo.html" method="POST">
<table align="center">
<tr><td>���̵�</td><td><form:input path="user_id" cssClass="user_id"/></td><td><input type="button" name="idcheck" value="�ߺ��˻�" onclick="formal_idcheck()"></tr>
<tr><td>��ȣ</td><td><form:password path="user_pwd"/></td></tr>
<tr><td>��ȣȮ��</td><td><input type="password" name="checkpwd"/></td></tr>
<tr><td>�̸���</td><td><form:input path="user_email"/></td></tr>
<tr><td>�̸�</td><td><form:input path="user_name"/></td></tr>
<tr><td>�ּ�</td><td><form:input path="user_addr"/></td></tr>
<tr><td>����ó</td><td><form:input path="user_phone"/></td></tr>
</table>
<input type="hidden" name="idchecked" value="no"/>
<br/>
<div align="center">
<input type="submit" value="ȸ������" onclick="return formal_validation()"/>
</div>
</form:form>
</c:when>


<c:when test="${!empty company  }">  <!-- ��üȸ��-->
<h4 align="center">ȸ������(��ü)</h4>
 <form:form name="companyform" modelAttribute="company" action="../index/EntryDo_Company.html" method="POST">
<table align="center">
<tr><td>����ڵ�Ϲ�ȣ</td	><td><form:input path="company_reg"/></td></tr>
<tr><td>��ȣ</td><td><form:input path="company_name"/></td></tr>
<tr><td>ID</td><td><form:input path="company_id"/></td><td><input type="button" name="idcheck" onclick="com_idcheck()" value="�ߺ��˻�"></tr>
<tr><td>��ȣ</td><td><form:password path="company_pwd"/></td></tr>
<tr><td>��ȣȮ��</td><td><input type="password" name="checkpwd"/></td></tr>
<tr><td>�̸���</td><td><form:input path="company_email"/></td></tr>
<tr><td>����ó</td><td><form:input path="company_phone"/></td></tr>
<tr><td>�ּ�</td><td><form:input path="company_addr"/></td></tr>
<tr><td>������̸�</td><td><form:input path="company_manager"/></td></tr>
</table>
<br/>
<input type="hidden" name="idchecked" value="no"/>
<div align="center">
<input type="submit" value="ȸ������" onclick="return com_validation()"/>
</div>
</form:form>
</c:when>
</c:choose>
</div>
</body>
</html>