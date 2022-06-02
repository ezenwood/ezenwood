<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/common.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layer.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/goods.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/list.css" type="text/css" rel="stylesheet">

</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="sub_content">
				<div class="content">
					<div class="menu_top_list">
						<ul>
							<li><a href="#">최신순</a></li>
							<li><a href="#">인기순</a></li>
							<li><a href="#">가격 높은 순</a></li>
							<li><a href="#">가격 낮은 순</a></li>
						</ul>
					</div>

					<div class="goods_list_item">
						<div class="goods_list">
							<div class="goods_list_cont">
								<!--상품 리스트-->
								<div class="item_gallery_type">
									<ul>
										<c:forEach items="${goodsList }" var="goodsMap"
											varStatus="stat">
											<li style="width: 33.3333333%">
												<div class="item_cont">
													<div class="item_photo_box">
														<a href="/ezenwood/goods?idx=${goodsMap.GOODS_NUM }"> <img src="/ezenwood/resource/image/pet1.jpg" width="400"
															height="600" alt="상품 이름" title="상품 이름" class="middle">
														</a>
													</div>

													<div class="item_info_cont">
														<div class="item_tit_box">
															<a href="#"> <strong class="item_name"> ${goodsMap.GOODS_TITLE } </strong>
															</a>
														</div>

														<div class="item_money_box">
															<strong class="item_price"> <span>${goodsMap.GOODS_PRICE }</span>
															</strong>
														</div>

														<div class="item_icon_box"></div>
													</div>
												</div>
											</li>
										</c:forEach>



									</ul>
								</div>

								<!--//item_gallery_type-->
								<!--//상품 리스트-->

							</div>
						</div>

						<div class="pagination">
							<div class="pagination">
								<ul>
									<li class="on"><span>1</span></li>
									<li><a href="#">2</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- //goods_list_item-->
				</div>

			</div>
		</div>

		<!-- //본문 끝-->
	</div>
	<!--// container-->
	<%@include file="/include/footer.jsp"%>
</body>
</html>