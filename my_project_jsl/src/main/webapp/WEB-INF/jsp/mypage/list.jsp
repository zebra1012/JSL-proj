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
	<h3 align="center">마이페이지</h3>
	<c:choose>
		<c:when test="${sessionScope.Type=='Formal' }">
			<div id="content" align="center">
				<div style="float: left; margin-left: 300px; margin-top: 70px;"
					id="menu_list">
					<ul>
						<li id="menu"><a href="../mypage/FormalInfo.html">내 정보</a></li>
						<li id="menu"><a href="../mypage/pwdCheck.html">개인정보수정</a></li>
						<li id="menu"><a href="../mypage/FormalWrited.html">작성한 게시글</a></li>
						<li id="menu"><a href="../mypage/FormalCart.html">장바구니</a></li>
						<li id="menu"><a href="../mypage/FormalShopping.html">구매 내역</a></li>
					</ul>
				</div>
			</div>
		</c:when>
		<c:when test="${sessionScope.Type=='Company' }">
			<div id="content" align="center">
				<div style="float: left; margin-left: 300px; margin-top: 70px;"
					id="menu_list">
					<ul>
						<li id="menu"><a href="../mypage/CompanyInfo.html">업체정보</a></li>
						<li id="menu"><a href="../mypage/pwdCheck.html">정보수정</a></li>
						<li id="menu"><a href="../mypage/CustomerManage.html">고객관리</a></li>
						<li id="menu"><a href="../mypage/ItemManage.html">상품관리</a></li>
					</ul>
				</div>
			</div>
		</c:when>
		<c:when test="${sessionScope.Type=='Admin' }">
			<div id="content" align="center">
				<div style="float: left; margin-left: 300px; margin-top: 70px;"
					id="menu_list">
					<ul>
						<li id="menu"><a href="../mypage/AdminStatics.html">접속통계</a></li>
						<li id="menu"><a href="../mypage/UserManage.html">유저관리</a></li>
							<ul>
								<li id="submenu"><a href="../mypage/UserManage.html?Types=Formal">일반회원관리</a></li>
								<li id="submenu"><a href="../mypage/UserManage.html?Types=Company">업체회원관리</a></li>
								<li id="submenu"><a href="../mypage/UserManage.html?Types=Admin">관리자 계정 관리</a></li>			
							</ul>
						<li id="menu"><a href="../mypage/AdminChange.html">관리자 암호변경</a></li>
					</ul>
				</div>
			</div>
		</c:when>
	</c:choose>
</body>
</html>