<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이젠 우드</title>
<link rel="shortcut icon"
	href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/qnaDetail.css" type="text/css"
	rel="stylesheet">
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
							<h2>QNA</h2>
						</div>

						<div class="board_zone_cont">
							<div class="board_zone_view">



								<div
									class="xans-element- xans-board xans-board-product-4 xans-board-product xans-board-4 ec-base-box typeProduct ">
									<p class="thumbnail">
										<a href="/ezenwood/goods?idx=${QNAMap.GoodsMap.GOODS_NUM }">
											<img src="/ezenwood/resource/image/${QNAMap.GOODS_SUBIMAGE }"
											alt="">
										</a>
									</p>
									<div class="information">


										<h3>
											<a href="/ezenwood/goods?idx=${QNAMap.GoodsMap.GOODS_NUM }">${QNAMap.GoodsMap.GOODS_TITLE }</a>
										</h3>
										<p class="price">${QNAMap.GoodsMap.GOODS_PRICE }&nbsp;won<span
												id="sPrdTaxText"></span>
										</p>
										<p class="button">
											<a href="/ezenwood/goods?idx=${QNAMap.GoodsMap.GOODS_NUM }"
												class="btnEm" title="새창으로 이동">상품 상세보기</a>
										</p>

									</div>
								</div>

								<form id="BoardDelForm" name="" action="#" method="post"
									target="_self" enctype="multipart/form-data">

									<div class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4">

										<div class="ec-base-table typeWrite ">
											<table border="0" summary="">
												<caption>상품 게시판 상세</caption>
												<colgroup>
													<col style="width: 230px;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th scope="row">제목</th>
														<td>${QNAMap.QNA_TITLE }</td>
													</tr>
													<tr>
														<th scope="row">작성자</th>
														<%-- <td> ${QNAMap.QNA_WRITER } </td> --%>
														<td>${QNAMap.MEMBER_NAME}</td>
													</tr>
													<tr>
														<th scope="row">작성일</th>
														<td><span class="txtNum"><fmt:formatDate
																	value="${QNAMap.QNA_DATE }" type="both"
																	dateStyle="medium" timeStyle="medium" /> </span></td>
													</tr>
													<tr>
														<td colspan="2">

															<div class="detail">
																<div class="fr-view fr-view-article">
																	<c:if test="${QNAMap.QNA_IMAGE != null }">
																		<img alt="-"
																			src="/ezenwood/resource/image/${QNAMap.QNA_IMAGE }">
																	</c:if>

																	<br>${QNAMap.QNA_CONTENT }</div>
															</div>
														</td>
													</tr>

												</tbody>
											</table>
										</div>
										<div class="ec-base-button ">
											<span class="gLeft"> <a
												href="/ezenwood/goods/qna?GOODS_NUM=${QNAMap.GoodsMap.GOODS_NUM  }&p=1"
												class="btnNormalFix sizeS">목록</a>
											</span> <span class="gRight"> <a href="#"
												onclick="qnaDelete()" class="btnNormalFix sizeS ">삭제</a> <!--  <a href="/ezenwood/goods/qna/update?QNA_NUM=${QNAMap.QNA_NUM }" class="btnEmFix sizeS ">수정</a> -->

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
													<strong class="name"> 이젠 우드</strong> <span class="date">${QNAMap.Answer.QNA_DATE }</span>
												</div> <!--<span class="button">
                                                    <a href="javascript:;" class="btnNormal displaynone" onclick="BOARD_COMMENT.comment_update('163363','144433',this);">수정</a>
                                                    <a href="javascript:;" class="btnNormal displaynone" onclick="BOARD_COMMENT.comment_delete('/board/product/comment_del.html?board_no=6&amp;no=163363&amp;comment_no=144433&amp;page=&amp;return_url=/board/product/read.html');"><i class="icoDelete"></i> 삭제</a>
                                                    <a href="javascript:;" onclick="" class="btnNormal displaynone">댓글 <img src="//img.echosting.cafe24.com/skin/base/common/btn_icon_reply.gif" alt=""></a>
                                                </span>-->
												<div class="comment">

													<span id="comment_contents144433">${QNAMap.Answer.QNA_CONTENT }</span>
												</div>
											</li>
										</ul>

									</div>

									<form id="commentForm" name=""
										action="/exec/front/Board/CommentUpdate/6" method="post"
										target="_self" enctype="multipart/form-data"
										style="display: none;">
										<input id="board_no" name="board_no" value="6" type="hidden">
										<input id="no" name="no" value="163363" type="hidden">
										<input id="comment_no" name="comment_no" value=""
											type="hidden"> <input id="member_id" name="member_id"
											value="" type="hidden">
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
									<form id="commentSecretForm" name=""
										action="/exec/front/Board/CommentSecret/6" method="post"
										target="_self" enctype="multipart/form-data"
										style="display: none;">
										<input id="board_no" name="board_no" value="6" type="hidden">
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
									<div
										class="xans-element- xans-board xans-board-commentwrite-4 xans-board-commentwrite xans-board-4 ">

									</div>
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
<script type="text/javascript">
function qnaDelete() {
	if(!confirm("정말로 삭제하시겠습니까?")){
		//삭제안함
		return false;
	}else{
		
		location.href="/ezenwood/goods/qna/delete?QNA_NUM=${QNAMap.QNA_NUM }&GOODS_NUM=${QNAMap.GoodsMap.GOODS_NUM}";
	}
	
}
</script>
</html>