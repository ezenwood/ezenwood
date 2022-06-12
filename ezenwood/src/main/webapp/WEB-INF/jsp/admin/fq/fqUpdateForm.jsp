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
<style>
</style>
<body>
	<!-- 메뉴 시작 -->
	<%@include file="/include/admin_header.jsp"%>
	<%@include file="/include/admin_left.jsp"%>
	<div id="page-wrapper" style="min-height: 703px;">
		<div class="row" style="padding-left: 15px; width: 900px;">
			<h1 class="page-header">자주묻는질문수정</h1>
		</div>
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />
		<div class="row" style="padding-left: 15px; width: 900px;">
			<div class="panel panel-default">
				<div class="panel-heading">자주묻는질문 수정페이지입니다.</div>
				<div class="panel-body">
					<form action="${contextPath}/admin/fqupdate/${fqNum}" method="post">
						<table>
							<tr>
								<td><input type="hidden" name="QUESTION_NUM"
									value="${QUESTION_NUM}"> <input type="text"
									name="QUESTION_TITLE" class="form-control"
									placeholder="제목을 입력하세요." value="${QUESTION_TITLE}"
									style=" width: 300px; height: 40px">
								</td>
							</tr>

							<tr>
							
								<td>
								<input type="text" style="width: 500px; height: 500px"
									name="QUESTION_CONTENT" placeholder="내용을 입력해주세요"
									value="${QUESTION_CONTENT}"></td>
							</tr>

							<tr>
								<td><label>중요도</label><input type="number"
									class="form-control" name="QUESTION_STEP"
									placeholder="중요도를 입력해주세요" style="width: 300px; height: 50px"
									value="${QUESTION_STEP}"></td>
							</tr>
						</table>
						<input type="submit" value="등록" class="btn btn-default"
							onclick="${contextPath}/admin/fqupdate/${fqNum}"> <input
							type="button" value="작성취소" class="btn btn-default"
							onclick="location.href='${contextPath}/admin/fqlist/1'">

					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>