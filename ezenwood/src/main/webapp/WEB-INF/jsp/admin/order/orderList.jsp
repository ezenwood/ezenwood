<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
    <div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">�ֹ����</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         �ֹ���������� �˻�, ����, ���� ����ϴ� �������Դϴ�.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/pet/admin/adminOrderAllList.dog?searchNum=0&isSearch="><button type="button" class="btn btn-outline btn-default">��ü</button></a>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value ="">--�ֹ�����--</option>
								<option value ="/ezenwood/admin/order?searchNum=2&isSearch=������� ��">������� ��</option>
								<option value ="/ezenwood/admin/order?searchNum=2&isSearch=���� �Ϸ�">���� �Ϸ�</option>
								<option value ="/ezenwood/admin/order?searchNum=2&isSearch=����غ� ��">����غ� ��</option>
								<option value ="/ezenwood/admin/order?searchNum=2&isSearch=��� ��">��� ��</option>
								<option value ="/ezenwood/admin/order?searchNum=2&isSearch=��� �Ϸ�">��� �Ϸ�</option>
								<option value ="/ezenwood/admin/order?searchNum=2&isSearch=���� ���">���� ���</option>
							
							</select>													
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">�� �ֹ��� : ${totalCount}</div>
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
										<th style="width: 5%; text-align:center;vertical-align:middle;">�ֹ���ȣ</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">�����ȣ</th>										
										<th style="width: 16%; text-align:center;vertical-align:middle;">�ֹ���ǰ</th>
										<th style="width: 7%; text-align:center;vertical-align:middle;">ȸ��ID</th>
										<th style="width: 8%; text-align:center;vertical-align:middle;">�ֹ��ݾ��հ�</th>
										<th style="width: 12%; text-align:center;vertical-align:middle;">������</th>
										<th style="width: 5%; text-align:center;vertical-align:middle;">�ֹ�����</th>
										<th style="width: 6%; text-align:center;vertical-align:middle;">��ۻ���</th>	
									</tr>
								</thead>
								<tbody>
								<c:forEach var="orderList"  items="${orderList}" varStatus="stat">
								<c:url var="viewURL" value="orderModifyForm.dog" >
									<c:param name="order_num" value="${orderList.order_num }" />
								</c:url>									
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">1234-1</td>										
										<td style="text-align:center;vertical-align:middle;">112354</td>
										<td style="text-align:center;vertical-align:middle;">��Ʋ���̺�</td>
										
										<td style="text-align:center;vertical-align:middle;">admin</td>
										<td style="text-align:center;vertical-align:middle;"><fmt:formatNumber value="${orderList.order_sum_money}" type="number"/>19,900</td>
										
										<td style="text-align:center;vertical-align:middle;">�������Ա�</td>
										
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${orderList.order_date}" pattern="YY.MM.dd HH:mm" />22-05-10</td>
										
										<td style="text-align:center;vertical-align:middle;">�����</td>										
										
								</c:forEach>
								<!--  ��ϵ� ��ǰ�� ������ -->
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
										<option value="1">�ֹ� ��ȣ</option>
									</select>
										<input class="form-control" type="text" name="isSearch" id="isSearch"/>
										<span>
										<button type="submit" class="btn btn-default">�˻�</button>
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

</body>
</html>