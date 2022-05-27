<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문등록</title>
</head>
<body>
	<div>
		<div>
			<h3>자주묻는질문 등록</h3>
			<div>
				<div>
					<p>자주 묻는 질문 등록 페이지 입니다.</p>
					<div style="border:1px solid;">
						<form>
						<table align="center">
							<tr>
								<td>
								<input type="text" placeholder="제목을 입력해주세요">
								</td>
							</tr>
							
							<tr>
								<td>
								<textarea cols="60" rows="10" placeholder="내용을 입력해주세요"></textarea>
								</td>
							</tr>
						</table>
						</form>
						<div style="width:100%" align="center">
							<form>
								<input style="width:300px" type="text" pattern="[0-9]+" placeholder="0~9까지의 숫자만 넣어주세요">
								<input type="submit" value="중요도">
							</form>
						</div>
						<br>
						<div align="center">
							<input type="submit" value="등록" >
						</div>
					</div>
				</div>			
			</div>
		</div>
	</div>
</body>
</html>