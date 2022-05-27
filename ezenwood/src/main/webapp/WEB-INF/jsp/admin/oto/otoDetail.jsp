<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>otoDetail</title>
</head>
<body>
	<div>
		<div>
			<h3>1:1문의 상세</h3>
			<div>
				<p>1:1문의 상세 페이지입니다.</p>
				<div>
					<div style="margin:50px">
					<form>
						<div>
							<table style="border: 1px solid black;">
								<thead>
									<tr>
										<td>제목</td>
									</tr>
									<tr>
										<td>작성자</td>
										<td>날짜</td>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<td>글</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div>
							이미지로드
						</div>
					</form>
						<div align="center" style="width:100%">
							<input type="button" value="답변" onclick="답변URL">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="수정" onclick="수정 url">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="삭제" onclick="삭제 url">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>