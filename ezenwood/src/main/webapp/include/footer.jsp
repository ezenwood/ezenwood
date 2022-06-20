<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="ko">

<head>
<meta charset="UTF-8">
<title>test_footer</title>
<link href="/ezenwood/reset2.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/common2.css" type="text/css" rel="stylesheet">
<script>
	function banking() {
		if ($("bankinginfo:first").is(":hidden")) {
			$("#bankinfo").show("fast");
		} else {
			$("#bankinfo").hide("fast");
		}
	}
</script>
</head>

<body>
	<footer id="footer">
		<div id="footer_wrap">
			<div class="foot_cont">
				<div>
					COMPANY. 주식회사 이젠우드 <br> CEO. EZEN <br> BUSINESS REG.NO :
					111-11-11111 <br> MAILORDER SALES LICENSE NO : 2022-서울
					종로구-0179 <br> ADDRESS. 3F 302, Jongno-gu, Seoul, Korea <br>
				</div>

				<div>
					CALL. 02-1111-2222 <br> WEEKDAY AM 11:00 - PM 17:00 / HOLIDAY
					CLOSE <br> E-MAIL. ezenwood@naver.com <br>
				</div>

				<div>
					<ul>
						<li><a href="#">TERMS OF USE </a></li>
						<li><a href="#">PRIVACY POLICY</a></li>
						<li><a href="#">GUIDE</a></li>
					</ul>
					<br>
				</div>



			</div>

			<div class="copyright">
				<p>COPYRIGHT(c) 2022 EZENWOOD ALL RIGHT RESERVED</p>
			</div>
		</div>
	</footer>
</body>

</html>
