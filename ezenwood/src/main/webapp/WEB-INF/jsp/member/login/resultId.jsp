<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>IdFindResult</title>
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/member.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<!-- 본문 시작 -->

			<div class="location_wrap">
				<div class="location_cont">
					<em><a href="/ezenwood/main" class="local_home">HOME</a> &gt;
						아이디 찾기 ${sessionScope.MEMBER_NAME}</em>
				</div>
			</div>
			<!-- //location_wrap -->

			<div class="sub_content">

				<!-- //side_cont -->
				<div class="content_box">
					<div class="member_wrap">
						<div class="member_tit">
							<h2>아이디찾기</h2>
						</div>
						<!-- //member_tit -->
						<c:set var="contextPath"
							value="${pageContext.request.contextPath}" />
						<div class="member_cont">
							<form id="formFindId" method="GET" novalidate="novalidate">
								<div class="find_id_box">
									<div class="find_id_sec">
										<div class="find_complete_box">
											<p>
												고객님의 아이디는 <br> <strong>${MEMBER_ID}</strong> 입니다.
											</p>
										</div>
									</div>
									<!-- //find_id_sec -->
									<div class="btn_member_sec">
										<ul>
											<li><input type="button" value="비밀번호 찾기"
												class="btn_member_white js_btn_find_password"
												onclick="location.href='${contextPath}/member/pwfind'">
											</li>
											<li><button type="button" id="btnJoinMember"
											class="btn_member_join" onclick="location.href='/ezenwood/member/signin'">로그인하기</button></li>
										</ul>
									</div>
									<!-- //btn_member_sec -->
								</div>
								<!-- //find_id_box -->
							</form>
						</div>
						<!-- //member_cont -->
					</div>
					<!-- //member_wrap -->
				</div>
				<!-- //content_box -->

			</div>
			<!-- //sub_content -->
		</div>
		<!-- //본문 끝 contents -->
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>