<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>otoList</title>
</head>
<body>
	<div>
		<div>
			<h3>1:1문의</h3>
			<div>
				<p>1:1문의 검색,삭제 기능 페이지입니다.</p>
				<div>
					<div>
					<input type="button" value="전체" onclick="전체로 가는url">
						<select>
							<option value="">관리자답변</option>
							<option value="">무엇이</option>
							<option value="">들어가는</option>
							<option value="">드롭박스인가</option>
						</select>
					</div>
					
					<form>
					<div>
						<table style="width:100%">
							<thead>
								<tr>
									<td style="width:15%">번호</td>
									<td style="width:40%">제목</td>
									<td style="width:15%">아이디</td>
									<td style="width:15%">관리자 답변</td>
									<td style="width:15%">등록일자</td>
								</tr>
							</thead>
							
							<tbody>
							<%-- <c:forEach var="" items=""> --%>
								<tr>
									<td style="width:15%">1</td>
									<td style="width:40%">제목</td>
									<td style="width:15%">admin</td>
									<td style="width:15%">ok</td>
									<td style="width:15%">2022.05.26</td>
								</tr>
							<%-- </c:forEach> --%>
							</tbody>
						</table>
					</div>
					</form>
					
					<div align="center">
						페이징
					</div>
					
					<div align="center" style="width:100%;">
						<select>
							<option value=""></option>
							<option value="">아이디</option>
							<option value="">등록일자</option>
							<option value="">제목</option>
						</select>
						<input type="text" value="">
						<input type="submit" value="검색">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>