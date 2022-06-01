<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%@include file ="/include/header.jsp" %>
    <div id="container">
        <div id="contents">
        <!-- 본문 시작 -->

            <div class="location_wrap">
                <div class="location_cont">
                    <em><a href="#" class="local_home">HOME</a> &gt; 비밀번호 찾기</em>
                </div>
            </div>
            <!-- //location_wrap -->

            <div class="sub_content">

                <!-- //side_cont -->
<div class="content_box">
	<form name="formFind" id="formFind" action="../member/user_certification.php" method="post" novalidate="novalidate">
		<div class="member_wrap">
			<div class="member_tit">
				<h2>비밀번호 찾기</h2>
			</div>
			<div class="member_cont">
				<div class="find_password_box">
					<h3>아이디 입력</h3>
					<p>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
					<div class="login_input">
						<div class="member_warning">
							<input type="text" id="memberId" name="memberId" placeholder="아이디">
							<p class="info_again">아이디를 모르시나요? <a href="/ezenwood/member/idfind" class="js_btn_find_id">아이디 찾기</a></p>
							<p class="dn" id="errorMessage"></p>
						</div>
						<div class="btn_center_box">
							<button type="button" class="btn_member_next" onclick="location.href='/ezenwood/member/pwresult'">다음</button>
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
    <%@include file ="/include/footer.jsp" %>
</body>
</html>