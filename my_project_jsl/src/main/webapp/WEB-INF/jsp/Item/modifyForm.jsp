<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function validation(){
	if(document.writeform.item_name.value=='') {
		alert("상품명을 입력해주세요.");
		document.writeform.item_name.focus();
		return false;
	}
	if(document.writeform.item_price.value=='') {
		alert("상품가격을 입력해주세요.");
		document.writeform.item_price.focus();
		return false;
	}
	if (isNaN(document.writeform.item_price.value)) {
		alert("가격은 숫자여야 합니다.");
		document.writeform.item_price.focus();
		return false;
	}
	if (document.writeform.item_content.value=='') {
		alert("상품설명은 입력해야 합니다.");
		document.writeform.item_content.focus();
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
alert("권한이 없습니다.");
window.location.href='../item/frontpage.html';
</script>
</c:when>

<c:when test="${result=='Success' }">

<h3 align="center">오픈마켓 상품 수정</h3>
<form:form name="writeform" modelAttribute="item" 
action="../item/modify.html" method="POST" enctype="multipart/form-data">
<table border="1" align="center">
<tr><td>상품명</td><td><form:input path="item_name"/></td></tr>
<tr><td>가격</td><td><form:input path="item_price"/></td></tr>
<tr><td>이미지</td><td><input type="File" name="item_image"/></td></tr>
<tr><td>내용</td><td><form:textarea style="width:100%; height:20%;"  path="item_content"/></td></tr>
</table>
<form:hidden path="item_writer" value="${sessionScope.User.company_id }"/>
<form:hidden path="item_seqno" value="${seqno }"/>
<br/>
<div align="center">
<input type="submit" onclick="return validation()" value="등록"/>
</div>
</form:form>
</c:when>
</c:choose>
</body>
</html>