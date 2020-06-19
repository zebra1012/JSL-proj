<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
li#top_list {
	list-style: none;
	float: left;
	margin-left: 20px;
}

ul#top_list {
	display: table;
	margin-left: auto;
	line-height: 1px;
}

input#btn {
	width: 150px;
	height: 100px;
	outline: 1;
	border: 3;
	background-color: #6699CC;
}

div#wrapper {
	width: 90%;
	margin-left: 5%;
}

.hidden {
	position: absolute;
	top: 145px;
	right: 455px; display : none;
	min-width: 140px;
	z-index: 1;
	box-shadow: 2px 8px 16px 2px rgba(0, 0, 0, 0.2);
	background-color: #f1f1f1;
	display: none;
}

.hidden a {
	display: inline;
}

.hidden a:hover {
	background-color: #ddd;
}

#dropbtn {
	display: inline;
}

#dropbtn:hover .hidden {
	display: inline;
}
</style>
<script type="text/javascript">
	function LoginPopup() {
		window
				.open("../index/login.html", "�α���",
						"status=no,location=no,toolbars=no,scrollbars=no,height=300,width=600")
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${cookie.visit.value ne 'OK' }">
			<script type="text/javascript">
				window.location.href = "../index/cookiesCheck.html";
			</script>
		</c:when>
		<c:otherwise>

			<div id="wrapper">
				<div id="top_list">
					<ul id="top_list">
						<c:choose>
							<c:when test="${not empty User  }">
								<li id="top_list"><c:if test="${Type == 'Formal' }">ȯ���մϴ�! ${User.user_id }��</c:if>
									<c:if test="${Type=='Company' }">ȯ���մϴ�! ${User.company_id }��</c:if>
									<c:if test="${Type=='Admin' }"> ������ ${User.admin_id}�� �α��� �Ǿ����ϴ�.</c:if>
								</li>
								<li id="top_list"><a href="../index/logout.html">�α׾ƿ�</a></li>
								<li id="top_list"><a href="../ItemCart/showCart.html">
										<c:if test="${Type=='Formal' || Type=='Unsigned' }">��ٱ���</c:if>
								</a>
								<li id="top_list"><a href="../ItemCart/CheckOut.html">
										<c:if test="${Type=='Formal' || Type=='Unsigned' }">���Ÿ��</c:if>
								</a></li>
							</c:when>
							<c:when test="${empty User }">
								<li id="top_list"><a href="javascript:LoginPopup()">�α���</a></li>
								<li id="top_list"><a href="../index/entry.html">ȸ������</a></li>
							</c:when>
						</c:choose>
					</ul>
					<hr />
				</div>
				<div id="buttons" align="center">
					<input id="btn" type="button" value="���θ޴�"
						onclick="location.href='../index/showMessage.html'" /> <input
						id="btn" type="button" value="�߰�ŷ�"
						onclick="location.href='../secondhand/frontpage.html'" /> <input
						id="btn" type="button" value="���¸���"
						onclick="location.href='../item/frontpage.html'" />
					<div id="dropbtn">
						<input id="btn" type="button" value="Ŀ�´�Ƽ"
							onclick="location.href='../bbs/frontpage.html'" />
						<div class="hidden">
							<a href="../bbs/toBBS.html?state=free">����</a><br /> 
							<a href="../bbs/toBBS.html?state=hobbit">���</a><br />
							<a href="../bbs/toBBS.html?state=read">�����Ÿ�</a>
						</div>
					</div>
					<input id="btn" type="button" value="����������"
						onclick="location.href='../mypage/frontpage.html'" />
				</div>
				<hr />
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>