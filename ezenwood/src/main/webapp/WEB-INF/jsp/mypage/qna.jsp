<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<html lang="en">
<head>
<script type="text/javascript">
	var ddd = document.location.href;

	var idx = ddd.lastIndexOf("/");

	var sss = ddd.substring(0, idx + 1);

	function fn_search(pageNo) {

		location.href = sss + pageNo;
	}
</script>
<meta charset="UTF-8">
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<link rel="stylesheet" href="/ezenwood/css/layout.css">
<link rel="stylesheet" href="/ezenwood/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/board.css">
<link rel="stylesheet" href="/ezenwood/css/common.css">
<title>qna2</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<!-- 본문  -->
			<div class="location_wrap">
				<div class="location_cont">
					<em> <a href="/ezenwood/mypage/main" class="local_home">Home</a>
						&gt;마이페이지&gt;게시글 관리&gt;Q&A
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
							<h2 style="font-size: large">Q&A</h2>
						</div>
					</div>


					<!-- qna 리스트-->
					<div class="mypage_lately_info"></div>
					<div class="mypage_table_type">
						<table>
							<colgroup>
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<!--확인/리뷰 -->
							</colgroup>
							<thead>
								<tr>
									<th>문의날짜</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>작성자</th>
									<th>문의상태</th>
								</tr>
							</thead>
							<c:forEach items="${list}" var="qna">
								<tbody>
									<tr>
										<td>${qna.QNA_DATE}</td>
										<td>몰랑</td>
										<td><a href="#">${qna.QNA_TITLE} </a></td>
										<td>${qna.QNA_WRITER}</td>
										<td>${qna.QNA_RE_GB}</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
						<div class="pagination">
							<div class="pagination">

								<div class="insu" style="margin: 0 auto; text-align: center;">
									<c:if test="${not empty paginationInfo}">
										<ui:pagination paginationInfo="${paginationInfo}" type="text"
											jsFunction="fn_search" />
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="/include/footer.jsp"%>
</body>
</html>