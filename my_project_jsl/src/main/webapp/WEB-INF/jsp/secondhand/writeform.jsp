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
	if(document.writeform.secondhand_title.value=="") {
		alert("제목을 입력하세요.");
		document.writeform.secondhand_title.focus();
		return false;
	}
	if(document.writeform.secondhand_price.value==""){
		alert("가격을 입력하세요.");
		document.writeform.secondhand_price.focus();
		return false;
	}
	if(isNaN(document.writeform.secondhand_price.value)==true){
		alert("가격은 숫자여야 합니다.");
		document.writeform.secondhand_price.focus();
		return false;
	}
	if(document.writeform.secondhand_local.value==""){
		alert("거래지역을 입력하세요.");
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
<div id="wrapper">
<c:choose>
<c:when test="${Formal == 'YES' }">
<h3>중고거래 게시글 작성</h3>
<form:form name="writeform" modelAttribute="secondhand" 
action="../secondhand/write.html" method="POST" enctype="multipart/form-data">
<table border="1" align="center">
<tr><td>글제목</td><td><form:input path="secondhand_title" cssClass="secondhand_title"/></td></tr>
<tr><td>가격</td><td><form:input path="secondhand_price"/></td></tr>
<tr><td>이미지</td><td><input type="File" name="secondhand_image"/></td></tr>
<tr><td>거래지역</td><td><form:select path="secondhand_local">
<form:option value="서울">서울</form:option>
<form:option value="경기">경기</form:option>
<form:option value="강원">강원</form:option>
<form:option value="충북">충북</form:option>
<form:option value="충남">충남</form:option>
<form:option value="경북">경북</form:option>
<form:option value="경남">경남</form:option>
<form:option value="전북">전북</form:option>
<form:option value="전남">전남</form:option>
<form:option value="제주">제주</form:option>
</form:select></td></tr>
<tr><td>내용</td><td><form:textarea style="width:100%; height:20%;"  path="secondhand_content"/></td></tr>
</table>
<form:hidden path="secondhand_writer" value="${sessionScope.User.user_id }"/>
<br/>
<div align="center">
<input type="submit" value="등록" onclick="return write_validation()"/>
</div>
</form:form>
</c:when>
<c:otherwise>
<script>
alert("권한이 없습니다. 일반회원만 작성할 수 있습니다.");
history.back();
</script>
</c:otherwise>
</c:choose>
</div>

</body>
</html>