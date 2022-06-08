<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
							<a href="/ezenwood/admin/orderList?searchNum=0&isSearch="><button type="button" class="btn btn-outline btn-default">전체</button></a>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--주문상태--</option>
								<option value ="/ezenwood/admin/order?searchNum=2&isSearch=결제대기 중">결제대기 중</option>
								<option value ="/ezenwood/admin/order?searchNum=2&isSearch=결제 완료">결제 완료</option>
								<option value ="/ezenwood/admin/order?searchNum=2&isSearch=배송준비 중">배송준비 중</option>
								<option value ="/ezenwood/admin/order?searchNum=2&isSearch=배송 중">배송 중</option>
								<option value ="/ezenwood/admin/order?searchNum=2&isSearch=배송 완료">배송 완료</option>
								<option value ="/ezenwood/admin/order?searchNum=2&isSearch=결제 취소">결제 취소</option>
							
							</select>													
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 주문수 :1 </div>
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
								
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">1234-1</td>										
										<td style="text-align:center;vertical-align:middle;">112354</td>
										<td style="text-align:center;vertical-align:middle;">위틀테이블</td>
										
										<td style="text-align:center;vertical-align:middle;">admin</td>
										<td style="text-align:center;vertical-align:middle;"><fmt:formatNumber value="${orderList.order_sum_money}" type="number"/>19,900</td>
										
										<td style="text-align:center;vertical-align:middle;">무통장입금</td>
										
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${orderList.order_date}" pattern="YY.MM.dd HH:mm" />22-05-10</td>
										
										<td style="text-align:center;vertical-align:middle;">배송전</td>										
										
								
								<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(orderList) le 0}">
										<tr><td colspan="9" style="text-align:center;"> </td></tr>
									</c:if> 
								</tbody>
							</table>
						</div>
					</div>
					<div class="content-center">
					<ul class="pagination">
	                <li class="page-item active" aria-current="page">
                      <span class="page-link">
                        1
                     <span class="sr-only">(current)</span>
                      </span>
                    </li>
	                <li class="page-item"><a class="page-link" href="#">2</a></li>
	                <li class="page-item"><a class="page-link" href="#">3</a></li>
                    </ul>
                    </div>
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">ID</option>
										<option value="1">주문 번호</option>
									</select>
										<input class="form-control" type="text" name="isSearch" id="isSearch"/>
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