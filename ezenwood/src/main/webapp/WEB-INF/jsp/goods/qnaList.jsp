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
                            <h2>QNA</h2>
                        </div>

                        <div class="board_zone_cont">
                            <div class="board_zone_list">
                                <div class="board_list_qa" align="center">
                                    <table class="board_list_table" style="width: 100%">
                                        <colgroup>
                                            <col style="width: 20%" />
                                            <!--문의 날짜-->
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
                                                <th>문의상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:choose>
                                                <c:when test="${fn:length(list) > 0}">
                                                    <c:forEach items="${list }" var="row">
                                                        <tr>
                                                            <td>${row.QNA_DATE }</td>
                                                            <td class="title">
                                                                <a href="#this" name="title">${row.QNA_TITLE }</a>
                                                                <input type="hidden" id="IDX" value="${row.IDX }">
                                                            </td>
                                                            <td>${row.QNA_WRITER }</td>
                                                            <td>${row.QNA_RE_GB }</td>
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
                                <button type="button" class="btn_write" onclick=""location.href='qnaWrite.html'"">
                                    문의하기
                                </button>
                            </div>
                        </div>

                    </div>
                    <script type="text/javascript" src="js/sister_js/gd_board_list.js" charset="utf-8"></script>
                </div>
                
            </div>
        </div>
    </div>
    <%@include file ="/include/footer.jsp" %>
</body>

</html>