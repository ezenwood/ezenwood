<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
 <link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">
    <title>이젠 우드</title>
</head>

<body>
	<%@include file="/include/header.jsp"%>
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
                                    <h3>${noticeMap.NOTICE_TITLE }</h3>
                                </div>
                                <div class="board_view_info">
                                    <span class="view_info_ipdp">
                                        <strong>이젠 우드</strong>
                                    </span>
                                    <span class="view_info_day">
                                        <em><fmt:formatDate value="${noticeMap.NOTICE_DATE}" type="both" dateStyle="medium" timeStyle="medium"/></em>
                                    </span>
                                </div>
                                <!--//board_view_info-->
                                <div class="board_view_attach">
                                    <strong>첨부파일</strong>
                                    <span class="attach_list">
                                        <a href="/ezenwood/resource/image/${noticeMap.NOTICE_IMAGE}">파일 이름</a>
                                    </span>
                                </div>
                                <div class="board_view_content">
                                    <div class="seem_cont">                                        
                                        <div style="margin: 10px 0 10px 0">
<%--                                          <c:if test="${noticeMap.NOTICE_IMAGE !=null }">
                                         <img  src="/ezenwood/resource/image/${noticeMap.NOTICE_IMAGE}"  style="max-width: 700px">
                                        </c:if> --%>
                                           	${noticeMap.NOTICE_CONTENT }
                                        </div>
                                        <tr class="attach displaynone">
														<th scope="row">이미지파일</th>
														<td><img src="/ezenwood/resource/image/${noticeMap.NOTICE_IMAGE}" alt="Missing Image"></td>
                                    </div>
                                    <!--//seem_cont-->
                                </div>
                                <!--//board_view_content-->
                                
                            </div>
                            <!--//board_zone_view-->
                            <div class="btn_right_box">
                                <span class="gLeft"> <a href="/ezenwood/board/notice"
												class="btnNormalFix sizeS">목록</a>
                                </span>
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
    
</body>-->
	<%@include file="/include/footer.jsp"%>
</html>
