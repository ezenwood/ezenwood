<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이젠 우드</title>
<link rel="shortcut icon" href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">


<script type="text/javascript">
var gfv_count = 1;
$(document).ready(function(){

	$("#addFile").on("click", function(e){ //파일 추가 버튼
		e.preventDefault();
		fn_addFile();
	});
});

function formCheck() {
	var form = document.writeForm;
	if(form.ONETOONE_TITLE.value=="") {
		alert("제목을 입력해주세요");
		form.ONETOONE_TITLE.focus();
		return false;
	} 
	if (form.ONETOONE_CONTENT.value == "") {
		alert("내용을 입력해주세요");
		form.ONETOONE_CONTENT.focus();
		return false;
	}
	
	form.submit();
}

function fn_addFile(){
	var str = "<p><input type='file' name='otoImage"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
	$("#fileDiv").append(str);
	$("a[name='delete']").on("click", function(e){ //삭제 버튼
		e.preventDefault();
		fn_deleteFile($(this));
	});
}
function fn_deleteFile(obj){
	obj.parent().remove();
}


</script>

</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="sub_content">
				<div class="content">
					<div class="board_zone_sec">
						<div class="board_zone_tit">
							<h2>1:1 문의</h2>
						</div>
						<div class="board_zone_cont">

							<form name="writeForm" id="frmWrite" method="post"
								enctype="multipart/form-data" class="frmWrite"
								novalidate="novalidate">
								<input type="hidden" name="MEMBER_NAME" value=""> 
								<input type="hidden" name="bdId" value="oto"> 
								<input type="hidden" name="bdId" value="oto"> 
								<input type="hidden" name="bdId" value="oto"> 
								<input type="hidden" name="sno" value> 
								<input type="hidden" name="mode" value="write"> 
								<input type="hidden" name="returnUrl" value="bdId=goodsqa">
								<div class="board_zone_write">
									<div class="board_write_box">
										<table class="board_write_table">
											<colgroup>
												<col style="width: 15%">
												<col style="width: 85%">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">작성자</th>
													<td>${OTOInsertMap.MEMBER_NAME}</td>
												</tr>
												<tr>
													<th scope="row">제목</th>
													<td><input type="text" name="ONETOONE_TITLE" value="">
													</td>
												</tr>
												<tr>
													<th scope="row">본문</th>
													<td class="write_editor"><textarea id="editor"
															name="ONETOONE_CONTENT" title="내용" cols="80" rows="20"></textarea>
														<!--<iframe frameborder="0" scrolling="no" style="width: 100%; height: 375px;" src="js/sister_js/SmartEditor2Skin.html"></iframe>-->
													</td>
												</tr>
												<tr>
													<th scope="row">이미지파일</th>
													<td id="uploadBox">
														<div class="file_upload_sec">
															<div
																style="overflow: hidden; width: 100%; margin: 5px 0 10px 0;">
																
																<div class="btn_upload_box">
																	<input type="file" name="otoImage" accept="image/jpg, image/jpeg, image/png" >
																	<div>jpg, jpeg, png 파일만 선택 가능합니다.</div>
																	
																	<a href="#this" class="btn" id="addFile">파일 추가</a>
																	
																	</div>
																</div>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>


								<div class="btn_center_box">
									<div style="text-align: center">
										<button type="button" class="btn_before"
											onclick="location.href='http://localhost:9001/ezenwood/board/oto'">
											<strong>이전</strong>
										</button>
										<button type="button" class="btn_write_ok" onclick="formCheck()">
											<strong>저장</strong>
										</button>
									
										
									</div>
								</div>

							</form>
						</div>
						<!--//board_zone_cont-->
					</div>
					<!--//board_zone_sec-->

				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>