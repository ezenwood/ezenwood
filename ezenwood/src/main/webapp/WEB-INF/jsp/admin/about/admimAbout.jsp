<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aboutDetail</title>
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
                            <h2>어바웃</h2>
                        </div>

                        <div class="board_zone_cont">
                            <div class="board_zone_view">
                                <div class="board_view_tit">
                                    <h3>Q.제목</h3>
                                </div>
                                <div class="board_view_info">
                                    <span class="view_info_ipdp">
                                        <strong>작성자 이름 </strong>
                                    </span>
                                    <span class="view_info_day">
                                        <em><strong>날짜</strong></em>
                                    </span>
                                </div>
                                <!--//board_view_info-->
                           
                                <div class="board_view_content" style="border-bottom: 1px solid #dbdbdb;">
                                    <div class="seem_cont">
                                        <div style="margin: 10px 0 10px 0">
                                            <img style="max-width: 700px">
                                            
                                            <c:forEach var="list" items="fqboardlist">
                                                <p align="center">A.자주묻는질문content</p>
                                            </c:forEach>
                                           
                                        </div>
                                    </div>
                                    <!--//seem_cont-->
                                </div>
                              
                                 
                                
                                <!--//board_view_content-->
                              
                            <!--//board_zone_view-->
                          
                        </div>
                          <div style="text-align: center">
                          <br>
					
						<button type="button" class="btn btn-success" onClick="location.href='/about/aboutWriteForm.jsp'">수정</button>
						<button type="button" onclick="aboutDelete();"
					class="btn btn-primary">삭제</button>
                        <!--//board_zone_cont-->
                    </div>
                </div>
            </div>
        </div>
       
    </div>
    		
</div>
</body>
</html>
