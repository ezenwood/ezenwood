<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
     <link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">
    
</head>
<body>
    <%@include file ="/include/header.jsp" %>
    <div id="container">
        <div id="contents">
            <div class="sub_content">
                <div class="content">
                    <div class="board_zone_sec">
                        <div class="board_zone_tit">
                            <h2>REVIEW</h2>
                        </div>
                        
                        <div class="board_zone_cont">
                            <div class="board_zone_view">
                               <div class="board_view_tit">
                                   <h3>제목</h3>
                               </div>
                               <div class="board_view_info">
                                   <span class="view_info_ipdp">
                                       <strong>작성자 이름 </strong>
                                   </span>
                                   <span class="view_info_day">
                                      <em>날짜</em>
                                   </span>
                               </div>
                                <!--//board_view_info-->
                                <div class="board_view_attach">
                                    <strong>첨부파일</strong>
                                    <span class="attach_list">
                                        <a href="#">파일 이름</a>
                                    </span>
                                </div>
                                <div class="board_view_content">
                                    <div class="view_goods_select">
                                        <div class="view_goods_select_item">
                                            <span class="view_select_item_img">
                                                <a href="상품 주소" target="_blank">
                                                    <img src="이미지 주소">
                                                </a>
                                            </span>
                                            <span class="view_select_item_info">
                                                <em>상품 이름</em>
                                                <strong>판매 금액</strong>
                                            </span>
                                        </div>
                                        <!--//view_goods_select_item-->
                                    </div>
                                    <!--//view_goods_select-->
                                    <div class="seem_cont">
                                        <div style="margin: 10px 0 10px 0">
                                            <img style="max-width: 700px">
                                            <p>내용</p>
                                        </div>
                                    </div>
                                    <!--//seem_cont-->
                                </div>
                                <!--//board_view_content-->
                                <div class="board_view_comment">
                                    <div class="view_comment js_comment_area">
                                        <div class="view_comment_top">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--//board_zone_view-->
                            <div class="btn_right_box">
                                <button type="button" class="btn_board_list" onclick="gd_btn_list('goodsreview')">
                                    <strong>목록</strong>
                                </button>
                            </div>
                        </div>
                        <!--//board_zone_cont-->
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    <%@include file ="/include/footer.jsp" %>
</body>
</html>