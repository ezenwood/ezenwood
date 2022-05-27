<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberList</title>
</head>
<body>
	<div>
		<div style="border: 1px solid;">
			<div>
				<h1>회원목록</h1>
			</div>
			<div>
				<div>
					<p>회원 검색, 수정, 삭제 기능하는 페이지입니다.</p>
				</div>
				<div>
					<div>
						<div>
							<div style="margin-bottom: 5px;">
								<div>
									<input type="button" value="전체" onclick=""></input>
								</div>
								<!-- 총 게시물수 가져오는 함수 필요 -->
								<div style="text-align: right;">
									<div>총 게시물수 :</div>
								</div>

							</div>
							<div>
								<div style="border: 1px solid;">
									<table style="width: 100%;">
										<thead>
											<tr role="row">
												<th style="width: 10%; text-align: center;">번호</th>
												<th style="width: 10%; text-align: center;">ID</th>
												<th style="width: 15%; text-align: center;">이름</th>
												<th style="width: 15%; text-align: center;">전화번호</th>
												<th style="width: 15%; text-align: center;">이메일</th>
												<th style="width: 15%; text-align: center;">주소</th>
												<th style="width: 10%; text-align: center;">가입일자</th>
												<th style="width: 10%; text-align: center;">탈퇴여부</th>
											</tr>
										</thead>
										<tbody>

											<tr class="gradeA even" role="row">
												<td style="text-align: center; vertical-align: middle;">번호</td>
												<td style="text-align: center; vertical-align: middle;">ID</td>
												<td style="text-align: center; vertical-align: middle;">이름</td>
												<td style="text-align: center; vertical-align: middle;">전화번호</td>
												<td style="text-align: center; vertical-align: middle;">이메일</td>
												<td style="text-align: center; vertical-align: middle;">주소</td>
												<td style="text-align: center; vertical-align: middle;">
													<%-- <fmt:formatDate value="${list.regdate}"pattern="YY.MM.dd HH:mm" /> --%>가입일자
												</td>
												<td style="text-align: center; vertical-align: middle;">탈퇴여부</td>
											</tr>
											<!--  등록된 상품이 없을때 -->
											<c:if test="${fn:length(list) le 0}">
												<tr>
													<td colspan="9" style="text-align: center;">등록된 인간이
														없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
									<div>페이징자리</div>

									<div>
										<div style="width: 100%;">
											<div style="align: center">
												<select>
													<option value="" selected>선택</option>
													<option value="하나">하나</option>
													<option value="둘">둘</option>
												</select> <input type="search"> <input type="submit"
													value="검색">
											</div>
										</div>
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