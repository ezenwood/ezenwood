<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PwFindResult</title>
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
	<div class="member_wrap">
		<div class="member_tit">
			<h2>��й�ȣã��</h2>
		</div>
		<!-- //member_tit -->
		<div class="member_cont">
			<form id="formFindPw" method="post" action="../member/member_ps" novalidate="novalidate">
				<div class="find_pw_box">
					<div class="find_pw_sec">
	<div class="find_complete_box"><p>�����ڴ��� ��й�ȣ�� <br><strong>1234</strong> �Դϴ�.</p></div>
</div>
					<!-- //find_id_sec -->
					<div class="btn_member_sec">
						<ul>
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
	<div class="find_complete_box"><p><%= %> ȸ������ ��й�ȣ�� <br><strong><%= %></strong> �Դϴ�</p></div>
</script>
            </div>
            <!-- //sub_content -->
        </div>
        <!-- //���� �� contents -->
    </div>
    <%@include file ="/include/footer.jsp" %>
</body>
</html>