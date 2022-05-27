<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin review list</title>
</head>
<body>
	<div>
		<div>
			<h1>Review</h1>
		</div>
		<div>
			<div>
				<div style="background-color: yellow">review 검색, 삭제 기능 페이지입니다.
				<div>
					<div style="background-color: green">
						<div>
							<div style="margin-bottom: 5px;">
								<div>
									<input type="button" value="전체" style="float: left" onclick="전체리스트경로"> 
								</div>
							</div>

							<div>
								<div>
									<table style="width: 100%">
										<thead>
											<tr role="row">
												<th style="width: 50%; text-align: center;">제목</th>

												<th style="width: 30%; text-align: center;">상품이름</th>

												<th style="width: 10%; text-align: center;">작성자</th>
												<th style="width: 10%; text-align: center;">등록일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${noticelist}" varStatus="stat">
												<tr class="gradeA even" role="row">
													<td style="text-align: center; vertical-align: middle;"><a
														href="제목을 통한 경로"></a></td>
													<td style="text-align: center; vertical-align: middle;"></td>
													<td style="text-align: center; vertical-align: middle;" onclick="작성자끼리묶인경로"></td>
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