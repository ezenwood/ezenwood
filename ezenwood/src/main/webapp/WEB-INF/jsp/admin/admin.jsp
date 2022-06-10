<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/ezenwood/css/mypage.css">
<!--     <link rel="stylesheet" href="/ezenwood/css/admin_layout.css"> -->
    <link rel="stylesheet" href="/ezenwood/css/adminbootstrapadmin.min.css">
        <link rel="stylesheet" href="/ezenwood/css/sb-admin-2.css">

    <style type="text/css">
		@media(min-width:768px) {
   		 #page-wrapper {
        margin: 0 0 0 250px !important;
       
  
    }
}
	</style>

</head>

     <body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
      <div id="page-wrapper" style="min-height: 703px;">
       		
            <!-- 메인container-->
           	 
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">관리자페이지에 오신걸 환영합니다</h1>
</div>
<div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> 관리자 공지사항
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="timeline">
                                <li>
                                    <div class="timeline-badge"><i class="fa fa-check"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">관리자 홈으로 이동</h4>
                                           
                                        </div>
                                        <div class="timeline-body">
                                            <p>관리자 홈으로 가는 바로가기</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-badge warning"><i class="fa fa-credit-card"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">쇼핑몰 홈으로 이동</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>쇼핑몰 홈으로 가는 바로가기</p>                                           
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="timeline-badge danger"><i class="fa fa-bomb"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">상품관리</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>상품목록 이동 - 상품리스트를 볼 수있습니다</p>
                                            <p>상품등록 이동 - 바로상품등록 할 수있습니다</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">회원관리</h4>
                                        </div>
                                        <div class="timeline-body">
                                             <p>회원목록 이동 - 회원목록을 볼수 있습니다</p>
                                             <p>탈퇴회원목록 이동 - 탈퇴회원목록을 볼수 있습니다</p>
                                        </div>
                                    </div>
                                </li>
                                
                                <li>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">주문관리</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>주문목록 - 주문목록 확인및 관리</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">게시판 관리</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>공지사항 - 게시판 등록,수정,삭제 등 관리</p>
                                            <p>Q&amp;A - 게시판 수정,삭제 등 관리</p>
                                            <p>리뷰 - 게시판 삭제 관리</p>
                                            <p>1:1문의 - 게시판 답변,수정,삭제 등 관리</p>
                                            <p>자주묻는질문 - 게시판 등록,수정,삭제 등 관리</p>
                                            <p>어바웃 - 게시판 등록,수정,삭제 등 관리</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- /.panel-body -->
                    </div>
		
	
            <!-- // container -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    



</body>
</body>
</html>