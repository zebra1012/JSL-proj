<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function goHot(){
	if(${sessionScope.Type == 'Formal'}) {
	alert("추천했습니다.");
	location.href="../bbs/bbsDetail.html?seqno=${target.bbs_seqno}&rn=${target.rn}&hot=yes&id=${sessionScope.User.user_id}";
	}
	else{
		alert("권한이 없습니다. 일반회원만 추천 할 수 있습니다.");
	}
}
</script>
<style type="text/css">
li {
	float: right;
	list-style: none;
}

div#detail_buttons {
	margin-right: 22%;
}
</style>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../index/header.jsp"></jsp:include>
	<div id="wraaper">
		<c:choose>
			<c:when test="${result == 'Fail' }">
				<script type="text/javascript">
					alert("에러가 발생했습니다.");
					history.back();
				</script>
			</c:when>
			<c:when test="${result == 'Success' }">
				<div id="detail">
					<table align="center" border="1">
						<tr>
							<td width="30px">${target.rn}</td>
							<td width="400px" colspan="2">${target.bbs_title }</td>
							<td width="100px">${target.bbs_writer }</td>
							<td><font size="1">${target.bbs_date }</font></td>
						</tr>
						<tr height="300px">
							<td colspan="5"><img alt="" width="200px"
								src="${pageContext.request.contextPath }/BBS_Image/${target.bbs_image }" />
								<br /> <br />
								<div style="clear: both"></div> ${target.bbs_content }</td>
						</tr>
						<tr>
							<th colspan="5"><input type="button" value="추천"
								onclick="javascript:goHot();" /></th>
						</tr>
					</table>
					<div id="detail_buttons">
						<ul>
							<c:choose>
								<c:when test="${target.bbs_code==1 }">
									<li><input type="button" value="목록으로"
										onclick="location.href='../bbs/toBBS.html?state=free'"></li>
								</c:when>
								<c:when test="${target.bbs_code==2 }">
									<li><input type="button" value="목록으로"
										onclick="location.href='../bbs/toBBS.html?state=hobbit'"></li>
								</c:when>
								<c:when test="${target.bbs_code==3 }">
									<li><input type="button" value="목록으로"
										onclick="location.href='../bbs/toBBS.html?state=read'"></li>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${target.bbs_state ==1 }">
									<li><input type="button" value="삭제"
										onclick="location.href='../bbs/delete.html?seqno=${target.bbs_seqno}"></li>
									<li><input type="button" value="수정"
										onclick="location.href='../bbs/modify.html?seqno='+${target.bbs_seqno}+'&rn='+${target.rn}"></li>
								</c:when>
								<c:when test="${target.bbs_state==0 }">
									<li><input type="button" value="삭제"
										onclick="window.open('../bbs/askpwdBBS.html?request=delete&seqno=${target.bbs_seqno}','_blank','width=450,height=200')"></li>
									<li><input type="button" value="수정"
										onclick="window.open('../bbs/askpwdBBS.html?request=modify&seqno=${target.bbs_seqno}&rn=${target.rn }','_blank','width=450,height=200')"></li>
								</c:when>
							</c:choose>
						</ul>
					</div>
					<br />
					<hr>
					<jsp:include page="../bbs/comment.jsp"></jsp:include>
				</div>
			</c:when>
		</c:choose>
	</div>
</body>
</html>