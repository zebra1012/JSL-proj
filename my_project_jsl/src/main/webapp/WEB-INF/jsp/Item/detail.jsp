<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
td {
	text-align: center;
	border-style: solid 1;
}

li {
	float: right;
	list-style: none;
}

div#detail_buttons {
	margin-right: 22%;
}
</style>
<script type="text/javascript">
function changeQuantity(){
	var select=document.getElementById("quantity");
	var selected= select.options[select.selectedIndex].value;
	document.getElementById("totalPrice").innerText=${item.item_price} * selected;
	
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../index/header.jsp"></jsp:include>
	<div id="wrapper" align="center">
		<h3 align="center">���¸���</h3>
		<div id="detail">
			<table border="1">
				<tr>
					<td rowspan="5"><img alt="" width="300px"
						src="${pageContext.request.contextPath }/Item_Image/${item.item_image }" /></td>
					<td colspan="4" width="300px">${item.item_writer }</td>
				</tr>
				<tr>
					<td width="50px">��ǰ��</td>
					<td colspan="3">${item.item_name}</td>
				</tr>
				<tr>
					<td width="50px">����</td>
					<td colspan="3">${item.item_price }</td>
				</tr>
				<tr>
					<td colspan="4" height="200px">${item.item_content }</td>
				</tr>
				<tr>
					<td width="50px">����</td>
					<td><select id="quantity" name="quantity" onchange="changeQuantity()">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					</select></td>
					<td width="50px">�ѱݾ�</td>
					<td id="totalPrice"></td>
				</tr>
			</table>
		</div>
		<div id="detail_buttons">
			<ul>
				<li><input type="button" value="�������" onclick="history.back()"></li>
				<li><input type="button" value="����"
					onclick="location.href='../item/delete.html?seqno='+${item.item_seqno}"></li>
				<li><input type="button" value="����"
					onclick="location.href='../item/modify.html?seqno='+${item.item_seqno}"></li>
			</ul>
		</div>
		<br />
		<hr />
		<jsp:include page="../Item/review.jsp"></jsp:include>
	</div>
</body>
</html>