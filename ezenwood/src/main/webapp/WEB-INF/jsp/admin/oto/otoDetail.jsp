<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 1:1문의 상세</title>
<link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<%@include file="/include/admin_header.jsp"%>
	<%@include file="/include/admin_left.jsp"%>
	<div id="page-wrapper" style="min-height: 703px;">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">1:1문의</h3>
				<table class="table table-striped table-bordered table-hover"
					id="dataTables-example">


					<thead>
						<tr class="dangers" style="background-color: #fff">
							<th width="100">글제목</th>
							<td colspan=3>${QOTOMap.ONETOONE_TITLE}</td>
						</tr>
					</thead>

					<tbody>
						<tr>
							<!-- 작성자 -->
							<th>작성자</th>
							<td style="width: 218px;"><strong>
									${QOTOMap.ONETOONE_MEMBER_NUM} </strong></td>
							<td style="width: 120px;"><strong>작성일</strong></td>
							<td><fmt:formatDate value="${QOTOMap.ONETOONE_DATE}"
									pattern="yyyy.MM.dd" /></td>

						</tr>

						<tr>
							<!-- 글내용 -->
							<th>문의 내용</th>
							<td colspan=3 height=250 style="padding: 0px !important;"><br />${QOTOMap.ONETOONE_CONTENT}
							</td>
						</tr>
						<tr>
							<th>이미지</th>
							<td style="padding: 0px !important;"><img
								src="/ezenwood/resource/image/pet1.jpg" /></td>
						</tr>

					</tbody>

				</table>
			</div>
		</div>
	</div>

	<div id="page-wrapper" style="min-height: 703px;">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">1:1답변</h3>
				<table class="table table-striped table-bordered table-hover"
					id="dataTables-example">


					<thead>
						<tr class="dangers" style="background-color: #fff">
							<th width="100">글제목</th>
							<td colspan=3>${AOTOMap.ONETOONE_TITLE}</td>
						</tr>
					</thead>

					<tbody>
						<tr>
							<!-- 작성자 -->
							<th>작성자</th>
							<td style="width: 218px;"><strong> admin </strong></td>
							<td style="width: 120px;"><strong>작성일</strong></td>
							<td><fmt:formatDate value="${AOTOMap.ONETOONE_DATE}"
									pattern="yyyy.MM.dd" /></td>

						</tr>

						<tr>
							<!-- 글내용 -->
							<th>답변 내용</th>
							<td colspan=3 height=250 style="padding: 0px !important;"><br />${AOTOMap.ONETOONE_CONTENT}
							</td>
						</tr>
						<tr>
							<th>이미지</th>
							<td style="padding: 0px !important;"><img
								src="/ezenwood/resource/image/pet1.jpg" /></td>
						</tr>

					</tbody>

				</table>
			</div>
		</div>
	</div>
	<div style="text-align: center">
		<br> <input type="hidden" value="${QOTOMap.ONETOONE_NUM}"
			name="ONETOONE_NUM">
		<button type="button" class="btn btn-success"
			onclick="location.href='${contextPath}/admin/oto/writer/${QOTOMap.ONETOONE_NUM}/${QOTOMap.OTO_SECREATE}'">답변</button>
		<button type="reset" class="btn btn-default"
			onclick="location.href='${contextPath}/admin/oto/1'">작성취소</button>
		<button type="button" class="btn btn-success"
			onclick="location.href='${contextPath}/admin/oto/del/${AOTOMap.ONETOONE_NUM}'">삭제</button>

	</div>

	<br />
	<br />
</body>
</html>