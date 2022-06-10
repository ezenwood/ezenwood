<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AdminFqWrite</title>
    <link href="css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
</head>
<body>
<!-- 메뉴 시작 -->
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
<div id="page-wrapper" style="min-height: 703px;">
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">자주묻는질문등록</h1>
</div>

<div class="row" style="padding-left:15px;width:900px;">
	<div class="panel panel-default">
		<div class="panel-heading">자주묻는질문 등록페이지입니다.</div>
			<div class="panel-body">
						
                        <div class="form-group">
                            
                            <input type="text" class="form-control" path="question_title" placeholder="제목을 입력하세요."  style="width:40%;">
                        </div>
                        
                        
                        <div class="form-group" >
                            
							<textarea name="texts" rows="7" cols="40" wrap="virtual" path="question_content" placeholder="내용을 입력해주세요" ></textarea>
                          </div>
                            <div class="form-group">
                       <label>중요도</label><input type="number" class="form-control" path="question_step" placeholder="중요도를 입력해주세요" style="width:30%;">
                               </div>
                                       
                  
						<button type="submit" class="btn btn-success">등록</button>
						<button type="reset" class="btn btn-default">작성취소</button>					
			</div>
	</div>
</div>
</div>



</body>
</html>