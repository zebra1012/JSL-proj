<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../index/header.jsp"></jsp:include>
<div id="wrapper">
<h3> 중고 거래 게시판 </h3>
<input type="button" value="글 작성" name="write" onclick="location.href='../secondhand/writeform.html'" style="float:right;">
<div id="table">
<table>
<tr><td>글번호</td><td colspan="2">글제목</td><td>작성자</td><td>가격</td><td>작성일</td></tr>
</table>
</div>
<div>
페이지구간<br/>
<select name="searchType">
<option value="writer">작성자</option>
<option value="title">제목</option>
<option value="content">내용</option>
</select>
<input type="text" name="searchFrom"/>
<input type="button" value="검색" name="search"/>
</div>
</div>
</body>
</html>