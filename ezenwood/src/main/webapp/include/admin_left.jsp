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
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0;background-color:#337AB7">
 <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav in" id="side-menu">
                        
                        <li>
                            <a href="/pet/admin/admin.dog" style="background: #e7e7e7;border-bottom: 1px solid #F8F8F8;" class="active"><i class="fa fa-dashboard fa-fw"></i>관리자홈</a>
                        </li>
						<li>
                            <a href="/pet/main.dog" style="background: #e7e7e7;border-bottom: 1px solid #F8F8F8;"><i class="fa fa-dashboard fa-fw"></i>쇼핑몰로 이동</a>
                        </li>
						<li class="active">
                            <a href="#" style="background: #e7e7e7;"><i class="fa fa-bar-chart-o fa-fw"></i>상품관리<span class="fa arrow">▼</span></a>
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/pet/admin/goodsadminList.dog">- 상품목록</a>
                                </li>
                                <li>
                                    <a href="/pet/admin/goodsInsertForm.dog">- 상품등록</a>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="#" style="background: #e7e7e7;"><i class="fa fa-dashboard fa-fw"></i>회원관리<span class="fa arrow">▼</span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/pet/admin/memberadminList.dog">- 회원목록</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>   
                                             
                        <li class="active">
                            <a href="#" style="background: #e7e7e7;"><i class="fa fa-bar-chart-o fa-fw"></i>주문관리<span class="fa arrow">▼</span></a>
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/pet/admin/adminOrderAllList.dog">- 주문목록</a>
                                </li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="#" style="background: #e7e7e7;"><i class="fa fa-bar-chart-o fa-fw"></i>게시판관리<span class="fa arrow">▼</span></a>
							 <ul class="nav nav-second-level">
                                <li>
                                    <a href="/pet/admin/adminnoticeList.dog">- 공지사항</a>
                                </li>
                                <li>
                                    <a href="/pet/admin/adminpet_imgList.dog">- 마이펫</a>
                                </li>
                                <li>
                                    <a href="/pet/admin/adminpetList.dog">- 분양</a>
                                </li>
                                <li>
                                    <a href="/pet/admin/adminQnAList.dog">- Q&amp;A</a>
                                </li>
                                <li>
                                    <a href="/pet/admin/adminreviewList.dog">- 구매후기</a>
                                </li>
                            </ul>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
</body>
</html>