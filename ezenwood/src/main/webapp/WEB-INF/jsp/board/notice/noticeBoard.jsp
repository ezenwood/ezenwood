<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
</head>
<body>
	<div id="container">
		<div id="contents">
			<!-- 본문 시작 -->

			<!-- //location_wrap -->
			<div>
				<div>
					<em><a href="#" class="local_home">board</a> &gt; notice</em>
				</div>
			</div>
			<div class="sub_content">

				<!-- //side_cont -->
				<div>
					<div>
						<div>
							<h2>공지사항</h2>
						</div>
						<div>
							<div align="center">
								<table style="width: 100%">
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
									<c:forEach var="list" items="noticeboardlist">
										<tr>
											<td align="center">번호데이터</td>
											<td align="center"><a href="제목 데이터 넘어오는 코드"> <strong>제목
														데이터코드</strong>
											</a></td>
											<td align="center">날짜 데이터코드</td>
										</tr>
									</c:forEach>
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
</body>
</html>