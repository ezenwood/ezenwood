<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">

<title>이젠 우드</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="sub_content">
				<div class="content">
					<div class="board_zone_sec">
						<div class="board_zone_tit">
							<h2>NOTICE</h2>
						</div>

						<div class="board_zone_cont">
							<div class="board_zone_list" align="center">

								<table class="board_list_table" style="width: 100%">
									<colgroup>
										<col style="width: 6%">
										<col style="width: 37%">
										<col style="width: 12%">
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
											<c:when test="${fn:length(NoticeListMap) > 0 }">
												<c:forEach var="row" items="${NoticeListMap}">
													<tr>
														<td align="center">${row.NOTICE_NUM}</td>
														<td align="center"><a
															href="/ezenwood/board/notice/${row.NOTICE_NUM}"> <strong>${row.NOTICE_TITLE}</strong>
														</a></td>
														<td align="center"><fmt:formatDate
																value="${row.NOTICE_DATE}" type="both"
																dateStyle="medium" timeStyle="medium" /></td>
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
								<!-- //board_zone_list -->
							</div>
							<!-- //board_zone_cont -->
						</div>
						<!-- //board_zone_sec -->

					</div>
					<!-- //sub_content -->
				</div>
				<!-- //본문 끝 contents -->
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>