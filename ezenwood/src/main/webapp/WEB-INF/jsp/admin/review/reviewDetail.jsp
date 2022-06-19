<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 리뷰 상세</title>
<link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<%@include file="/include/admin_header.jsp"%>
	<%@include file="/include/admin_left.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div id="page-wrapper" style="min-height: 703px;">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">REVIEW 상세보기</h3>
				<table class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<caption>번호,제목,글쓴이,날짜,조회를 나타내는 공지사항 표</caption>

					<thead>
						<tr class="dangers" style="background-color: #fff">
							<th width="100">글제목</th>
							<td colspan=3>${RVMap.REVIEW_TITLE}</td>
						</tr>
					</thead>

					<tbody>
						<tr>
							<!-- 작성자 -->
							<th>작성자</th>
							<td style="width: 218px;"><strong>
									${RVMap.MEMBER_NAME} </strong></td>
							<td style="width: 120px;"><strong>작성일</strong></td>
							<td><fmt:formatDate value="${RVMap.REVIEW_DATE}"
									pattern="yyyy.MM.dd" /></td>

						</tr>

						<tr>
							<!-- 글내용 -->
							<th>글내용</th>
							<td colspan=3 height=600 style="padding: 0px !important;"><br>${RVMap.REVIEW_CONTENT}
							</td>
						</tr>
						<tr>
							<th>이미지</th>
							<td style="padding: 0px !important;"><img
								src="/ezenwood/resource/image/${RVMap.GOODS_SUBIMAGE}"
								width="200" height="250" alt="상품 이름" title="상품 이름"
								class="middle"></td>
						</tr>

					</tbody>

				</table>
			</div>
		</div>
	</div>
	<div class="menu-wrap" style="text-align: center">
		<button type="button" class="btn btn-success"
			onclick="location.href='${contextPath}/admin/review/del/${RVMap.REVIEW_NUM}'">삭제</button>
		<button type="button" class="btn btn-success"
			onclick="location.href='${contextPath}/admin/review/1'">목록으로</button>
	</div>

	<br />
	<br />
</body>
</html>