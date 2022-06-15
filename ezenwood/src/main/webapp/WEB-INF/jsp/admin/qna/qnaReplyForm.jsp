<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/ezenwood/css/bootstrapadmin.min.css" rel="stylesheet">
<link href="/ezenwood/css/reset.css" rel="stylesheet">
<!-- <link href="last/css/sb-admin-2.css" rel="stylesheet"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.contents-wrap {
	margin: 30px 0 0 0;
	min-height: 500px;
}

.contents {
	margin: 60px 0 0 0;
}

.recode-wrap {
	text-align: right;
	color: #888;
}

.hit-wrap {
	color: #888;
	margin: 10px 0;
}

.viewForm {
	margin: 20px 0 0 0;
}
</style>
<title>관리자 페이지 - QNA 문의 답변</title>
</head>
<body>
	<%@include file="/include/admin_header.jsp"%>
	<%@include file="/include/admin_left.jsp"%>
	<div id="page-wrapper" style="min-height: 703px;">
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />
		<form action="${contextPath}/admin/qna/writer/${QNANum}/${QNASE}"
			method="post">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">QNA 문의 답변 작성</h3>

					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">

						<thead>
							<tr class="danger">
								<th width="100">글제목</th>
								<td colspan=3><input type="text" style="width: 400px;"
									name="QNA_TITLE" value="${QNA_TITLE}" /></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<!-- 사용자 -->
								<th>사용자 ID</th>
								<td colspan=3><strong> <input type="text" value="${MEMBER_ID}" name="MEMBER_ID" readonly="readonly"> </strong></td>
							</tr>
							<tr>
								<!-- 글내용 -->
								<th>글내용</th>
								<td colspan=3 height=250 style="padding: 0px !important;">
									<input type="text" value="${QNA_CONTENT}"
									name="QNA_CONTENT"
									style="padding: 3px; margin: 2px; width: 100%; height: 98%;">
									<input type="hidden" value="${QNANum}" name="QNA_NUM">
									<input type="hidden" value="${QNASE}"
									name="QNA_SECREATE"> <!-- 벨리데이터 표시 -->
								</td>
							</tr>

						</tbody>

					</table>
				</div>
			</div>

			<br> <br>
			<!-- 취소 작성완료 버튼 -->
			<div class="menu-wrap" style="text-align: center">
				<input type="submit" value="작성완료" class="btn btn-primary"
					onclick="${contextPath}/admin/qna/write/${QNANum}/${QNASE}"> <input
					type="button" value="목록" class="btn btn-primary"
					onclick="location.href='${contextPath}/admin/qna/1'">

			</div>
		</form>
	</div>


</body>

</html>