<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>admin QNA list</title>
</head>
<body>
	<div>
		<div>
			<h1>QnA</h1>
		</div>
		<div>
			<div>
				<div style="background-color: yellow">QnA 검색, 수정, 삭제 기능하는
					페이지입니다.</div>
				<div>
					<div style="background-color: green">
						<div>
							<div style="margin-bottom: 5px;">
								<div style="background-color: skyblue">
									<input type="button" value="전체" style="float: left"> <select
										style="margin: 10px;">
										<option value="" selected>선택</option>
										<option value="하나">하나</option>
										<option value="둘">둘</option>
									</select>
								</div>
							</div>

							<div>
								<div>
									<table style="width: 100%">
										<thead>
											<tr role="row">
												<th style="width: 10%; text-align: center;">번호</th>

												<th style="width: 50%; text-align: center;">제목</th>

												<th style="width: 15%; text-align: center;">작성</th>
												<th style="width: 15%; text-align: center;">등록일</th>
												<th style="width: 10%; text-align: center;">중요도</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${noticelist}" varStatus="stat">
												<tr class="gradeA even" role="row">
													<td style="text-align: center; vertical-align: middle;"></td>

													<td style="text-align: center; vertical-align: middle;"><a
														href="제목을 통한 경로"></a></td>

													<td style="text-align: center; vertical-align: middle;"></td>
													<td style="text-align: center; vertical-align: middle;"></td>
													<td style="text-align: center; vertical-align: middle;"></td>
												</tr>
											</c:forEach>
											<!--  등록된 상품이 없을때 -->
											<c:if test="${fn:length(list) le 0}">
												<tr>
													<td colspan="9" style="text-align: center;"> 등록된 글이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
									<div align="center">
										<select style="margin: 10px;">
											<option value="" selected>선택</option>
											<option value="작성자">작성자</option>
											<option value="둘">둘</option>
										</select> <input type="search" id="site-search" name="q">

										<button>Search</button>
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