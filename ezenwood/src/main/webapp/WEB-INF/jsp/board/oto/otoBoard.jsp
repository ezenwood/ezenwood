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
                            <h2>1:1 문의</h2>
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
											<th>문의 상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="otoboardlist">
											<tr>
												<td align="center">날짜 데이터</td>
												<td align="center"><a href="제목 데이터 넘어오는 코드"> <strong>제목
															데이터코드</strong>
												</a></td>
												<td align="center">관리자</td>
												<td align="center">상태 넘어오는 코드</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- //board_zone_list -->
							</div>
							<!-- //board_zone_cont -->
						</div>
						<!-- //board_zone_sec -->
						<div class="pagination">페이징 자리</div>

					</div>
					<!-- //sub_content -->
				</div>
				<!-- //본문 끝 contents -->
			</div>
		</div>
	</div>
    </div>
    
</body>
</html>