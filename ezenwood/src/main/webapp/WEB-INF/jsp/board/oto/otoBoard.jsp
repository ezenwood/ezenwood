<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="UTF-8">
<title>onetoone</title>
    <link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div id="container">
        <div id="contents">
            <div class="sub_content">
                <div class="content">
                    <div class="board_zone_sec">
                        <div class="board_zone_tit">
                            <h2>1:1 ����</h2>
                        </div>

                        <div class="board_zone_cont">
                            <div class="board_zone_list">
                                <div class="board_list_qa" align="center">
                                    <table class="board_list_table" style="width: 100%">
                                        <colgroup>
                                            <col style="width: 20%" />
                                            <!--���� ��¥-->
                                            <col>
                                            <!--����-->
                                            <col style="width: 15%" />
                                            <!--�ۼ���-->
                                            <col style="width: 15%" />
                                            <!--���� ����-->
                                        </colgroup>
									<thead>
										<tr>
											<th>���ǳ�¥</th>
											<th>����</th>
											<th>�ۼ���</th>
											<th>���� ����</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="otoboardlist">
											<tr>
												<td align="center">��¥ ������</td>
												<td align="center"><a href="���� ������ �Ѿ���� �ڵ�"> <strong>����
															�������ڵ�</strong>
												</a></td>
												<td align="center">������</td>
												<td align="center">���� �Ѿ���� �ڵ�</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- //board_zone_list -->
							</div>
							<!-- //board_zone_cont -->
						</div>
						<!-- //board_zone_sec -->
						<div class="pagination">����¡ �ڸ�</div>

					</div>
					<!-- //sub_content -->
				</div>
				<!-- //���� �� contents -->
			</div>
		</div>
	</div>
    </div>
    
</body>
</html>