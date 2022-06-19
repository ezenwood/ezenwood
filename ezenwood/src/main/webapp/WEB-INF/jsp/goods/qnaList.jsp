<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이젠 우드</title>
<link rel="shortcut icon" href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">
    
    <script type="text/javascript">
    var ddd = document.location.href;
    var idx = ddd.lastIndexOf("&");
    
    var sss = ddd.substring(0,idx+1);
    
    function fn_search(pageNo){
    	location.href = sss+"p="+pageNo;
    }
    
    
    function insu(goodsNum){
    	
    	location.href = "qna/write?GOODS_NUM="+goodsNum;
    }
    
    
    
    </script>
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
                                                <c:when test="${fn:length(QNAListMap) > 0}">
                                                    <c:forEach items="${QNAListMap}" var="row">
                                                        <tr>
                                                            <td><fmt:formatDate value="${row.QNA_DATE }" type="both" dateStyle="medium" timeStyle="medium" /></td>
                                                            <td class="title">
                                                                <a href="/ezenwood/goods/qna/${row.QNA_NUM }" name="title">${row.QNA_TITLE }</a>
                                                                
                                                            </td>
                                                            <%-- <td>${row.QNA_WRITER }</td> --%>
                                                            <td>${MEMBER_NAME }</td>
                                                            <td><c:choose> <c:when test="${row.QNA_RE_GB =='Y'}">답변 완료</c:when><c:otherwise>답변 대기</c:otherwise> </c:choose>  </td>
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
                                <div class="pagination" style="text-align: center;">
                                   <c:if test="${not empty paginationInfo}">
		<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
	</c:if>
                                </div>
                            </div>

                            <div class="btn_right_box">
                                <button type="button" class="btn_write" onclick="insu(${GOODS_NUM})">
                                    문의하기
                                </button>
                            </div>
                        </div>

                    </div>
                    
                </div>
                
            </div>
        </div>
    </div>
    <%@include file ="/include/footer.jsp" %>
</body>

</html>