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
<link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
		<div id="page-wrapper" style="min-height: 703px;">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">REVIEW 상세보기</h3>
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<caption>번호,제목,글쓴이,날짜,조회를 나타내는 공지사항 표</caption>

						<thead>
							<tr class="danger" style="background-color: #fff">
								<th width="100">글제목</th>
								<td colspan=3>${reviewModel.subject}</td>
							</tr>
						</thead>

						<tbody>
							<tr>
								<!-- 작성자 -->
								<th>작성자</th>
								<td><strong> ${review_writer} </strong></td>
								<td><strong>작성일</strong></td>
								<td><fmt:formatDate value="${reviewModel.regdate}"
										pattern="yyyy.MM.dd" /></td>

							</tr>

							<tr>
								<!-- 글내용 -->
								<th>글내용</th>
								<td colspan=3 height=600 style="padding: 0px !important;">
									<img
									src="/ezenwood/resource/#/${reviewModel.imagefile_savname}"/> 
									<br />${reviewModel.content}
								</td>
							</tr>

						</tbody>

					</table>
				</div>
			</div>
		</div>
		<div class="menu-wrap" style="text-align: center">
			<!-- 삭제 버튼 -->
			<c:if
				test="${session_member_name == reviewModel.name || session_member_id == 'admin'}">
				<!-- 관리자 혹은 글쓴이는 글 수정 , 삭제가능 -->
				
				<button type="button" onclick="reviewDelete();"
					class="btn btn-primary">삭제</button>
			</c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="reviewList();" class="btn btn-primary">목록</button>
			<!-- 삭제 목록 버튼 -->
		</div>
	</div>
	<br />
	<br />
</body>
</html>