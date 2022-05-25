<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>noticeList</title>
        <link href="css/reset.css" type="text/css" rel="stylesheet">
    <link href="css/common.css" type="text/css" rel="stylesheet">
    <link href="css/board.css" type="text/css" rel="stylesheet">
    <link href="css/layout.css" type="text/css" rel="stylesheet">
</head>
<body>
   <div id="container">
        <div id="contents">
        <!-- 본문 시작 -->

            <!-- //location_wrap -->
            <div class="location_wrap">
                <div class="location_cont">
                    <em><a href="#" class="local_home">HOME</a> &gt; FREQUIESTION</em>
                </div>
            </div>
            <div class="sub_content">

                <!-- //side_cont -->
<div class="content">
<div class="board_zone_sec">
    <div class="board_zone_tit">
        <h2>자주묻는질문</h2>
    </div>
    <div class="board_zone_cont">
        <div class="board_zone_list" align="center">
            <table class="board_list_table" style="width:100%">
                <colgroup>
                    <col style="width:5%">
                    <col style="width:30%;">
                    <col style="width:5%">
                </colgroup>
                <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>날짜</th>
                </tr>
                </thead>
                <tbody>

             
                <tr data-sno="130" data-auth="c" style="height:10px">
                    <td>
                        2
                    </td>
                    <td class="board_tit">   
                    <details>
                        <summary>결제는 어떻게 할까</summary>
                        결제는 졀제결제~
                    </details> 
                    </td>
                    <td>
                        22.05.24
                    </td>
                
                </tr>
               <tr data-sno="130" data-auth="c" style="height:10px">
                    <td>
                        1
                    </td>
                    <td class="board_tit">
                         <details>
                        <summary>사이트 오류가 남</summary>
                        사이트 오류오류
                    </details> 
                    </td>
                      <td>
                        22.05.23
                    </td>
                </tr>

                </tbody>
            </table>


            <div class="pagination"><ul><li class="on"><span>1</span></li></ul></div>

            <!-- //pagination -->

        </div>
        <!-- //board_zone_list -->
    </div>
    <!-- //board_zone_cont -->
</div>
<!-- //board_zone_sec -->


<div id="layerDim" class="dn">&nbsp;</div>

</div>
<!-- //content -->
            </div>
            <!-- //sub_content -->
        </div>
        <!-- //본문 끝 contents -->
    </div>
</body>
</html>