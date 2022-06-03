<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">

var onComment = function(){
	var form = $('.commentForm')[0];
	form.action = 'QnAcommWrite.dog';
	if(form.commentt.value == ""){
		alert("내용을 입력해주세요");
	}else{
		form.submit();
	}
	
	 //넘기는 부분
	}
function qnaDelete() {
	if(confirm("삭제 하시겠습니까?") == true){
		location.href='QnADelete.dog?no=${QnAModel.no}';
	}else {
		return;
	}
}

function qnaModify() {
	if(confirm("수정 하시겠습니까?") == true){
	location.href='QnAModify.dog?no=${QnAModel.no}';
	}else {
		return;
	}
}
function qnacommDelete(num) {
	if(confirm("댓글을 삭제 하시겠습니까?") == true){
		location.href='QnAcommDelete.dog?comment_num='+ num+'&no=${QnAModel.no}';
	}else {
		return;
	}
}

	

</script>
<script language="javascript"> 


//글자수 제한 체크 
function fnChkByte(obj, maxByte){
	var str = obj.value;
	var str_len = str.length;

	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";

	for(var i=0; i<str_len; i++){
	one_char = str.charAt(i);
	if(escape(one_char).length > 4){
	    rbyte += 2;                                         //한글2Byte
	}else{
    	rbyte++;                                            //영문 등 나머지 1Byte
	}

	if(rbyte <= maxByte){
	    rlen = i+1;                                          //return할 문자열 갯수
	}
}

	if(rbyte > maxByte){
    	alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
    	str2 = str.substr(0,rlen);                                  //문자열 자르기
    	obj.value = str2;
    	fnChkByte(obj, maxByte);
	}else{
    	document.getElementById('byteInfo').innerText = rbyte;
	}
}

 
</script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css"
	rel="stylesheet">
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<!-- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.contents-wrap {
	margin: 30px 0 0 0;
	min-height: 500px;
}

.contents {
	margin: 60px 0 0 0;
}

.recode-wrap {
	text-align: right;
	color: #888;
}

.hit-wrap {
	color: #888;
	margin: 10px 0;
}

.viewForm {
	margin: 20px 0 0 0;
}
</style>
<title>Q&A</title>
</head>
<body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
		<div id="page-wrapper" style="min-height: 703px;">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">Q&A 상세보기</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

						<div class="dataTable_wrapper">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr class="danger" style="background-color: #fff">
										<th width="100">글제목</th>
										<td colspan=3>${qna_title}</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<!-- 작성자 -->
										<th>작성자</th>
										<td><strong> ${qna_writer} </strong></td>
										<td><strong>작성일</strong></td>
										<td><fmt:formatDate value="${qna_date}"
												pattern="yyyy.MM.dd" /></td>

									</tr>

									<tr>
										<!-- 글내용 -->
										<th>글내용</th>
										<td colspan=3 height=600 style="padding: 0px !important;">
											<br />${qna_content}
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="menu-wrap" style="text-align: center">
					&nbsp;&nbsp;
					<button type="button" onclick="qnaDelete();"
						class="btn btn-primary" style="">수정</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="qnaDelete();"
						class="btn btn-primary">삭제</button>

					<input type="button" onclick="location.href='QnAList.dog'"
						value="목록" class="btn btn-primary" style="float: right" /> <br />
					<br /> <br /> <br />
				</div>
				<!-- 댓글쓰는 창	 -->
				<div class="inner">
					<form class="commentForm" method="post"
						onsubmit="return validation();">
						<input type="hidden" name="content_num" value="${QnAModel.no}" />
						<input type="hidden" name="commenter" value="${session_member_id}" />


						<div class="reply_grp" style="text-align:center">
							<div class="reply_form">
								<div class="reply_write" style="text-align:center">
									<div class="textarea_grp" style="width: 1000px; display:inline-block;">
										<!-- 댓글 쓰는 창과 글자 수 제한-->
										<textarea name="commentt" style="width: 885px; height: 55px;"
											onKeyUp="javascript:fnChkByte(this,'500')"></textarea>
										<button type="button" class="btn1 btn-primary1"
											onclick="onComment()">입력</button>
										<div style="margin-bottom: 10px;">
											<br />&nbsp;&nbsp;&nbsp;<span id="byteInfo">0</span>/500Byte
										</div>


									</div>
								</div>
							</div>

							<!-- 댓글 차례로 보여주는 창 -->
							<c:forEach var="list" items="${CommList}">
								<div style="margin-bottom: 50px;">
									<div class="reply_view">
										<div class="reply_tit">
											<p class="tit">
												<strong>${list.commenter}</strong>님
												<fmt:formatDate value="${list.reg_date}" pattern="yy.MM.dd"></fmt:formatDate>
												<span class="ip"></span>
											</p>
											<!-- 입력되어 있는 작성자와 아이디가 같거나, 아이디가 admin 일때만 삭제  창을 띄운다. -->
											<c:if
												test="${session_member_id == list.commenter || session_member_id == 'admin'}">
												<td align="left">
													<%-- <input type="button" onclick="qnacommDelete(${list.comment_num},${session_member_id})&QnAcommUpdate2(${list.content_num})"  value="삭제" class="btn btnC_01 btnP_02"/> --%>
													<a
													href="QnAcommDelete.dog?comment_num=${list.comment_num}&no=${QnAModel.no}&commenter=${list.commenter}">
														<input type="button"
														onclick="qnacommDelete(${list.comment_num})" value="삭제"
														class="btn btnC_01 btnP_02" />
												</a>
												</td>
												<!-- 						<span class="btn btnC_05 reply_btn">	삭제</span> -->

											</c:if>
										</div>

										<div class="reply_cts">
											<p>${list.commentt}</p>
											<br />
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</form>
					<c:if test="${fn:length(CommList) le 0}">
						<br />
						<center>등록된 답변이 없습니다</center>
						<br />
					</c:if>



				</div>
			</div>
		</div>
	</div>




</body>
</html>