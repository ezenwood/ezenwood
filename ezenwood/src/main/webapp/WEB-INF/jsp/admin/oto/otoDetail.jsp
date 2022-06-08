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
<link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
		<div id="page-wrapper" style="min-height: 703px;">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">1:1문의 상세보기</h3>
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<caption>번호,제목,글쓴이,날짜,조회를 나타내는 공지사항 표</caption>

						<thead>
							<tr class="dangers" style="background-color: #fff">
								<th width="100">글제목</th>
								<td colspan=3>${onetoone_title}</td>
							</tr>
						</thead>

						<tbody>
							<tr>
								<!-- 작성자 -->
								<th >작성자</th>
								<td style="width: 218px;"><strong> ${onetoone_writer} </strong></td>
								<td style="width: 120px;"><strong>작성일</strong></td>
								<td><fmt:formatDate value="${onetoone_date}"
										pattern="yyyy.MM.dd" /></td>

							</tr>

							<tr>
								<!-- 글내용 -->
								<th>글내용</th>
								<td colspan=3 height=600 style="padding: 0px !important;">
									
									<br />${onetoone.content}
								</td>
							</tr>
							<tr>
							<th>이미지</th>
							<td style="padding: 0px !important;">
							<img src="/ezenwood/resource/image/pet1.jpg"/> </td>
							</tr>

						</tbody>

					</table>
				</div>
			</div>
		</div>
		<div class="menu-wrap" style="text-align: center">
		
		
			<button type="button" onclick="onetooneReplyForm();" class="btn btn-primary">답변</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<!-- 삭제 버튼 -->
			<c:if
				test="${session_member_name == onetoone.name || session_member_id == 'admin'}">
				<!-- 관리자 혹은 글쓴이는 글 수정 , 삭제가능 -->
				
				<button type="button" onclick="onetooneDelete();"
					class="btn btn-primary">삭제</button>
			</c:if>
		</div>
	</div>
	<br />
	<br />
</body>
</html>