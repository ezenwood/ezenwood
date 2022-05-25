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
	</div>
	<div>
		<div>
			<div>
				<div>
					<div>
						<form>
						<input type="hidden">
							<div>
								<table style="width: 100%">
									<thead>
										<tr align="left">
											<th>제목</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="float: left">물품이름</td>
											<td style="float: right"><strong> 관리자 </strong>&nbsp;&nbsp;|&nbsp;&nbsp;
												<fmt:formatDate value="" pattern="yyyy-MM-dd" />날짜</td>
										</tr>
										<tr align="center">
											<td>글내용</td>
										</tr>
									</tbody>
								</table>
								<hr color="black">
								
								<div>
									<p>원래 있던 답변글 받아오는 곳</p>
									<textarea rows="5" cols="100%"></textarea>
									<input type="button" value="글입력" id="">
								</div>
								
							</div>
						</form>
					</div>
				</div>

				<div align="center">
					<input type="button" onclick="목록으로 가는 " value="목록"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="button" onclick="notide수정페이지" value="수정"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="button" onclick="notide삭제페이지" value="삭제">
				</div>
			</div>
		</div>
	</div>
</body>
</html>