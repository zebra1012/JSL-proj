<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function idOK(){
	opener.document.companyform.company_id.value="${ID}"; //input�� �ִ� �� �״�� ��������� opener.document.frm.Id.value=document.frm.ID.value
	opener.document.companyform.idchecked.value="yes";
	self.close();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>���̵� �ߺ��˻� ���</h3>
<form action="../index/idcheck_company.html" method="get">
<input type="text" name="ID" value="${ID }"/> <input type="submit" value="�ߺ��˻�">
</form>
<c:choose>
<c:when test="${result=='OK' }">
${ID }�� ��� �����մϴ�.
<input type="button" value="����ϱ�" onclick="javascript:idOK()"/>
</c:when>
<c:otherwise>
${ID }�� �̹� ����ϰ� �ֽ��ϴ�.

</c:otherwise>
</c:choose>

</body>
</html>