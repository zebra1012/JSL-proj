<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
td{
text-align: center;
border-style:solid 1;}
li{float:right;
list-style: none;
}
div#detail_buttons{
margin-right:22%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../index/header.jsp"></jsp:include>
<div id="wrapper" align="center">
<h3 align="center">중고 거래 게시판</h3>
<div id="detail">
<table border="1">
<tr><td>${secondhand.secondhand_seqno}</td><td colspan="2">${secondhand.secondhand_title }</td><td>${secondhand.secondhand_writer }</td>
<td>${secondhand.secondhand_price }</td><td>${secondhand.secondhand_date }</td></tr>
<tr height="200px"><td colspan="2"><img alt="" width="300px" src="${pageContext.request.contextPath }/Secondhand_Image/${secondhand.secondhand_image }"/></td>
<td colspan="4">${secondhand.secondhand_content }</td></tr>
</table>
</div>
<div id="detail_buttons">
<ul>
<li><input type="button" value="목록으로" onclick="history.back()"></li>
<li><input type="button" value="삭제" onclick="location.href='../secondhand/delete.html?seqno='+${secondhand.secondhand_seqno}"></li>
<li><input type="button" value="수정" onclick="location.href='../secondhand/modify.html?seqno='+${secondhand.secondhand_seqno}"></li>
</ul>
</div>
<br/>
<hr/>
<jsp:include page="../secondhand/comment.jsp"></jsp:include>
</div>
</body>
</html>