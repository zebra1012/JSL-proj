<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../index/header.jsp"></jsp:include>
	<div id="wrapper">
		<table id="wrapper_table">
			<tr>
				<td rowspan="2">
					<div id="free_latest">
						<h3>최근 자유게시판 글</h3>
						<table border="1">
							<tr>
								<th width="600">제목</th>
							</tr>
							<c:forEach var="freebbs" items="${free_list }">
								<tr height="50px"
									onclick="location.href='../bbs/bbsDetail.html?seqno=${freebbs.bbs_seqno }&rn=${freebbs.rn}'">
									<td>${freebbs.bbs_title }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</td>
				<td>
					<div id="hobbit_latest">
						<h3>최근 취미 게시판 글</h3>
						<table border="1">
							<tr >
								<th width="600">제목</th>
							</tr>
							<c:forEach var="hobbitbbs" items="${hobbit_list }">
								<tr height="50px"
									onclick="location.href='../bbs/bbsDetail.html?seqno=${hobbitbbs.bbs_seqno }&rn=${hobbitbbs.rn}'">
									<td>${hobbitbbs.bbs_title }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="read_latest">
						<h3>최근 읽을거리 게시판 글</h3>
						<table border="1">
							<tr>
								<th width="600">제목</th>
							</tr>
							<c:forEach var="readbbs" items="${read_list }">
								<tr height="50px"
									onclick="location.href='../bbs/bbsDetail.html?seqno=${readbbs.bbs_seqno }&rn=${readbbs.rn}'">
									<td>${readbbs.bbs_title }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>