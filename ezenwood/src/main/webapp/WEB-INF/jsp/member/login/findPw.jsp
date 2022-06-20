<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>PwFind</title>
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
						비밀번호 찾기</em>
				</div>
			</div>
			<!-- //location_wrap -->

			<div class="sub_content">

				<!-- //side_cont -->
				<div class="content_box">
					<c:set var="contextPath" value="${pageContext.request.contextPath}" />
					<form id="formFindId" method="POST"
						action="${contextPath}/member/pwfind" novalidate="novalidate">
						<div class="member_wrap">
							<div class="member_tit">
								<h2>비밀번호 찾기</h2>
							</div>
							<div class="member_cont">
								<div class="find_password_box">
									<h3>아이디 입력</h3>
									<div class="login_input">
										<div class="member_warning">
											<input type="text" id="member_id" name="MEMBER_ID"
												placeholder="아이디"> <input type="text"
												id="member_email" name="MEMBER_EMAIL" placeholder="가입메일주소">
											<p class="info_again">아이디를 모르시나요?</p>
											<button type="button" id="btnFindId"
												onclick="location.href='/ezenwood/member/idfind'">아이디
												찾기</button>
										</div>
										<div class="btn_center_box">
											<input type="submit" value="다음" class="btn_member_white">

										</div>
									</div>
								</div>
								<!-- //find_password_box -->
							</div>
							<!-- //member_cont -->
						</div>
						<!-- //member_wrap -->
					</form>
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