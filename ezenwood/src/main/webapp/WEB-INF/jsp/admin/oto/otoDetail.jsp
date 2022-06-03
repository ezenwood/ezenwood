<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link href="/ezenwood/css/bootstrapadmin.min.css" type="type/css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>otoDetail</title>
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
<title>관리자 페이지 - 1:1문의 상세</title>
</head>
<body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
		<div id="page-wrapper" style="min-height: 703px;">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">1:1문의 상세보기</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

						<div class="dataTable_wrapper">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr class="danger" style="background-color: #fff">
										<th width="100">글제목</th>
										<td colspan=3>${qna_title}</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<!-- 작성자 -->
										<th>작성자</th>
										<td><strong> ${qna_writer} </strong></td>
										<td><strong>작성일</strong></td>
										<td><fmt:formatDate value="${qna_date}"
												pattern="yyyy.MM.dd" /></td>

									</tr>

									<tr>
										<!-- 글내용 -->
										<th>글내용</th>
										<td colspan=3 height=600 style="padding: 0px !important;">
											<br />${qna_content}
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="menu-wrap" style="text-align: center">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="#" class="btn btn-primary" style="">답변</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="qnaDelete();"
						class="btn btn-primary">삭제</button>

					<input type="button" onclick="location.href='#'" value="목록"
						class="btn btn-primary" style="float: right" /> <br /> <br /> <br />
					<br />
				</div>

				<c:if test="${fn:length(CommList) le 0}">
					<br />
					<center>등록된 답변이 없습니다</center>
					<br />
				</c:if>
			</div>
		</div>
	</div>
	<!-- 
	
						<div align="center" style="width:100%">
							<input type="button" value="답변" onclick="답변URL">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="수정" onclick="수정 url">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="삭제" onclick="삭제 url">
						</div>
					
		 -->
</body>
</html>