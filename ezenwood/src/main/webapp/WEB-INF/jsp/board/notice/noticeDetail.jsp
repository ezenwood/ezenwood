<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
 <link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">
    <title>공지사항_자세히</title>
</head>

<body>
    <div id="container">
        <div id="contents">
            <div class="sub_content">
                <div class="content">
                    <div class="board_zone_sec">
                        <div class="board_zone_tit">
                            <h2>NOTICE</h2>
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
                                    <div class="seem_cont">
                                        <div style="margin: 10px 0 10px 0">
                                            <img style="max-width: 700px">
                                            <p>내용</p>
                                            <c:forEach var="list" items="noticeboardlist">
                                                <p align="center">공지사항content</p>
                                            </c:forEach>
                                            <c:forEach var="image" items="image">
                                                <div style="align-content: center">
                                                    <img>이미지 코드</img>
                                                </div>
                                            </c:forEach>
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

</body>

<!--<c:forEach var="list" items="noticeboarddetail">
					<table style="width: 100%">
						<colgroup>
							<col style="width: 50%">
							<col style="width: 50%">
						</colgroup>
						<tr>
							<th align="center">제목코드</th>
							<th align="center">날짜코드</th>
						</tr>
					</table>
				</c:forEach>
				<c:forEach var="image" items="image">
					<div align="center">
						<img>이미지 코드</img>
					</div>
				</c:forEach>
				<c:forEach var="list" items="noticeboardlist">
					<p align="center">공지사항content</p>
				</c:forEach>
			</div>
			<hr>
			<div align="center">
				<button type="submit" href="목록으로 가는 url">목록</button>
			</div>
		</div>
	</div>
         </div>
    </div>
    
</body>--></html>
