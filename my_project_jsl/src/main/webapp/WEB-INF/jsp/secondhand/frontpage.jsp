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
<h3> �߰� �ŷ� �Խ��� </h3>
<input type="button" value="�� �ۼ�" name="write" onclick="location.href='../secondhand/writeform.html'" style="float:right;">
<div id="table">
<table>
<tr><td>�۹�ȣ</td><td colspan="2">������</td><td>�ۼ���</td><td>����</td><td>�ۼ���</td></tr>
</table>
</div>
<div>
����������<br/>
<select name="searchType">
<option value="writer">�ۼ���</option>
<option value="title">����</option>
<option value="content">����</option>
</select>
<input type="text" name="searchFrom"/>
<input type="button" value="�˻�" name="search"/>
</div>
</div>
</body>
</html>