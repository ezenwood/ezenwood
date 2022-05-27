<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문수정</title>
</head>
<body>
	<div>
		<div style="width:100%; background-color:red;"> <!-- 가장 큰 틀 -->
			<h3 style="background-color:skyblue">자주묻는질문 수정ㄴ</h3>
			<div>
				<div style="background-color:gray"> <!-- 두번 쟤 틀 -->
					<p>자주 묻는 질문 수정 페이지 입니다.</p>
					<div style="border:1px solid; background-color:blue"> <!-- 내부 내용 -->
						<form><!-- 입력된 값 받아와야함 -->
						<table style="margin:50px;" align="center">
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
						<!-- 버튼 눌렀을 때 수정되게 바꿔야함 -->
							<input type="submit" value="수정" >
						</div>
					</div>
				</div>			
			</div>
		</div>
	</div>
</body>
</html>