<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">

<title>Notice</title>
</head>
<body>
<div id="container">
        <div id="contents">
            <div class="sub_content">
                <div class="content">
                    <div class="board_zone_sec">
                        <div class="board_zone_tit">
                            <h2>Notice</h2>
                        </div>

                        <div class="board_zone_cont">
                            <div class="board_zone_list" align="center">
                                
                                    <table class="board_list_table" style="width: 100%">
                                        <colgroup>
										<col style="width: 6%">
										<col style="width: 37%">
										<col style="width: 12%">
									</colgroup>
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>날짜</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="list" items="noticeboardlist">
										<tr>
											<td align="center">번호데이터</td>
											<td align="center"><a href="제목 데이터 넘어오는 코드"> <strong>제목
														데이터코드</strong>
											</a></td>
											<td align="center">날짜 데이터코드</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								<!-- //board_zone_list -->
							</div>
							<!-- //board_zone_cont -->
						</div>
						<!-- //board_zone_sec -->

					</div>
					<!-- //sub_content -->
				</div>
				<!-- //본문 끝 contents -->
			</div>
		</div>
	</div>
</body>
</html>