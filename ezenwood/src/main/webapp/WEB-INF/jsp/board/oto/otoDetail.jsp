<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<meta charset="UTF-8">
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/qnaDetail.css" type="text/css"
	rel="stylesheet">
<title>이젠 우드</title>
<script type="text/javascript">
    
    //글 삭제
    function fn_del() {
 
        if (confirm("정말 삭제하시겠습니까??") == true) { //확인
            location.href = "/board/oto/otoBoard/{otonum}/otoDelete"+${map.otonum};
            console.log('success');
        } else {
            console.log('fail');
            return false;
        }
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
							<div class="board_zone_view">
								<div class="board_view_tit">
									<h3>제목</h3>
								</div>

								<form id="BoardDelForm" name="" action="#" method="post"
									target="_self" enctype="multipart/form-data">
									<input id="no" name="no" value="#" type="hidden"> <input
										id="bulletin_no" name="bulletin_no" value="#" type="hidden">
									<input id="board_no" name="board_no" value="#" type="hidden">
									<input id="MEMBER_ID" name="MEMBER_ID" value=""
										type="hidden"> <input id="list_url" name="list_url"
										value="#" type="hidden"> <input id="bdf_modify_url"
										name="bdf_modify_url" value="#" type="hidden"> <input
										id="bdf_del_url" name="bdf_del_url" value="#" type="hidden">
									<input id="bdf_action_type" name="bdf_action_type" value=""
										type="hidden">
									<div
										class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4">

										<div class="ec-base-table typeWrite ">
											<table border="0" summary="">

												<colgroup>
													<col style="width: 230px;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th scope="row">제목</th>
														<td>${OTOMap.ONETOONE_TITLE }</td>
													</tr>
													<tr>
														<th scope="row">작성자</th>
														<td>${OTOMap.ONETOONE_MEMBER_ID}</td>
													</tr>
													<tr>
														<td colspan="2">
															<ul class="etcArea">
																<li class=""><strong>작성일</strong> 
																<span class="txtNum"><fmt:formatDate value="${OTOMap.ONETOONE_DATE}" type="both" dateStyle="medium" timeStyle="medium"/></span></li>
															</ul>
															<div class="detail">
																<div class="fr-view fr-view-article">
																	<!--<c:if test="${OTOMap.OTO_IMAGE != null}">
																	/<img alt="/ezenwood/resource/image/${OTOMap.OTO_IMAGE}">
																	</c:if>-->
																	<br>${OTOMap.ONETOONE_CONTENT}
																</div>
															</div>
														</td>
													</tr>
													<tr class="attach displaynone">
														<th scope="row">첨부파일</th>
														<td></td>
													</tr>
													<tr class=" displaynone">
														<th scope="row">비밀번호</th>
														<td><input id="password" name="password" fw-filter=""
															fw-label="비밀번호" fw-msg=""
															onkeydown="if (event.keyCode == 13 || event.which == 13) { return false; }"
															value="" type="password"> <span
															class="ec-base-help txtInfo">삭제하려면 비밀번호를 입력하세요.</span></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="ec-base-button ">
											<span class="gLeft"> <a href="/ezenwood/board/oto"
												class="btnNormalFix sizeS">목록</a>
											</span> <span class="gRight">  
												<button id="button1" onclick="fn_del();" class="btnEmFix sizeS">삭제</button>

											</span>
										</div>
									</div>
								</form>

								<div
									class="xans-element- xans-board xans-board-commentpackage-4 xans-board-commentpackage xans-board-4 ">
									<div
										class="xans-element- xans-board xans-board-commentlist-4 xans-board-commentlist xans-board-4">

										<ul class="boardComment" style="list-style: none">
											<li class="first  xans-record-">
												<div class="commentTop">
													<strong class="name"> 이젠 우드</strong> 
													<span class="date">${OTOMap.Answer.ONETOONE_DATE}</span>
												</div> <!--<span class="button">
                                                    <a href="javascript:;" class="btnNormal displaynone" onclick="BOARD_COMMENT.comment_update('163363','144433',this);">수정</a>
                                                    <a href="javascript:;" class="btnNormal displaynone" onclick="BOARD_COMMENT.comment_delete('/board/product/comment_del.html?board_no=6&amp;no=163363&amp;comment_no=144433&amp;page=&amp;return_url=/board/product/read.html');"><i class="icoDelete"></i> 삭제</a>
                                                    <a href="javascript:;" onclick="" class="btnNormal displaynone">댓글 <img src="//img.echosting.cafe24.com/skin/base/common/btn_icon_reply.gif" alt=""></a>
                                                </span>-->
												<div class="comment">

													<span id="comment_contents144433">${OTOMap.Answer.ONETOONE_CONTENT}</span>
												</div>
											</li>
										</ul>

									</div>

									<form id="commentForm" name="" action="#" method="post"
										target="_self" enctype="multipart/form-data"
										style="display: none;">
										<input id="board_no" name="board_no" value="#" type="hidden">
										<input id="no" name="no" value="#" type="hidden"> <input
											id="#" name="comment_no" value="" type="hidden"> <input
											id="member_id" name="member_id" value="" type="hidden">
										<div
											class="xans-element- xans-board xans-board-commentform-4 xans-board-commentform xans-board-4 ">
											<fieldset>
												<legend>댓글 수정</legend>
												<p>
													비밀번호 : <input id="comment_password" name="comment_password"
														fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value=""
														type="password"> <span class="secret displaynone"><label>비밀댓글</label></span>
												</p>
												<div class="view">
													<textarea id="comment_modify" name="comment_modify"
														fw-filter="isFill" fw-label="댓글내용" fw-msg=""></textarea>
													<span class="submit"> <a href="#none"
														class="btnEm sizeL"
														onclick="BOARD_COMMENT.comment_update_ok('commentForm');">수정</a>
														<a href="#none" class="btnNormal sizeL"
														onclick="BOARD_COMMENT.comment_cancel_ok('commentForm');">취소</a>
													</span>
												</div>
												<p class="displaynone">/ byte</p>
											</fieldset>
										</div>
									</form>
									<form id="commentSecretForm" name="" action="#" method="post"
										target="_self" enctype="multipart/form-data"
										style="display: none;">
										<input id="board_no" name="board_no" value="#" type="hidden">
										<input id="comment_no" name="comment_no" value=""
											type="hidden"> <input id="pass_check"
											name="pass_check" value="F" type="hidden">
										<div
											class="xans-element- xans-board xans-board-commentformsecret-1002 xans-board-commentformsecret xans-board-1002 ">
											<p>
												비밀번호 : <input id="secure_password" name="secure_password"
													fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value=""
													type="password"> <a href="#none" class="btnNormal"
													onclick="BOARD_COMMENT.show_secret_comment('commentSecretForm');">확인</a>
												<a href="#none" class="btnNormal"
													onclick="BOARD_COMMENT.hide_secret_comment_form('commentSecretForm');">취소</a>
											</p>
										</div>
									</form>

								</div>


							</div>
						</div>
						<!--//board_zone_cont-->
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="/include/footer.jsp"%>

</body>

</html>
