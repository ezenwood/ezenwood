<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
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
        <!-- ���� ���� -->

            <div class="location_wrap">
                <div class="location_cont">
                    <em><a href="#" class="local_home">HOME</a> &gt; ��й�ȣ ã��</em>
                </div>
            </div>
            <!-- //location_wrap -->

            <div class="sub_content">

                <!-- //side_cont -->
<div class="content_box">
	<form name="formFind" id="formFind" action="../member/user_certification.php" method="post" novalidate="novalidate">
		<div class="member_wrap">
			<div class="member_tit">
				<h2>��й�ȣ ã��</h2>
			</div>
			<div class="member_cont">
				<div class="find_password_box">
					<h3>���̵� �Է�</h3>
					<p>��й�ȣ�� ã���� �ϴ� ���̵� �Է��� �ּ���.</p>
					<div class="login_input">
						<div class="member_warning">
							<input type="text" id="memberId" name="memberId" placeholder="���̵�">
							<p class="info_again">���̵� �𸣽ó���? <a href="#" class="js_btn_find_id">���̵� ã��</a></p>
							<p class="dn" id="errorMessage"></p>
						</div>
						<div class="btn_center_box">
							<button type="submit" class="btn_member_next">����</button>
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
        <!-- //���� �� contents -->
    </div>
    <%@include file ="/include/footer.jsp" %>
</body>
</html>