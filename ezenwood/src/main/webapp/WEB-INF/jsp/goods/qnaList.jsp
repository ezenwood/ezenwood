<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <link href="css/reset.css" type="text/css" rel="stylesheet">
    <link href="css/layout.css" type="text/css" rel="stylesheet">
    <link href="css/board.css" type="text/css" rel="stylesheet">
    <link href="css/common.css" type="text/css" rel="stylesheet">
    <link href="css/button.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="js/sister_js/gd_board_common.js"></script>
    

</head>

<body>

    <div id="container">
        <div id="contents">
            <div class="sub_content">
                <div class="content">
                    <div class="board_zone_sec">
                        <div class="board_zone_tit">
                            <h2>REVIEW</h2>
                        </div>

                        <div class="board_zone_cont">
                            <div class="board_zone_list" align="center">
                                
                                    <table class="board_list_table" style="width: 100%">
                                        <colgroup>
                                            <col style="width: 6%" />
                                            <!--번호-->
                                            <col>
                                            <!--제목-->
                                            <col style="width: 15%" />
                                            <!--작성자-->
                                            <col style="width: 15%" />
                                            <!--문의 상태-->
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>문의날짜</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>번호</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:choose>
                                                <c:when test="${fn:length(list) > 0}">
                                                    <c:forEach items="${list }" var="row">
                                                        <tr>
                                                            <td>${row.REVIEW_DATE }</td>
                                                            <td class="title">
                                                                <a href="#this" name="title">${row.REVIEW_TITLE }</a>
                                                                <input type="hidden" id="IDX" value="${row.IDX }">
                                                            </td>
                                                            <td>${row.REVIEW_WRITER }</td>
                                                            <td>${row.REVIEW_NUM }</td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td colspan="4">조회된 결과가 없습니다.</td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="pagination">
                                    <ul>
                                        <li class="on"><span>1</span></li>
                                        <li class="btn_page btn_page_next">
                                            <a aria-label="Next" href="#">
                                                <img src="css/img/icon_arrow_page_r.png" class="img-page-arrow">
                                                다음
                                            </a>
                                        </li>
                                        <li class="btn_page btn_page_last">
                                            <a aria-label="Last" href="#">
                                                <img src="css/img/icon_arrow_page_rr.png" class="img-page-arrow">
                                                맨뒤
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="btn_right_box">
                                <button type="button" class="btn_write" onclick="gd_btn_write('goodsreview)">
                                    작성하기
                                </button>
                            </div>
                        </div>

                    </div>
                  
                </div>
                
            </div>
        </div>
    
</body>

</html>
