<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공지사항_자세히</title>
</head>
<body>
	<div>
		<div>
			<em><a href="#" class="board로가자">board</a> &gt; notice</em>
		</div>
		<div>
			<div>
				<h2>Notice</h2>
			</div>
			<div>
				<c:forEach var="list" items="noticeboarddetail">
					<table style="width: 100%">
						<colgroup>
							<col style="width: 50%">
							<col style="width: 50%">
						</colgroup>
						<tr>
							<th align="center">제목코드</th>
							<th align="center">날짜코드</th>
						</tr>
					</table>
				</c:forEach>
				<c:forEach var="image" items="image">
					<div align="center">
						<img>이미지 코드</img>
					</div>
				</c:forEach>
				<c:forEach var="list" items="noticeboardlist">
					<p align="center">공지사항content</p>
				</c:forEach>
			</div>
			<hr>
			<div align="center">
				<button type="submit" href="목록으로 가는 url">목록</button>
			</div>
		</div>
	</div>
</body>
</html>