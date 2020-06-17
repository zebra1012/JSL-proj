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
<h3>상품 후기 작성</h3>


<form:form modelAttribute="review" action="../Item/writeReview.html" method="POST" name="form" enctype="multipart/form-data">
<form:hidden path="review_writer" value="${sessionScope.User.user_id }"/>
<form:hidden path="parent_seqno" value="${parent }"/>
<table>
<tr><td>평점</td><td><form:radiobutton path="review_star" value="1" label="매우 불만"/>
<form:radiobutton path="review_star" value="2" label="불만"/>
<form:radiobutton path="review_star" value="3" label="보통"/>
<form:radiobutton path="review_star" value="4" label="추천"/>
<form:radiobutton path="review_star" value="5" label="매우 추천"/></td></tr>
<tr><td>이미지</td><td><input type="File" name="review_image"/></td></tr>
<tr><td>후기</td><td><form:textarea path="review_content"/></td></tr>
</table>
<input type="submit" value="등록"/> <input type="button" value="돌아가기"/>
</form:form>
</div>
</body>
</html>