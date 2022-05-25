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
        <!-- ���� ���� -->

            <div class="location_wrap">
                <div class="location_cont">
                    <em><a href="#" class="local_home">HOME</a> &gt; ���̵� ã��</em>
                </div>
            </div>
            <!-- //location_wrap -->

            <div class="sub_content">

                <!-- //side_cont -->
<div class="content_box">
	<div class="member_wrap">
		<div class="member_tit">
			<h2>���̵�ã��</h2>
		</div>
		<!-- //member_tit -->
		<div class="member_cont">
			<form id="formFindId" method="post" action="../member/member_ps.php" novalidate="novalidate">
				<div class="find_id_box">
					<div class="find_id_sec">
						<h3>ȸ�� ���̵�ã��</h3>
						<div class="login_input">
							<div>
								<input type="text" id="userName" name="userName" placeholder="�̸�">
								<input type="text" id="userEmail" name="userEmail" placeholder="���Ը����ּ�">
							</div>
							<button type="submit" class="btn_member_id">���̵� ã��</button>
						</div>
						<p class="dn js_caution_msg1">��ġ�ϴ� ȸ�������� �����ϴ�. �ٽ� �Է��� �ּ���.</p>
					</div>
					<!-- //find_id_sec -->
					<div class="btn_member_sec">
						<ul>
							<li><button class="btn_member_white js_btn_find_password">��й�ȣ ã��</button></li>
							<li><button class="btn_comfirm js_btn_login">�α����ϱ�</button></li>
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
	<div class="find_complete_box"><p><%= %> ȸ������ ���̵�� <br><strong><%= %></strong> �Դϴ�</p></div>
</script>
            </div>
            <!-- //sub_content -->
        </div>
        <!-- //���� �� contents -->
    </div>
</body>
</html>