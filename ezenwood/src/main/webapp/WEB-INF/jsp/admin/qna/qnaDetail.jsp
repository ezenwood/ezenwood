<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css"
	rel="stylesheet">
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<!-- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> -->
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
<title>Q&A</title>
</head>
<body>
	<%@include file="/include/admin_header.jsp"%>
	<%@include file="/include/admin_left.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div id="page-wrapper" style="min-height: 703px;">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">Q&A 상세보기</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">

					<div class="dataTable_wrapper">
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr class="dangers">
									<th width="100">글제목</th>
									<td colspan=3>${QNAMap.QNA_TITLE}</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<!-- 작성자 -->
									<th>작성자</th>
									<td><strong> ${QNAMap.QNA_WRITER} </strong></td>
									<td style="width: 118px;"><strong>작성일</strong></td>
									<td><fmt:formatDate value="${QNAMap.QNA_DATE}"
											pattern="yyyy.MM.dd" /></td>

								</tr>

								<tr>
									<!-- 글내용 -->
									<th>글내용</th>
									<td colspan=3 height=600 style="padding: 0px !important;">
										<br />${QNAMap.QNA_CONTENT}
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="menu-wrap" style="text-align: center">
				&nbsp;&nbsp;
				<button type="button" onclick="qnaDelete();" class="btn btn-primary"
					style="">수정</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" onclick="qnaDelete();" class="btn btn-primary">삭제</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
					onclick="location.href='QnAList.dog'" value="목록"
					class="btn btn-primary" />

			</div>
		</div>
	</div>
</body>
</html>