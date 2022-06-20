<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<title>이젠 우드</title>
<link rel="shortcut icon" href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/member.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">

</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="contents">
		<!-- 본문 시작 -->

		<div class="location_wrap">
			<div class="location_cont">
				<em><a href="#" class="local_home">HOME</a> &gt; 로그인</em>
			</div>
		</div>
		<!-- //location_wrap -->

		<div class="sub_content">

			<!-- //side_cont -->
			<div class="content_box">
				<div class="member_wrap">
					<div class="member_tit">
						<h2>로그인</h2>
					</div>
					<!-- //member_tit -->
					<div class="member_cont">
					<c:set var="contextPath" value="${pageContext.request.contextPath}" />
						<form id="formLogin" method="post" action="${contextPath}/member/signin"
							novalidate="novalidate">
							<input type="hidden" id="mode" name="mode" value="login">
							<div class="member_login_box">
								<h3>회원 로그인</h3>
								<div class="login_input_sec">
									<div>
										<input type="text" name="MEMBER_ID" id="member_id" placeholder="아이디" >
										<input type="password" name="MEMBER_PW" id="member_pw" placeholder="비밀번호" >
									</div>
									<button type="submit" >로그인</button>
								</div>
							</div>
							</form>
							<div class="btn_login_box">
								<ul>
									<li><button type="button" id="btnJoinMember"
											class="btn_member_join" onclick="location.href='/ezenwood/member/signup'">회원가입</button></li>
									<li><button type="button" id="btnFindId" class="btn_member_white" onclick="location.href='/ezenwood/member/idfind'">아이디
											찾기</button></li>
									<li><button type="button" id="btnFindPwd" class="btn_member_white" onclick="location.href='/ezenwood/member/pwfind'">비밀번호
											찾기</button></li>
								</ul>
							</div>
							<!-- //btn_login_box -->
					</div>
					<!-- //member_cont -->
				</div>
				<!-- //member_wrap -->
			</div>
			<!-- //content_box -->


		</div>
		<!-- //sub_content -->
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>