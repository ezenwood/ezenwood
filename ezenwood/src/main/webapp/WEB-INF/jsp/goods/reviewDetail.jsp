<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                   <h3>${reviewMap.REVIEW_TITLE }</h3>
                               </div>
                                <div class="board_view_attach">
                                    <strong>작성자</strong>
                                    <span class="attach_list">
                                        ${reviewMap.REVIEW_WRITER }
                                    </span>
                                </div> <div class="board_view_attach">
                                    <strong>작성일</strong>
                                    <span class="attach_list">
                                        <fmt:formatDate value="${reviewMap.REVIEW_DATE }" type="both" dateStyle="medium" timeStyle="medium" />
                                    </span>
                                </div>
                                <!--//board_view_info-->
                                
                                <div class="board_view_content">
                                    <div class="view_goods_select">
                                        <div class="view_goods_select_item">
                                            <span class="view_select_item_img">
                                                <a href="상품 주소" target="_blank">
                                                    <img src="/ezenwood/resource/image/${GOODS_SUBIMAGE }">
                                                </a>
                                            </span>
                                            <span class="view_select_item_info">
                                                <em>${reviewMap.goodsMap.GOODS_TITLE }</em>
                                                <strong>${reviewMap.goodsMap.GOODS_PRICE }</strong>
                                            </span>
                                        </div>
                                        <!--//view_goods_select_item-->
                                    </div>
                                    <!--//view_goods_select-->
                                    <div class="seem_cont">
                                        <div style="margin: 10px 0 10px 0">
                                        <c:if test="${reviewMap.REVIEW_IMAGE !=null }">
                                         <img  src="/ezenwood/resource/image/${reviewMap.REVIEW_IMAGE}"  style="max-width: 700px">
                                        </c:if>
                                           
                                            ${reviewMap.REVIEW_CONTENT }
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
                                <button type="button" class="btn_board_list" onclick="location.href='/ezenwood/goods/review?GOODS_NUM=${reviewMap.goodsMap.GOODS_NUM}&p=1'">
                                    <strong>목록</strong>
                                </button>
                                <button type="button" class="btn_board_list" onclick="deleteReview()">
                                    <strong>삭제</strong>
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
<script type="text/javascript">
function deleteReview() {
	if(!confirm("정말로 삭제하시겠습니까")){
		//삭제안함
	}else{
		location.href="/ezenwood/goods/review/delete?GOODS_NUM=${reviewMap.goodsMap.GOODS_NUM}&REVIEW_NUM=${reviewMap.REVIEW_NUM}"
	}
	
}
</script>
</html>