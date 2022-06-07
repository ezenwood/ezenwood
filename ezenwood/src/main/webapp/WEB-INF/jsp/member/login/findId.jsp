<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>IdFind</title>
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
					<em><a href="/ezenwood/main" class="local_home">HOME</a> &gt; 아이디 찾기</em>
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
						<div class="member_cont">
						<c:set var="contextPath" value="${pageContext.request.contextPath}" />
							<form id="formFindId" method="POST" action="${contextPath}/member/idresult"
								novalidate="novalidate">
								<div class="find_id_box">
									<div class="find_id_sec">
										<h3>회원 아이디찾기</h3>
										<div class="login_input">
											<div>
												<input type="text" id="MEMBER_NAME" name="MEMBER_NAME"
													placeholder="이름"> <input type="text" id="MEMBER_EMAIL"
													name="MEMBER_EMAIL" placeholder="가입메일주소">
											</div>

											<button type="button" class="btn_member_id"
												onclick="location.href='/ezenwood/member/idresult'">아이디
												찾기</button>

										</div>
										<p class="dn js_caution_msg1">일치하는 회원정보가 없습니다. 다시 입력해 주세요.</p>
									</div>
									<!-- //find_id_sec -->
									<div class="btn_member_sec">
										<ul>

											<li><button type="button"
													class="btn_member_white js_btn_find_password"
													onclick="location.href='/ezenwood/member/pwfind'">비밀번호
													찾기</button></li>
											<li><button type="button"
													class="btn_comfirm js_btn_login"
													onclick="location.href='/ezenwood/member/signin'">로그인하기</button></li>

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