<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
<title>Admin_header</title>
<link rel="stylesheet" href="/ezenwood/css/mypage.css">
<!--     <link rel="stylesheet" href="/ezenwood/css/admin_layout.css"> -->
    <link rel="stylesheet" href="/ezenwood/css/bootstrapadmin.min.css">
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

 <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav in" id="side-menu">
                        
                        <li>
                            <a href="/ezenwood/admin" style="background: #e7e7e7;border-bottom: 1px solid #F8F8F8;" class="active"><i class="fa fa-dashboard fa-fw"></i>관리자홈</a>
                        </li>
						<li>
                            <a href="/ezenwood/main" style="background: #e7e7e7;border-bottom: 1px solid #F8F8F8;"><i class="fa fa-dashboard fa-fw"></i>쇼핑몰로 이동</a>
                        </li>
						<li class="active">
                            <a href="#" style="background: #e7e7e7;"><i class="fa fa-bar-chart-o fa-fw"></i>상품관리<span class="fa arrow">▼</span></a>
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/ezenwood/admin/goods">- 상품목록</a>
                                </li>
                                <li>
                                    <a href="/ezenwood/admin/goods/write">- 상품등록</a>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="#" style="background: #e7e7e7;"><i class="fa fa-dashboard fa-fw"></i>회원관리<span class="fa arrow">▼</span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/ezenwood/admin/member">- 회원목록</a>
                                </li>
                                <li>
                                    <a href="/ezenwood/admin/delmember">- 탈퇴회원목록</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>   
                                             
                        <li class="active">
                            <a href="#" style="background: #e7e7e7;"><i class="fa fa-bar-chart-o fa-fw"></i>주문관리<span class="fa arrow">▼</span></a>
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/ezenwood/admin/order">- 주문목록</a>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="#" style="background: #e7e7e7;"><i class="fa fa-bar-chart-o fa-fw"></i>게시판관리<span class="fa arrow">▼</span></a>
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/ezenwood/admin/notice/1">- 공지사항</a>
                                </li>
                                <li>
                                    <a href="/ezenwood/admin/qna/1">- Q&amp;A</a>
                                </li>
                                <li>
                                    <a href="/ezenwood/admin/review/1">- 리뷰</a>
                                </li>
                                <li>
                                    <a href="/ezenwood/admin/oto/1">- 1:1문의</a>
                                </li>
                                <li>
                                    <a href="/ezenwood/admin/fqlist/1">- 자주묻는질문</a>
                                </li>
                                <li>
                                    <a href="/ezenwood/admin/about">- 어바웃</a>
                                </li>
                            </ul>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        
</body>
</html>