<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
li#menu {
	font-size: x-large;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3 align="center">����������</h3>
	<c:choose>
		<c:when test="${sessionScope.Type=='Formal' }">
			<div id="content" align="center">
				<div style="float: left; margin-left: 300px; margin-top: 70px;"
					id="menu_list">
					<ul>
						<li id="menu"><a href="../mypage/FormalInfo.html">�� ����</a></li>
						<li id="menu"><a href="../mypage/pwdCheck.html">������������</a></li>
						<li id="menu"><a href="../mypage/FormalWrited.html">�ۼ��� �Խñ�</a></li>
						<li id="menu"><a href="../mypage/FormalCart.html">��ٱ���</a></li>
						<li id="menu"><a href="../mypage/FormalShopping.html">���� ����</a></li>
					</ul>
				</div>
			</div>
		</c:when>
		<c:when test="${sessionScope.Type=='Company' }">
			<div id="content" align="center">
				<div style="float: left; margin-left: 300px; margin-top: 70px;"
					id="menu_list">
					<ul>
						<li id="menu"><a href="../mypage/CompanyInfo.html">��ü����</a></li>
						<li id="menu"><a href="../mypage/pwdCheck.html">��������</a></li>
						<li id="menu"><a href="../mypage/CustomerManage.html">������</a></li>
						<li id="menu"><a href="../mypage/ItemManage.html">��ǰ����</a></li>
					</ul>
				</div>
			</div>
		</c:when>
		<c:when test="${sessionScope.Type=='Admin' }">
			<div id="content" align="center">
				<div style="float: left; margin-left: 300px; margin-top: 70px;"
					id="menu_list">
					<ul>
						<li id="menu"><a href="../mypage/AdminStatics.html">�������</a></li>
						<li id="menu"><a href="../mypage/UserManage.html">��������</a></li>
							<ul>
								<li id="submenu"><a href="../mypage/UserManage.html?Types=Formal">�Ϲ�ȸ������</a></li>
								<li id="submenu"><a href="../mypage/UserManage.html?Types=Company">��üȸ������</a></li>
								<li id="submenu"><a href="../mypage/UserManage.html?Types=Admin">������ ���� ����</a></li>			
							</ul>
						<li id="menu"><a href="../mypage/AdminChange.html">������ ��ȣ����</a></li>
					</ul>
				</div>
			</div>
		</c:when>
	</c:choose>
</body>
</html>