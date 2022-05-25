<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AdminGoodsList</title>
    <link href="../css/bootstrapadmin.min.css" type="text/css" rel="stylesheet">
</head>
<body>
        <div id="wrapper">
        <div id="page-wrapper" style="min-height: 703px;">
       		
            <!-- ����container-->
           	 
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">��ǰ���</h1>
</div>
<div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> ��ǰ����������� �˻�,����,���� ��� �������Դϴ�.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
    <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/pet/admin/goodsadminList.dog?searchNum=0&amp;isSearch="><button type="button" class="btn btn-outline btn-default">��ü</button></a>
							<select class="form-control" name="select" onchange="window.open(value,'_self');">
								<option value="">--ī�װ�--</option>
								<option value="/ezenwood/admin/goods?searchNum=2&amp;isSearch=0">TABLE</option>
								<option value="/ezenwood/admin/goods?searchNum=2&amp;isSearch=1">CHAIR</option>
								<option value="/ezenwood/admin/goods?searchNum=2&amp;isSearch=2">SOFA</option>
								<option value="/ezenwood/admin/goods?searchNum=2&amp;isSearch=3">BED</option>
								<option value="/ezenwood/admin/goods?searchNum=2&amp;isSearch=4">CHEST</option>
							</select>						
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">�� ��ǰ ��ϼ� : 2</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 6%; text-align:center;">��ȣ</th>
										<th style="width: 8%; text-align:center;">��ǰ����</th>
										<th style="width: 8%; text-align:center;">ī�װ�</th>				
										<th style="width: 32%; text-align:center;">��ǰ��</th>
										<th style="width: 10%; text-align:center;">����</th>
										<th style="width: 6%; text-align:center;">����</th>
										<th style="width: 10%; text-align:center;">�������</th>
									</tr>
								</thead>
								<tbody>
										<tr>
										<td>1</td>
                                        <td>   
                                        <img src="image/������1.jpg" alt="Missing Image">
                                        </td>
                                        <td>
                                        TABLE
                                        </td>
                                        <td>
                                        ��Ʋ���̺�
                                        </td>
                                        <td>
                                        19,900
                                        </td>
                                        <td>
                                        2
                                        </td>
                                        <td>
                                        22-05-10
                                        </td>
									  </tr>
									  
									  	<tr>
										<td>2</td>
                                        <td>   
                                        <img src="image/������1.jpg" alt="Missing Image">
                                        </td>
                                        <td>
                                        SOFA
                                        </td>
                                        <td>
                                        ��Ʋ����
                                        </td>
                                        <td>
                                        19,800
                                        </td>
                                        <td>
                                        3
                                        </td>
                                        <td>
                                        22-05-11
                                        </td>
									  </tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">��ǰ ����</option>
									</select>
										<input class="form-control" type="text" name="isSearch" id="isSearch">
										<span>
										<button type="submit" class="btn btn-default">�˻�</button>
										</span>
									</form>
								</div>							
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
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
    </div>
            </div>
            </div>
    </div>
</body>
</html>