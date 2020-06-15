<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function idOK(){
	opener.document.companyform.company_id.value="${ID}"; //input에 있는 거 그대로 가고싶으면 opener.document.frm.Id.value=document.frm.ID.value
	opener.document.companyform.idchecked.value="yes";
	self.close();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>아이디 중복검사 결과</h3>
<form action="../index/idcheck_company.html" method="get">
<input type="text" name="ID" value="${ID }"/> <input type="submit" value="중복검사">
</form>
<c:choose>
<c:when test="${result=='OK' }">
${ID }는 사용 가능합니다.
<input type="button" value="사용하기" onclick="javascript:idOK()"/>
</c:when>
<c:otherwise>
${ID }는 이미 사용하고 있습니다.

</c:otherwise>
</c:choose>

</body>
</html>