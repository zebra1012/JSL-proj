<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../index/header.jsp"></jsp:include>
<div id="wrapper" align="center">
<h3>��ǰ �ı� �ۼ�</h3>


<form:form modelAttribute="review" action="../Item/writeReview.html" method="POST" name="form" enctype="multipart/form-data">
<form:hidden path="review_writer" value="${sessionScope.User.user_id }"/>
<form:hidden path="parent_seqno" value="${parent }"/>
<table>
<tr><td>����</td><td><form:radiobutton path="review_star" value="1" label="�ſ� �Ҹ�"/>
<form:radiobutton path="review_star" value="2" label="�Ҹ�"/>
<form:radiobutton path="review_star" value="3" label="����"/>
<form:radiobutton path="review_star" value="4" label="��õ"/>
<form:radiobutton path="review_star" value="5" label="�ſ� ��õ"/></td></tr>
<tr><td>�̹���</td><td><input type="File" name="review_image"/></td></tr>
<tr><td>�ı�</td><td><form:textarea path="review_content"/></td></tr>
</table>
<input type="submit" value="���"/> <input type="button" value="���ư���"/>
</form:form>
</div>
</body>
</html>