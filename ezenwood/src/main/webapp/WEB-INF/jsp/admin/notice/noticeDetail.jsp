<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>noticeDetail</title>
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

						<div>
							<table style="width: 100%">
								<thead>
									<tr align="left">
										<th>제목</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td align="left"><strong> 관리자 </strong>&nbsp;&nbsp;|&nbsp;&nbsp;
											<fmt:formatDate value="" pattern="yyyy-MM-dd" />날짜</td>
									</tr>
									<tr align="center">
										<td>글내용</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div align="center">
					<input type="button" onclick="공지사항목록페이지" value="목록"
						class="btn btn-primary" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="button" onclick="notide수정페이지" value="수정"
						class="btn btn-primary" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="button" onclick="notide삭제페이지" value="삭제"
						class="btn btn-primary" //>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
