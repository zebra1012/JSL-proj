<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function goHot(){
	alert("추천했습니다.");
	location.href="../bbs/bbsDetail.html?seqno=${target.bbs_seqno}&rn=${target.rn}&hot=yes";
}
</script>
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
							<td width="200px" colspan="2">${target.bbs_title }</td>
							<td width="100px">${target.bbs_writer }</td>
							<td><font size="1">${target.bbs_date }</font></td>
						</tr>
						<tr height="300px">
							<td colspan="5"><img alt="" width="300px"
								src="${pageContext.request.contextPath }/BBS_Image/${target.bbs_image }" />
								<br />
								<div style="clear: both"></div> ${target.bbs_content }</td>
						</tr>
						<tr><th colspan="5"><input type="button" value="추천" onclick="javascript:goHot();"/></th></tr>
					</table>
					<hr>
					<jsp:include page="../bbs/comment.jsp"></jsp:include>
				</div>
			</c:when>
		</c:choose>
	</div>
</body>
</html>