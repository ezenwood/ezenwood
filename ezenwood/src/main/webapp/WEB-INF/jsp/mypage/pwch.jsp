<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<link rel="stylesheet" href="/ezenwood/css/css/layout.css">
<link rel="stylesheet" href="/ezenwood/css/css/member.css">
<link rel="stylesheet" href="/ezenwood/css/css/reset.css">
<link rel="stylesheet" href="/ezenwood/css/css/board.css">
<link rel="stylesheet" href="/ezenwood/css/css/common.css">
<link rel="stylesheet" href="/ezenwood/css/css/button.css">
<title>pwchk</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />
		<div id="contents">
			<!-- 본문  -->
			<div class="location_wrap">
				<div class="location_cont">
					<em> <a href="/ezenwood/mypage/main" class="local_home">Home</a>
						&gt; 회원정보 변경
					</em>
				</div>
			</div>
			<!-- locaion_wrap-->
			<div class="sub_content">
				<div class="side_cont">
					<%@include file="/include/left.jsp"%>
					<!--sub_menu_box -->
				</div>
				<!-- side_cont-->

				<div class="content">
					<div class="mypage_main">
						<!--마이페이지 회원 요약정보 -->
						<div class="my_page_password">
							<div class="mypage_zone_tit">
								<h3>회원 정보 변경</h3>
							</div>
							<form id="formFind" method="post"
								action="${contextPath}/mypage/pwch">
								<div class="id_pw_cont" style="border-width: 3px 0px 3px 0px">
									<dl>
										<dt>아이디</dt>
										<dd>
											<strong></strong>
										</dd>
									</dl>
									<dl>
										<dt>비밀번호</dt>
										<dd>
											<div class="member_warning">
										
										<input type="password" name="MEMBER_PW" id="pw"
													onchange="check_pw()">
											</div>
										</dd>
									</dl>
								</div>
								<div class="btn_center_box">
									<button type="submit" class="btn_pw_cancel">
										<em>취소</em>
									</button>
									<button type="submit" class="btn_pw_certify" onclick="${contextPath}/mypage/update">
										<em>인증하기</em>
									</button>
								</div>
							</form>
						</div>
						<!--mypage_password -->
					</div>
					<!-- mypage_ocont -->
				</div>
				<!--content -->

			</div>

		</div>

	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>