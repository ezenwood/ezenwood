<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="UTF-8">
<title>이젠 우드</title>
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="sub_content">
				<div class="content">
					<div class="board_zone_sec">
						<div class="board_zone_tit">
							<h2>1:1 문의</h2>
						</div>

						<div class="board_zone_cont">
							<div class="board_zone_list">
								<div class="board_list_qa" align="center">
									<table class="board_list_table" style="width: 100%">
										<colgroup>
											<col style="width: 20%" />
											<!--문의 날짜-->
											<col>
											<!--제목-->
											<col style="width: 15%" />
											<!--작성자-->
											<col style="width: 15%" />
											<!--문의 상태-->
										</colgroup>
										<thead>
											<tr>
												<th>문의날짜</th>
												<th>제목</th>
												<th>작성자</th>
												<th>문의 상태</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${fn:length(OTOListMap) > 0 }">
													<c:forEach var="row" items="${OTOListMap}">
														<tr>
															<td><fmt:formatDate value="${row.ONETOONE_DATE}"
																	type="both" dateStyle="medium" timeStyle="medium" /></td>
															<td class="title"><a
																href="/ezenwood/board/oto/otoBoard/${row.ONETOONE_NUM}">
																	<strong>${row.ONETOONE_TITLE}</strong>
															</a></td>
															<td align="center">${row.ONETOONE_MEMBER_ID}</td>
															<td align="center"><c:choose>
																	<c:when test="${row.ONETOONE_RE_GB == 'Y'}">답변 완료</c:when>
																	<c:otherwise>답변 대기</c:otherwise>
																</c:choose></td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="15">조회된 결과가 없습니다.</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
							<!-- //board_zone_list -->
							<div class="btn_right_box">
                                <button type="button" class="btn_write" onclick="location.href='http://localhost:9001/ezenwood/board/oto/otoWrite'">
                                    문의하기
                                </button>
                            </div>
                            
						</div>
						<!-- //sub_content -->
					</div>
					<!-- //본문 끝 contents -->
				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>