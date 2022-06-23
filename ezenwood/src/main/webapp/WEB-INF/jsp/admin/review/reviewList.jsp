<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<script>
	var ddd = document.location.href;

	var idx = ddd.lastIndexOf("/");

	var sss = ddd.substring(0, idx + 1);

	function fn_search(pageNo) {

		var type = '${map.type}';

		var keyword = '${map.keyword}';

		if (type == '' || type == null) {
			location.href = sss + pageNo;
		} else {
			location.href = sss + pageNo + '?' + "type=" + type + "&keyword="
					+ keyword;
		}
	}
</script>
<meta charset="UTF-8">
<link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css"
	rel="stylesheet">
<title>관리자 페이지 - 리뷰리스트</title>
</head>
<body>
	<%@include file="/include/admin_header.jsp"%>
	<%@include file="/include/admin_left.jsp"%>
	<div id="page-wrapper" style="min-height: 703px;">
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />
		<!-- 메인container-->

		<div class="row" style="padding-left: 15px; width: 900px;">
			<h1 class="page-header">리뷰 리스트</h1>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<!-- <div style="background-color: yellow"> -->
				<i class="fa fa-clock-o fa-fw"></i>review 검색, 삭제 기능 페이지입니다.
			</div>
			<!-- /.panel-heading -->

			<div class="panel-body">
				<div class="dataTable_wrapper">
					<div id="dataTables-example_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap no-footer">
						<div class="row">
							<div class="col-sm-12">
								<table
									class="table  table-bordered table-hover dataTable no-footer"
									id="dataTables-example" role="grid"
									aria-describedby="dataTables-example_info">
									<colgroup>
										<col style="width: 14%">
										<!-- 주문번호 -->
										<col style="width: 14%">
										<!-- 상품이름 -->
										<col style="width: 44%">
										<!-- 제목 -->
										<col style="width: 14%">
										<!-- 작성자-->
										<col style="width: 14%">
										<!-- 등록일자 -->
									</colgroup>
									<thead>
										<tr role="row">
											<th style="width: 10%; text-align: center;">번호</th>
											<th style="width: 15%; text-align: center;">상품이름</th>
											<th style="width: 50%; text-align: center;">제목</th>
											<th style="width: 10%; text-align: center;">작성자</th>
											<th style="width: 15%; text-align: center;">등록일자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="rv">
											<tr class="gradeA even" role="row">
												<td>${rv.REVIEW_NUM}</td>
												<td>${rv.GOODS_TITLE}</td>
												<td><a
													href="/ezenwood/admin/reviewdetail/${rv.REVIEW_NUM}">${rv.REVIEW_TITLE}</a></td>
												<td>${rv.MEMBER_NAME}</td>
												<!-- MEMBERID로 받아야함 -->
												<td>${rv.REVIEW_DATE}</td>
												<!--  등록된 상품이 없을때 -->
												<c:if test="${fn:length(fq) le 0}">
													<tr>
														<td colspan="9" style="text-align: center;"></td>
													</tr>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="pagination">
									<div class="pagination">

										<div class="insu" style="margin: 0 auto; text-align: center;">
											<c:if test="${not empty paginationInfo}">
												<ui:pagination paginationInfo="${paginationInfo}"
													type="text" jsFunction="fn_search" />
											</c:if>
										</div>
									</div>
								</div>
								<div style="align: center;">
									<form id="searchForm" action="${contextPath}/admin/revieww/1"
										method="get">
										<select name="type">
											<option value="">검색어</option>
											<option value="title">제목</option>
											<option value="writer">작성자</option>
										</select> <input type="text" name="keyword" /> <input type="submit"
											value="검색" />
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.table-responsive -->
			</div>
		</div>
		<!-- /.panel -->
	</div>
	</div>
</body>
</html>