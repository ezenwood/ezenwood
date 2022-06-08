<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css"
	rel="stylesheet">
<title>관리자 페이지 - QnA</title>
</head>
<body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
		<div id="page-wrapper" style="min-height: 703px;">


			<!-- 메인container-->

			<div class="row" style="padding-left: 15px; width: 900px;">
				<h1 class="page-header">QnA 리스트</h1>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<!-- <div style="background-color: yellow"> -->
					<i class="fa fa-clock-o fa-fw"></i>QnA 검색, 삭제 기능 페이지입니다.
				</div>
				<!-- /.panel-heading -->

				<div class="panel-body">
					<div class="panel-body">
						<div class="dataTable_wrapper">
							<div id="dataTables-example_wrapper"
								class="dataTables_wrapper form-inline dt-bootstrap no-footer">
								<div class="row" style="margin-bottom: 5px;">
									<div class="col-sm-6">
										<a href="/ezenwood/admin/qnaList.#"><button type="button"
												class="btn btn-outline btn-default">전체</button></a> <select
											class="form-control" name="select"
											onchange="window.open(value,'_self');">
											<option value="">--카테고리--</option>
											<option
												value="/ezenwood/admin/goods?searchNum=4&amp;isSearch=0">답변대기중</option>
											<option
												value="/ezenwood/admin/goods?searchNum=4&amp;isSearch=1">답변완료</option>
										</select>
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
													<th style="width: 5%; text-align: center;">번호</th>
													<th style="width: 20%; text-align: center;">상품이름</th>
													<th style="width: 20%; text-align: center;">제목</th>
													<th style="width: 10%; text-align: center;">작성자</th>
													<th style="width: 5%; text-align: center;">답변상태</th>
													<th style="width: 10%; text-align: center;">등록일자</th>
												</tr>
											</thead>
											<tbody>
												
													<tr class="gradeA even" role="row">
														<td style="text-align: center; vertical-align: middle;">1</td>

														<td style="text-align: center; vertical-align: middle;">1<a
															href="제목을 통한 경로"></a></td>

														<td style="text-align: center; vertical-align: middle;">1</td>
														<td style="text-align: center; vertical-align: middle;">1</td>
														<td style="text-align: center; vertical-align: middle;">1</td>
														<td style="text-align: center; vertical-align: middle;">1</td>
													</tr>
												
												<!--  등록된 상품이 없을때 -->
												<c:if test="${fn:length(list) le 0}">
													<tr>
														<td colspan="9" style="text-align: center;"></td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>

								<!--검색 기능-->
								<div class="row">
									<div style="text-align: center;">
										<div id="dataTables-example_filter" class="dataTables_filter">
											<form action="">
												<select class="form-control" name="searchNum" id="searchNum">
													<option value="0">작성자</option>
												</select> <input class="form-control" type="text" name="isSearch"
													id="isSearch"> <span>
													<button type="submit" class="btn btn-default">검색</button>
												</span>
											</form>
										</div>
									</div>
								</div>
								<div class="content-center">
									<ul class="pagination">
										<li class="page-item active" aria-current="page"><span
											class="page-link"> 1 <span class="sr-only">(current)</span>
										</span></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
</body>
</html>