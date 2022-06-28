<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/qnaDetail.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript">
$(document).ready(function() {
	var comSubmit = new ComSubmit();
	var msg = "${msg}";
	if(msg = ""){
	alert(msg);	
	}

	});

function deleteConfirm(){
	
	
	if(confirm("삭제 하시겠습니까?")){
		location.href="/ezenwood/board/oto/otoBoardDel/${OTOMap.ONETOONE_NUM}";
		comSubmit.addParam("otonum", $("ONETOONE_NUM").val());
		comSubmit.submit();
	}else{
		return false;
	}
}
    
</script>
<title>이젠 우드</title>


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
								<!-- <div class="board_view_tit">
									<h3>제목</h3>
								</div> -->

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
														<td>${OTOMap.ONETOONE_TITLE}</td>
													</tr>
													<tr>
														<th scope="row">작성자</th>
														<td>${OTOMap.MEMBER_NAME}</td>
													</tr>
													
													<tr>
														<th scope="row">작성일</th>
														<td><span class="txtNum"><fmt:formatDate
																	value="${OTOMap.ONETOONE_DATE}" type="both"
																	dateStyle="medium" timeStyle="medium" /> </span></td>
													</tr>
													
													<tr>
													<td>								
															<div class="detail">
																<div class="fr-view fr-view-article">
																
																	<br>${OTOMap.ONETOONE_CONTENT}
																</div>
															</div>
														</td>
													</tr>
													
													<tr class="attach displaynone">
														<th scope="row">이미지파일</th>
														<td>
														
                                               
                                                   <c:forEach var="oto" items="${OTOMap.otoImageList}">
                                                   <img src="/ezenwood/resource/image/${oto.IMAGE_STD}" width="300px"
                                             height="300px">
                                             </c:forEach>
                                        
														<%-- <c:if test="${OTOMap.otoImage != null}">
																	<img src="/ezenwood/resource/image/${OTOMap.otoImage}" width="300px"
															height="300px">
																	</c:if> --%>
																	
														</td>
													</tr>
												
												</tbody>
											</table>
										</div>
										<div class="ec-base-button ">
											<span class="gLeft"> <a href="/ezenwood/board/oto/1"
												class="btnNormalFix sizeS">목록</a>
												
											</span> 
											 <c:if test="${MEMBER_NUM==OTOMap.ONETOONE_MEMBER_NUM}"> 
											<span class="gRight">  
												<a href="javascript:void(0);" class="btnEmFix sizeS" onclick="deleteConfirm();">삭제</a>
											
											</span>
											</c:if>
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
												</div> 
												<div class="comment">

													<span id="comment_contents144433">${OTOMap.Answer.ONETOONE_CONTENT}</span>
												</div>
											</li>
										</ul>

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

</html>
