<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fqList</title>
</head>
<body>
	<div style="width:100%; background-color:red;"> <!-- 가장 바깥 틀 -->
		<div>
			<h1>자주묻는질문</h1>
		</div>
		<div style="width:100%; background-color:orange;"><!-- 안쪽 박스 틀  -->
			<div>
				<div style="background-color: yellow">자주묻는질문 등록, 수정, 삭제 기능하는 페이지입니다. 
			</div>
				<div>
					<div style="background-color: green; margin:50px">
						<div>
							<div style="margin-bottom: 5px;">
								<div>
									<input type="button" value="전체" style="float: left" onclick=""> 
								</div>
							</div>

							<div>
								<div>
									<table style="width: 100%">
										<thead>
											<tr role="row">
												<th style="width: 10%; text-align: center;">번호</th>
												<th style="width: 65%; text-align: center;">제목</th>
												<th style="width: 15%; text-align: center;">등록일</th>
												<th style="width: 10%; text-align: center;">중요도</th>
											</tr>
										</thead>
										<tbody>
											<%-- <c:forEach var="list" items="${noticelist}" varStatus="stat"> --%>
												<tr class="gradeA even" role="row">
													<td style="text-align: center; vertical-align: middle;">1</td>
													<td style="text-align: center; vertical-align: middle;">결제는 어떻게<a
														href="제목을 통한 경로"></a></td>
													<td style="text-align: center; vertical-align: middle;">22-05-27</td>
													<td style="text-align: center; vertical-align: middle;">1</td>
												</tr>
											<%-- </c:forEach> --%>
											<!--  등록된 상품이 없을때 -->
											<c:if test="${fn:length(list) le 0}">
												<tr>
													<td colspan="9" style="text-align: center;"> 등록된 글이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
									<br>
									<div align="center">
										<input type="button" value="등록" onclick=""></input>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="수정" onclick=""></input>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="삭제" onclick=""></input>
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