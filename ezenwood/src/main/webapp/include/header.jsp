<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<style>
#logo_kor {
	margin: 0 auto;
	width: 200px;
	height: 44px;
}
</style>
<head>
<meta charset="UTF-8">
<title>test_header</title>

<link href="/ezenwood/css/reset2.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/common2.css" type="text/css" rel="stylesheet">

<script>
	function home_url() {
		location.href = '/ezenwood/main';
	}
</script>


</head>

<body>

    <div id="wrap">
        <div id="header_wrap">
            <div id="header">
                <div class="header_top">
                    <div class="header_top_cont"></div>
                </div>

                <div class="header_search">
                    <div class="header_search_cont">
                        <div class="h1_logo" style="cursor:pointer;" onclick="home_url();">
                            <div id="logo_kor" style="display: block;">
                               <a href="/ezenwood/main"> <img src="/ezenwood/resource/image/메인 로고.png"></a>
                            </div>

                        </div>
                    </div>

                    <style>
                        #logo_kor {
                            margin: 0 auto;
                            width: 200px;
                            height: 44px;
                        }

                    </style>
                </div>

                <div class="header_gnb">
                    <!--좌측 메뉴-->
                    <div class="gnb">
                        <!--상단 카테고리 출력-->
                        <div class="gnb_menu_box" style="z-index: 200">
                            <ul class="depth0 gnb_menu0" style="overflow: visible; height: 100%;">
                                <li class="dropdown">
                                    <a href="javascript:void(0)" class="dropbtn">SHOP</a>
                                    <ul class="depth1, dropdown-content">
                                        <li style="width: 150px;">
                                            <a href="/ezenwood/goods/table/new/1">TABLE</a>
                                        </li>
                                        <li style="width: 150px;">
                                            <a href="/ezenwood/goods/chair/new/1">CHAIR</a>
                                        </li>
                                        <li style="width: 150px;">
                                            <a href="/ezenwood/goods/bed/new/1">BED</a>
                                        </li>
                                        <li style="width: 150px;">
                                            <a href="/ezenwood/goods/sofa/new/1">SOFA</a>
                                        </li>
                                        <li style="width: 150px;">
                                            <a href="/ezenwood/goods/chest/new/1">CHEST</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="javascript:void(0)" class="dropbtn">BOARD</a>
                                    <ul class="depth1, dropdown-content">
                                        <li>
                                            <a href="#">NOTICE</a>
                                        </li>
                                        <li>
                                            <a href="#">1:1</a>
                                        </li>
                                        <li>
                                            <a href="#">QNA</a>
                                        </li>
                                    </ul>
                                </li>

                                <li>
                                    <a href="#">ABOUT</a>
                                </li>
                            </ul>
                        </div>
                        <!--상단 카테고리 출력 끝-->
                    </div>

                    <!--우측 메뉴-->
                    <div class="top_search_mypage">
                    
                        <ul class="top_member_box">
                        <c:choose>
                        <c:when test="${MEMBER_ID == null }">
                        <li>
                                <a href="/ezenwood/member/signin">LOGIN</a>
                            </li>
                            <li>
                                <a href="/ezenwood/member/signup">SIGN UP</a>
                            </li>
                             
                        
                        </c:when>
                        <c:otherwise>
                        <li>
                                <a href="/ezenwood/member/signout">LOGOUT</a>
                            </li>
                            <li>
                                <a href="/ezenwood/mypage/main">MY PAGE</a>
                            </li>
                           <li>
                                <a href="/ezenwood/cart">CART</a>
                            </li>
                        
                        
                        </c:otherwise>
                        </c:choose>
                        
                            
                           
                        </ul>
                    </div>

                    <div class="gnb_sub_bg"></div>


                </div>

            </div>

        </div>
    </div>

</body>

</html>
