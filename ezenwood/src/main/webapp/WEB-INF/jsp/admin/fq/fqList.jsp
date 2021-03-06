<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>noticeList</title>
<link href="css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
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
				<h1 class="page-header">??????????????????</h1>
			</div>
			<c:set var="contextPath" value="${pageContext.request.contextPath}" />
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-heading">????????????????????? ??????, ??????, ?????? ???????????? ??????????????????.</div>
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
												<!-- ???????????? -->
												<col style="width: 58%">
												<!-- ?????? -->
												<col style="width: 14%">
												<!-- ????????????-->
												<col style="width: 14%">
												<!--????????? -->
											</colgroup>
											<thead>
												<tr role="row" style="vertical-align: middle;">
													<th>??????</th>
													<th>??????</th>
													<th>????????????</th>
													<th>?????????</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="fq">
													<tr class="gradeA even" role="row">
														<td>${fq.QUESTION_NUM}</td>
														<td><a
															href="/ezenwood/admin/fqdetail/${fq.QUESTION_NUM }">${fq.QUESTION_TITLE}</a></td>
														<td>${fq.QUESTION_DATE}</td>
														<td>${fq.QUESTION_STEP}</td>
														<!--  ????????? ????????? ????????? -->
														<c:if test="${fn:length(fq) le 0}">
															<tr>
																<td colspan="9" style="text-align: center;"></td>
															</tr>
														</c:if>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row">
									<div style="text-align: right;">
										<span>

											<button type="submit" class="btn btn-default"
												style="margin-right: 15px;"
												onclick="location.href='${contextPath}/admin/fqwrite'">??????</button>
										</span>

									</div>
								</div>

							</div>
							<div class="pagination">
								<div class="pagination">
									<!-- dsadsa -->


									<!-- dsadsa -->
									<div class="insu" style="margin: 0 auto; text-align: center;">
										<c:if test="${not empty paginationInfo}">
											<ui:pagination paginationInfo="${paginationInfo}" type="text"
												jsFunction="fn_search" />
										</c:if>
									</div>


								</div>
							</div>
							<div style="align: center;">
								<form id="searchForm" action="${contextPath}/admin/fqlist/1"
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
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.panel -->
		</div>
	</div>

</body>
</html>