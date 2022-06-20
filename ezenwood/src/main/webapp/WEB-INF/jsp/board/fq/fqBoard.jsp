<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>이젠 우드</title>
<link rel="shortcut icon" href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
</head>

<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<!-- 본문 시작 -->
			<div class="sub_content">

				<!-- //side_cont -->
				<div class="content">
					<div class="board_zone_sec">
						<div class="board_zone_tit">

							<h2>자주 묻는 질문</h2>
						</div>
						<div class="board_zone_cont">
							<div class="board_zone_list" align="center">
								<table class="board_list_table" style="width: 100%">
									<colgroup>
										<col style="width: 5%">
										<col style="width: 30%;">
										<col style="width: 5%">
									</colgroup>
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(FQListMap) > 0 }">
												<c:forEach var="row" items="${FQListMap}">

													<tr data-sno="130" data-auth="c" style="height: 10px">
														<td>${row.QUESTION_NUM }</td>
														<td class="board_tit"><details>
																<summary><strong>${row.QUESTION_TITLE}</strong></summary>
																${row.QUESTION_CONTENT}
															</details></td>
														<td><fmt:formatDate value="${row.QUESTION_DATE}"
																type="both" dateStyle="medium" timeStyle="medium" /></td>

													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="10">조회된 결과가 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>


								<div class="pagination">
									<ul>
										<li class="on"><span>1</span></li>
									</ul>
								</div>

								<!-- //pagination -->

							</div>
							<!-- //board_zone_list -->
						</div>
						<!-- //board_zone_cont -->
					</div>
					<!-- //board_zone_sec -->


					<div id="layerDim" class="dn">&nbsp;</div>

				</div>
				<!-- //content -->
			</div>
			<!-- //sub_content -->
		</div>
		<!-- //본문 끝 contents -->
	</div>
	<%@include file="/include/footer.jsp"%>
</body>

</html>
