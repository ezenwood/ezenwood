<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>AdminNoticeWrite</title>
<link href="css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="bootstrap/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
</head>
<body>
	<!-- 메뉴 시작 -->
	<%@include file="/include/admin_header.jsp"%>
	<%@include file="/include/admin_left.jsp"%>
	<div id="page-wrapper" style="min-height: 703px;">
		<div class="row" style="padding-left: 15px; width: 900px;">
			<h1 class="page-header">공지사항수정</h1>
		</div>
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />
		<div class="row" style="padding-left: 15px; width: 900px;">
			<div class="panel panel-default">
				<div class="panel-heading">공지사항 수정페이지입니다.</div>
				<div class="panel-body">
					<form action="${contextPath}/admin/notice/update/${ntNum}" method="post">
						<table>
							<tr>
								<td><input type="hidden" name="NOTICE_NUM"
									value="${NOTICE_NUM}"> <input type="text"
									name="NOTICE_TITLE" class="form-control"
									placeholder="제목을 입력하세요." value="${NOTICE_TITLE}"
									style="width: 300px; height: 40px"></td>
							</tr>

							<tr>

								<td><input type="text" style="width: 500px; height: 500px"
									name="NOTICE_CONTENT" placeholder="내용을 입력해주세요"
									value="${NOTICE_CONTENT}"></td>
							</tr>

							<tr>
								<td><label>중요도</label><input type="number"
									class="form-control" name="NOTICE_STEP"
									placeholder="중요도를 입력해주세요" style="width: 300px; height: 50px"
									value="${NOTICE_STEP}"></td>
							</tr>
						</table>
						<div class="form-group">
							<label>상품이미지</label> <input type="file" name="file[0]" size="30"
								value="tablename" />
							<p class="help-block">이미지 입니다 400x600 사이즈 권장합니다</p>
						</div>

						<input type="submit" value="등록" class="btn btn-default"
							onclick="${contextPath}/admin/notice/update/${ntNum}"> <input
							type="button" value="작성취소" class="btn btn-default"
							onclick="location.href='${contextPath}/admin/noticelist/1'">

					</form>

				</div>
			</div>
		</div>
	</div>



</body>
</html>