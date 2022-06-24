<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">


var ddd = document.location.href;

var idx = ddd.lastIndexOf("=");

var sss = ddd.substring(idx+1);


function fn_search(pageNo) {
	
	
	
	var form = document.createElement("form");
	
	form.setAttribute("method","get");
	
	form.setAttribute("action","/ezenwood/admin/order");
	
	
	var input_pageNum = document.createElement("input");
	var input_searchType = document.createElement("input");
	var input_searchOption = document.createElement("input");
	var input_searchKeyword = document.createElement("input");
	
	
	
	var searchType ='${pagingMap.searchType}'
	var searchOption = '${pagingMap.searchOption}'
	var searchKeyword = '${pagingMap.searchKeyword}'
	
	
	input_pageNum.setAttribute("type", "hidden");
	input_pageNum.setAttribute("name", "PageNum");
	input_pageNum.setAttribute("value", pageNo);
	
	input_searchType.setAttribute("type", "hidden");
	input_searchType.setAttribute("name", "searchType");
	input_searchType.setAttribute("value", searchType);
	
	if(searchOption==0||searchKeyword==''||searchKeyword==null){
		
	}else{
		input_searchOption.setAttribute("type", "hidden");
		input_searchOption.setAttribute("name", "searchOption");
		input_searchOption.setAttribute("value", searchOption);
		input_searchKeyword.setAttribute("type", "hidden");
		input_searchKeyword.setAttribute("name", "searchKeyword");
		input_searchKeyword.setAttribute("value", searchKeyword);
		form.appendChild(input_searchKeyword); 
		form.appendChild(input_searchOption); 
	}
	
	
	form.appendChild(input_pageNum); 
	form.appendChild(input_searchType); 
	
	
	
	
	
	
	document.body.appendChild(form);
	
	form.submit();

	
}

</script>
    <meta charset="UTF-8">
    <title>orderList</title>
    <link href="css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
    <style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
</style>
</head>
<body>
<%@include file ="/include/admin_header.jsp" %>
<%@include file ="/include/admin_left.jsp" %>
        <div id="wrapper">
        <div id="page-wrapper" style="min-height: 703px;">
    <div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">주문목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         주문목록페이지 검색, 수정, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/ezenwood/admin/order?PageNum=1&searchType=7"><button type="button" class="btn btn-outline btn-default">전체</button></a>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--주문상태--</option>
								<option value ="/ezenwood/admin/order?PageNum=1&searchType=1">결제대기 중</option>
								<option value ="/ezenwood/admin/order?PageNum=1&searchType=2">결제 완료</option>
								<option value ="/ezenwood/admin/order?PageNum=1&searchType=3">배송준비 중</option>
								<option value ="/ezenwood/admin/order?PageNum=1&searchType=4">배송 중</option>
								<option value ="/ezenwood/admin/order?PageNum=1&searchType=5">배송 완료</option>
								<option value ="/ezenwood/admin/order?PageNum=1&searchType=6">결제 취소</option>
							
							</select>													
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 주문수 :${TOTAL_COUNT } </div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table  table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row" style="vertical-align:middle;">
										<th style="width: 5%; text-align:center;vertical-align:middle;">주문번호</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">송장번호</th>										
										<th style="width: 16%; text-align:center;vertical-align:middle;">주문상품</th>
										<th style="width: 7%; text-align:center;vertical-align:middle;">회원ID</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">주문금액합계</th>
										<th style="width: 12%; text-align:center;vertical-align:middle;">결재방식</th>
										<th style="width: 5%; text-align:center;vertical-align:middle;">주문일자</th>
										<th style="width: 6%; text-align:center;vertical-align:middle;">배송상태</th>	
									</tr>
								</thead>
								<tbody>
								
									<c:forEach items="${orderListMap }" var="orderMap" >
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;"><a href="/ezenwood/admin/order/${orderMap.ORDERS_NUM }">${orderMap.ORDERS_NUM }</a></td>										
										<td style="text-align:center;vertical-align:middle;">${orderMap.ORDERS_TRACK }</td>
										<td style="text-align:center;vertical-align:middle;"><a href="/ezenwood/goods?idx=${orderMap.ORDERS_GOODS_NUM }">${orderMap.GOODS_TITLE}</a></td>
										
										<td style="text-align:center;vertical-align:middle;">${orderMap.MEMBER_ID }</td>
										<td style="text-align:center;vertical-align:middle;">${orderMap.ORDERS_TCOST }</td>
										
										<td style="text-align:center;vertical-align:middle;">${orderMap.ORDERS_PAY }</td>
										
										<td style="text-align:center;vertical-align:middle;">${orderMap.ADATE }</td>
										
										<td style="text-align:center;vertical-align:middle;">${orderMap.DELIVERY_STATUES }</td>										
										</tr>
									
									</c:forEach>
								
								<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(orderList) le 0}">
										<tr><td colspan="9" style="text-align:center;"> </td></tr>
									</c:if> 
								</tbody>
							</table>
						</div>
					</div>
					<div class="content-center">
					<div class="insu" style="margin: 0 auto; text-align: center;">
									<c:if test="${not empty paginationInfo}">
										<ui:pagination paginationInfo="${paginationInfo}" type="text"
											jsFunction="fn_search" />
									</c:if>
								</div>
                    </div>
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="/ezenwood/admin/order">
									<input type="hidden" name="searchType" value="${pagingMap.searchType}">
									<select class="form-control" name="searchOption" id="searchNum">
										<option value="1">ID</option>
										<option value="2">주문 번호</option>
									</select>
										<input class="form-control" type="text" name="searchKeyword" id="isSearch"/>
										<span>
										<button type="submit" class="btn btn-default">검색</button>
										</span>
									</form>
								</div>							
							</div>
							
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
</div>
</div>
</body>
</html>