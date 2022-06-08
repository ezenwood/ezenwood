<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeDetail</title>
 <link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/admin_layout.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/admin_board.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
     <link href="/ezenwood/css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
</head>

<body>
	  <div id="container">
        <div id="contents">
            <div class="sub_content">
                <div class="content">
                    <div class="board_zone_sec">
                    <%@include file ="/include/admin_header.jsp" %>
					<%@include file ="/include/admin_left.jsp" %>
<div id="page-wrapper" style="min-height: 703px;">

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
                                <div class="board_view_content" style="border-bottom: 1px solid #dbdbdb;">
                                    <div class="seem_cont">
                                        <div style="margin: 10px 0 10px 0">
                                            <img style="max-width: 700px">
                                            
                                            <c:forEach var="list" items="noticeboardlist">
                                                <p align="center">공지사항content</p>
                                            </c:forEach>
                                           
                                        </div>
                                    </div>
                                    <!--//seem_cont-->
                                </div>
                                <div class="board_view_content" style="border-bottom: 1px solid #dbdbdb;">
                                   <c:forEach var="image" items="image">
                                                <div style="text-align: center">
                                                    <img src="/ezenwood/resource/image/pet1.jpg" alt="Missing Image">
                                                </div>
                                            </c:forEach>
                                </div>
                                 
                                
                                <!--//board_view_content-->
                              
                            <!--//board_zone_view-->
                          
                        </div>
                          <div style="text-align: center">
                          <br>
						<button type="submit" class="btn btn-success">상품등록</button>
						<button type="reset" class="btn btn-default">작성취소</button>	
			</div>
                        <!--//board_zone_cont-->
                    </div>
                </div>
            </div>
        </div>
       
    </div>
    		
</div>
</body>
</html>
