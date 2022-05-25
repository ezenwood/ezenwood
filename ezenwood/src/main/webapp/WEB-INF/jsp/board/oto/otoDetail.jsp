<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1대1문의_자세히</title>
</head>
<body>
	<div>
		<div>
			<em><a href="#" class="board로가자">board</a> &gt; 1대1문의</em>
		</div>
		<div>
			<div>
				<h2>1대1문의</h2>
			</div>
			<div>
				<c:forEach var="list" items="noticeboarddetail">
					<table style="width: 100%">
						<colgroup>
							<col style="width: 50%">
		          <col style="width: 30%">
              <col style="width: 20%">
						</colgroup>
						<tr>
							<th align="center">제목코드</th>
              <th align="center">관리자</th>
							<th align="center">날짜코드</th>
						</tr>
					</table>
				</c:forEach>
				<c:forEach var="image" items="image">
          <input type="hidden" id="글번호" name="이 태그 네임" value="값넘겨줌">
					<div align="center">
						<img>이미지 코드</img>
					</div>
				</c:forEach>
				<c:forEach var="list" items="otoclientcontent">
					<p align="center">배송문의합니다 ct글</p>
				</c:forEach>
			</div>
			<hr>
    <c:forEach var="list" items="otoclientcontent">
    <div align="center">
      <p>관리자 답변 받아오기</p>
    </div>
    </c:forEach>
			<div align="center">
				<button type="submit" href="목록으로 가는 url">목록</button>
			</div>
		</div>
	</div>
</body>
</html>