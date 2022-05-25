<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>IdFind</title>
    <link href="css/reset.css" type="text/css" rel="stylesheet">
    <link href="css/common.css" type="text/css" rel="stylesheet">
    <link href="css/member.css" type="text/css" rel="stylesheet">
    <link href="css/layout.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div id="container">
        <div id="contents">
        <!-- 본문 시작 -->

            <div class="location_wrap">
                <div class="location_cont">
                    <em><a href="#" class="local_home">HOME</a> &gt; 아이디 찾기</em>
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
			<form id="formFindId" method="post" action="../member/member_ps.php" novalidate="novalidate">
				<div class="find_id_box">
					<div class="find_id_sec">
						<h3>회원 아이디찾기</h3>
						<div class="login_input">
							<div>
								<input type="text" id="userName" name="userName" placeholder="이름">
								<input type="text" id="userEmail" name="userEmail" placeholder="가입메일주소">
							</div>
							<button type="submit" class="btn_member_id">아이디 찾기</button>
						</div>
						<p class="dn js_caution_msg1">일치하는 회원정보가 없습니다. 다시 입력해 주세요.</p>
					</div>
					<!-- //find_id_sec -->
					<div class="btn_member_sec">
						<ul>
							<li><button class="btn_member_white js_btn_find_password">비밀번호 찾기</button></li>
							<li><button class="btn_comfirm js_btn_login">로그인하기</button></li>
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

<script type="text/template" id="templateFindIdResult">
	<div class="find_complete_box"><p><%= %> 회원님의 아이디는 <br><strong><%= %></strong> 입니다</p></div>
</script>
            </div>
            <!-- //sub_content -->
        </div>
        <!-- //본문 끝 contents -->
    </div>
</body>
</html>