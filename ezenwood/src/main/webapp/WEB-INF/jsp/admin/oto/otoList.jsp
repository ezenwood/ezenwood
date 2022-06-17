<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var ddd = document.location.href;

	var idx = ddd.lastIndexOf("/");

	var sss = ddd.substring(0, idx + 1);

	function fn_search(pageNo) {

		location.href = sss + pageNo;
	}
</script>
<meta charset="UTF-8">
<link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css"
	rel="stylesheet">
<title>관리자 페이지 - 1:1 문의</title>
</head>
<body>
	<%@include file="/include/admin_header.jsp"%>
	<%@include file="/include/admin_left.jsp"%>
	<div id="page-wrapper" style="min-height: 703px;">

		<!-- 메인container-->

		<div class="row" style="padding-left: 15px; width: 900px;">
			<h1 class="page-header">1:1 문의 리스트</h1>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<!-- <div style="background-color: yellow"> -->
				<i class="fa fa-clock-o fa-fw"></i>1:1문의 검색, 삭제 기능 페이지입니다.
			</div>
			<!-- /.panel-heading -->

			<div class="panel-body">
				<div class="panel-body">
				<c:set var="contextPath" value="${pageContext.request.contextPath}" />
					<div class="dataTable_wrapper">
						<div id="dataTables-example_wrapper"
							class="dataTables_wrapper form-inline dt-bootstrap no-footer">
							<div class="row" style="margin-bottom: 5px;">
								<div class="col-sm-6">
									<a href="${contextPath}/admin/oto/1"><button type="button"
											class="btn btn-outline btn-default">전체</button></a>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12">
									<table
										class="table table-striped table-bordered table-hover dataTable no-footer"
										id="dataTables-example" role="grid"
										aria-describedby="dataTables-example_info">
										<thead>
											<tr role="row">
												<th style="width: 10%; text-align: center;">번호</th>

												<th style="width: 50%; text-align: center;">제목</th>
												<th style="width: 10%; text-align: center;">작성자</th>
												<th style="width: 10%; text-align: center;">답변상태</th>
												<th style="width: 10%; text-align: center;">등록일자</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="oto" items="${list}">
												<tr class="gradeA even" role="row">
													<td style="text-align: center; vertical-align: middle;">${oto.ONETOONE_NUM}</td>

													<td style="text-align: center; vertical-align: middle;">
														<a href="/ezenwood/admin/otoDetail/${oto.ONETOONE_NUM}">${oto.ONETOONE_TITLE}</a>
													</td>

													<td style="text-align: center; vertical-align: middle;">${oto.ONETOONE_MEMBER_NUM}</td>
													<td style="text-align: center; vertical-align: middle;">${oto.ONETOONE_RE_GB}</td>
													<td style="text-align: center; vertical-align: middle;">${oto.ONETOONE_DATE}</td>
												</tr>
											</c:forEach>
											<!--  등록된 상품이 없을때 -->
											<c:if test="${fn:length(list) le 0}">
												<tr>
													<td colspan="9" style="text-align: center;">등록된 글이
														없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
							<div class="pagination">
								<div class="pagination">

									<div class="insu" style="margin: 0 auto; text-align: center;">
										<c:if test="${not empty paginationInfo}">
											<ui:pagination paginationInfo="${paginationInfo}" type="text"
												jsFunction="fn_search" />
										</c:if>
									</div>
								</div>
							</div>
							<div style="align: center;">
								<form id="searchForm" action="${contextPath}/admin/oto" method="get">
									<select name="type">
										<option value="">검색어</option>
										<option value="title">제목</option>
										<option value="writer">작성자</option>
									</select> <input type="text" name="keyword"/> <input
										type="submit" value="검색" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>