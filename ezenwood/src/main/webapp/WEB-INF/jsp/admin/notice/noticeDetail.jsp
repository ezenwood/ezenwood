<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
                                    <h3>${NTMap.NOTICE_TITLE}</h3>
                                </div>
                                <div class="board_view_info">
                                    <span class="view_info_ipdp">
                                        <strong>${NTMap.NOTICE_NUM}</strong>
                                    </span>
                                    <span class="view_info_day">
                                        <em>${NTMap.NOTICE_DATE}</em>
                                    </span>
                                </div>
                                <!--//board_view_info-->
                                
                                <div class="board_view_content" style="border-bottom: 1px solid #dbdbdb;">
                                    <div class="seem_cont">
                                        <div style="margin: 10px 0 10px 0">
                                            <img style="max-width: 700px">
                                            
                                          
                                                <p align="center">${NTMap.NOTICE_CONTENT}</p>
                                           
                                           
                                        </div>
                                    </div>
                                    <!--//seem_cont-->
                                </div>
                                <div class="board_view_content" style="border-bottom: 1px solid #dbdbdb;">
                                	<img alt="" style="width: 400px; height: 600px" src="/ezenwood/resource/image/${NTMap.NOTICE_IMAGE}">
                                </div>
                               
                                 
                                
                                <!--//board_view_content-->
                              
                            <!--//board_zone_view-->
                          
                        </div>
                          <div style="text-align: center">
									<br>
									<input type="hidden" value="${NTMap.NOTICE_NUM}" name="NOTICE_NUM">
									<button type="button" class="btn btn-success"
										onclick="location.href='${contextPath}/admin/notice/update/${NTMap.NOTICE_NUM}'">??????</button>
									<button type="reset" class="btn btn-default"
									onclick="location.href='${contextPath}/admin/notice/1'">????????????</button>
									<button type="button" class="btn btn-success"
										onclick="location.href='${contextPath}/admin/notice/del/${NTMap.NOTICE_NUM}'">??????</button>
								
								</div>
                        <!--//board_zone_cont-->
                    </div>
                </div>
            </div>
        </div>
       </div>
    </div>
    		
</div>
</body>
</html>
