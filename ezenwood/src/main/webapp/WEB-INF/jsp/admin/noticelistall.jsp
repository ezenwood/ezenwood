<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>admin notice all</title>
</head>
<body>
	<div>
		<div>
			<h1>공지사항</h1>
		</div>
		<div>
			<div>
				<div>공지사항 검색, 수정, 삭제 기능하는 페이지입니다.</div>
				<div>
					<div>
						<div>
							<div style="margin-bottom: 5px;">
								<div>
									<a href=""><button type="button">전체</button></a>
								</div>
							</div>
							<div>
								<div>
									<table style="margin: 30px; border: 30px">
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

											<tr class="gradeA even" role="row">
												<td style="text-align: center; vertical-align: middle;"></td>

												<td style="text-align: center; vertical-align: middle;"><a
													href="제목을 통한 경로"></a></td>

												<td style="text-align: center; vertical-align: middle;"></td>
												<td style="text-align: center; vertical-align: middle;"></td>
												<td style="text-align: center; vertical-align: middle;"></td>
											</tr>
										</tbody>
									</table>
									<div align="right">
										<form action="공지사항 쓰기url">
											<input type="button" value="쓰기">
										</form>
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