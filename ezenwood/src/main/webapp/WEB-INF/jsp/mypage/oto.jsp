<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script>
   function fn_search(pageNo) {
      var comSubmit = new ComSubmit();
      comSubmit.setUrl("<c:url value='/mypage/oto/{pageNum}'/>");
      comSubmit.addParam("currentPageNo", pageNo);
      comSubmit.submit();
   }
</script>

<meta charset="UTF-8">
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<link rel="stylesheet" href="/ezenwood/css/layout.css">
<link rel="stylesheet" href="/ezenwood/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/board.css">
<link rel="stylesheet" href="/ezenwood/css/common.css">
<title>oto2</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<!-- 본문  -->
			<div class="location_wrap">
				<div class="location_cont">
					<em> <a href="/ezenwood/mypage/main" class="local_home">Home</a> &gt;마이페이지&gt;게시판
						관리&gt;1:1문의
					</em>
				</div>
			</div>
			<!-- locaion_wrap-->
			<div class="sub_content">
				<div class="side_cont">
					<%@include file="/include/left.jsp"%>
					
				</div>
				<!-- side_cont-->

				<div class="content">
					<div class="mypage_cont">
						<div class="mypage_lately_info">
							<h2 style="font-size: large">1:1 문의</h2>
						</div>
					</div>


					<!-- oto 리스트-->
					<div class="mypage_table_type">
						<table>
							<colgroup>
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<!--확인/리뷰 -->
							</colgroup>
							<thead>
								<tr>
									<th>문의날짜</th>
									<th>제목</th>
									<th>작성자</th>
									<th>문의상태</th>
								</tr>
							</thead>
							<c:forEach items="${list}" var="oto">
							<tbody>
								<tr>
									<td>${oto.ONETOONE_DATE}</td>
									<td><a href="#"> ${oto.ONETOONE_TITLE} </a></td>
									<td>${oto.ONETOONE_MEMBER_NUM}</td>
									<td>${oto.ONETOONE_RE_GB}</td>
								</tr>
							</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>