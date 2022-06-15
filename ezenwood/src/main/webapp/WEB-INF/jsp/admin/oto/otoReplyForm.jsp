<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<script type="text/javascript">

function reviewList() {
	if(confirm("목록으로 가시겠습니까?") == true){
		location.href='#';
	}else {
		return;
	}
}

</script>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link href="/ezenwood/css/bootstrapadmin.min.css" rel="stylesheet">
<link href="/ezenwood/css/reset.css" rel="stylesheet">
<!-- <link href="last/css/sb-admin-2.css" rel="stylesheet"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css"> 

   .contents-wrap{margin:30px 0 0 0;min-height: 500px;}
   .contents{ margin: 60px 0 0 0;}
   .recode-wrap{text-align: right; color: #888;}
   .hit-wrap{color:#888; margin: 10px 0;}
   .viewForm{margin: 20px 0 0 0;}
</style>
<title>관리자 페이지 - 1:1 문의 답변</title> 
</head>
<body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
		<div id="page-wrapper" style="min-height: 703px;">
<form:form commandName="otoModel" action="otoReplyWrite" enctype="multipart/form-data"	method="post">
      <div id="page-wrapper">
         <div class="row">
            <div class="col-lg-12">
				<h3 class="page-header">1:1 문의 답변 작성</h3>
				<table class="table table-striped table-bordered table-hover"  id="dataTables-example">
					
					<thead>
						<tr class="danger" >
							<th width="100">글제목</th>
							<td colspan=3>
								<input type="textarea" style=" width: 500px; " name="subject" value="${reviewModel.subject}"/>
								<font color="red"><form:errors path="subject" /></font><!-- 벨리데이터 표시 -->
							</td>
						</tr>
					</thead>
					
					<tbody>
						<tr><!-- 사용자 -->
							<th>사용자 ID</th>
							<td colspan=3>
								<strong>
									${session_member_name }
								</strong>
							</td>
							<input type="hidden" name="name" value="${session_member_name }"/>
							
						</tr>
						
						<tr><!-- 글내용 -->
							<th>글내용</th>
							<td colspan=3 height=600 style="padding: 0px !important;">
							   <textarea  name="content" style=" padding:3px; margin: 1px; width: 100%; height: 98%;"></textarea>
							   <font color="red"><form:errors path="content" /></font><br/><!-- 벨리데이터 표시 -->
							</td>
						</tr>
						
						<tr><!-- 파일 -->
							<th>파일</th>
							<td colspan=3>
								<input type="file" name="file" value="${reviewModel.imagefile_savname}"/>
							</td>	
						</tr>
						
					</tbody>
					
				</table>
			</div>
		</div>
	</div>
	<br>
	<br>
		<!-- 취소 작성완료 버튼 -->
				<div class="menu-wrap" style="text-align: center">
					<button type="button" onclick="this.form.submit();" class="btn btn-primary">작성완료</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="reviewList();" class="btn btn-primary">목록</button>
				</div>
	
			 </form:form>
				
				<br/>
				<br/>
				<br/>
				<br/>
				</div>


</body>
</html>