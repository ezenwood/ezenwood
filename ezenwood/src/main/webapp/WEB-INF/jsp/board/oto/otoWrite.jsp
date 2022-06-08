<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이젠 우드</title>
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">
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

							<form id="frmWrite" action="#" method="post"
								enctype="multipart/form-data" class="frmWrite"
								novalidate="novalidate">
								<input type="hidden" name="MEMBER_ID" value=""> 
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
													<td>${MEMBER_ID }</td>
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
													<th scope="row">첨부파일</th>
													<td id="uploadBox">
														<div class="file_upload_sec">
															<div
																style="overflow: hidden; width: 100%; margin: 5px 0 10px 0;">
																<label for="attach1"> <input type="text"
																	class="file_text" title="파일 첨부하기" readonly="readonly"
																	style="float: left; width: 230px;">
																</label>
																<div class="btn_upload_box">
																	<div
																		style="overflow: hidden; position: relative; float: left; width: 150px; padding: 0 0 0 6px;">
																		<button type="button" class="btn_upload" title="찾아보기"
																			style="width: 70px; height: 30px; color: #fff; border: 1px solid #979797; background: #979797; text-align: center;">
																			<em>찾아보기</em>

																		</button>
																		<input type="file" id="attach1" name="upfiles[]"
																			class="file" title="찾아보기"
																			style="position: absolute; top: 0; right: 76px; height: 31px; cursor: pointer; opacity: 0;">
																		<span class="btn_gray_list">
																			<button type="button" id="addUploadBtn"
																				class="btn_gray_big" style="width: 62px;">
																				<span>+추가</span>
																			</button>
																		</span>
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
										<button type="submit" class="btn_write_ok">
											<strong>저장</strong>
										</button>
									</div>
								</div>

								<!--
                            <a href="#this" class="btn" id="write">작성하기</a>
                            <a href="#this" class="btn" id="list">목록으로</a>-->
							</form>
						</div>
						<!--//board_zone_cont-->
					</div>
					<!--//board_zone_sec-->

					<script type="text/javascript">
                        var cfgUploadFl = 'y';
                        var cfgEditorFl = 'y';
                        var bdId = 'oto';
                        var bdSno = '';
                        gd_select_email_domain('writerEmail');
                    </script>
					<script type="text/template" class="template">
                     <%--    <div class="file_upload_sec">
		<label for="attach<%//=idx%>">
			<input type="text" class="file_text" title="파일 첨부하기" readonly="readonly">
		</label>
		<div class="btn_upload_box">
			<button type="button" class="btn_upload" title="찾아보기"><em>찾아보기</em></button>
			<input type="file" id="attach<%//=idx%>" name="upfiles[]" class="file" title="찾아보기"/>
			<span class="btn_gray_list"><button type="button" class="btn_gray_big" onclick="gd_remove_upload(this)"><span>- 삭제</span></button></span>
		</div>
	</div> --%>
</script>
					<div id="addGoodsLayer" class="dn"></div>
					<div id="addOrderLayer" class="dn"></div>




				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>