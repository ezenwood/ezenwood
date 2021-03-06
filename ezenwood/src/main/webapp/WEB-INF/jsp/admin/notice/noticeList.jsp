<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
	var ddd = document.location.href;

	var idx = ddd.lastIndexOf("/");

	var sss = ddd.substring(0, idx + 1);

	function fn_search(pageNo) {
		
		var type = '${map.type}';
		
		var keyword = '${map.keyword}';

		if (type == '' || type == null) {
			location.href = sss + pageNo ;
		}else {
			location.href = sss + pageNo + '?' + "type="+type+"&keyword="+keyword;
		}
		
		
}
</script>
<meta charset="UTF-8">
<title>noticeList</title>
<link href="css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="bootstrap/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
<style type="text/css">
.paging {
	text-align: center;
	height: 32px;
	margin-top: 5px;
	margin-bottom: 15px;
}

.paging a, .paging strong {
	display: inline-block;
	width: 36px;
	height: 32px;
	line-height: 28px;
	font-size: 14px;
	border: 1px solid #e0e0e0;
	margin-left: 5px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
	-moz-box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
	box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
}

.paging a:first-child {
	margin-left: 0;
}

.paging strong {
	color: #fff;
	background: #337AB7;
	border: 1px solid #337AB7;
}

.paging .page_arw {
	font-size: 11px;
	line-height: 30px;
}
</style>
</head>
<body>
	<%@include file="/include/admin_header.jsp"%>
	<%@include file="/include/admin_left.jsp"%>
	<div id="wrapper">
		<div id="page-wrapper" style="min-height: 703px;">
			<div class="row" style="padding-left: 15px; width: 900px;">
				<h1 class="page-header">????????????</h1>
			</div>
			<c:set var="contextPath" value="${pageContext.request.contextPath}" />
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-heading">??????????????? ??????, ??????, ?????? ???????????? ??????????????????.</div>
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
											<thead>
												<tr role="row" style="vertical-align: middle;">
													<th
														style="width: 5%; text-align: center; vertical-align: middle;">??????</th>
													<th
														style="width: 8%; text-align: center; vertical-align: middle;">??????</th>
													<th
														style="width: 16%; text-align: center; vertical-align: middle;">?????????</th>
													<th
														style="width: 5%; text-align: center; vertical-align: middle;">????????????</th>
													<th
														style="width: 6%; text-align: center; vertical-align: middle;">?????????</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="nt">
													<tr class="gradeA even" role="row">
														<td style="text-align: center; vertical-align: middle;">${nt.NOTICE_NUM}</td>
														<td style="text-align: center; vertical-align: middle;">
															<a href="/ezenwood/admin/noticedetail/${nt.NOTICE_NUM}">${nt.NOTICE_TITLE}</a>
														</td>
														<td style="text-align: center; vertical-align: middle;">admin</td>

														<td style="text-align: center; vertical-align: middle;"><fmt:formatDate
																value="${nt.NOTICE_DATE}" pattern="YY.MM.dd HH:mm" /></td>
														<td style="text-align: center; vertical-align: middle;">${nt.NOTICE_STEP}</td>
														<!--  ????????? ????????? ????????? -->
														<c:if test="${fn:length(nt) le 0}">
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

												<div class="insu"
													style="margin: 0 auto; text-align: center;">
													<c:if test="${not empty paginationInfo}">
														<ui:pagination paginationInfo="${paginationInfo}"
															type="text" jsFunction="fn_search" />
													</c:if>
												</div>
											</div>
										</div>
										<div style="align: center;">
											<form id="searchForm" action="${contextPath}/admin/notice/1"
												method="get">
												<select name="type">
													<option value="">?????????</option>
													<option value="title">??????</option>
													<option value="step">?????????</option>
												</select> <input type="text" name="keyword" /> <input type="submit"
													value="??????" />
											</form>
										</div>
									</div>

									<div class="row">
										<div style="text-align: right;">
											<span>
												<button type="submit" class="btn btn-default"
													style="margin-right: 15px;"
													onclick="location.href='${contextPath}/admin/notice/write'">??????</button>
											</span>

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
	</div>
</body>
</html>