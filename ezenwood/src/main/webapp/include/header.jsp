<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>test_header</title>
   
    <link href="/ezenwood/css/reset2.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/common2.css" type="text/css" rel="stylesheet">
   
    <script>
        function home_url() {
            location.href = '/';
        }

    </script>

    <script>
        $(window).scroll(function() {
            if ($(window).scrollTop() >= 143) {
                $('#header_wrap').addClass('headerFix');
            } else {
                $('#header_wrap').removeClass('headerFix');
            }
        });

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
                                <img src="/ezenwood/resource/image/메인 로고.png">
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
                                            <a href="#">TABLE</a>
                                        </li>
                                        <li style="width: 150px;">
                                            <a href="#">CHAIR</a>
                                        </li>
                                        <li style="width: 150px;">
                                            <a href="#">BED</a>
                                        </li>
                                        <li style="width: 150px;">
                                            <a href="#">SOFA</a>
                                        </li>
                                        <li style="width: 150px;">
                                            <a href="#">CHEST</a>
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
                            <li>
                                <a href="#">LOGIN</a>
                            </li>
                            <li>
                                <a href="#">SIGN IN</a>
                            </li>
                            <li>
                                <a href="#">CART</a>
                            </li>
                        </ul>
                    </div>

                    <div class="gnb_sub_bg"></div>


                </div>

            </div>

        </div>
    </div>
</body>

</html>
	